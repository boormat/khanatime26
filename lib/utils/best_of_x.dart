import 'package:khanatime26/data/models/run_result.dart';
import 'package:khanatime26/data/models/penalty.dart';
import 'package:khanatime26/utils/penalty_calculator.dart';

/// Select best X of Y runs and compute aggregate.
BestOfXResult bestOfX({
  required List<RunResult> runs,
  required int bestX,
  required int totalTests,
  required int slowestCleanMs,
}) {
  if (runs.isEmpty) {
    return BestOfXResult(
      countingRuns: const [],
      aggregateMs: 0,
      status: 'open',
      testsCompleted: 0,
    );
  }

  // Calculate net time for each run
  final runPenalties = <RunResult, Penalty>{};
  for (final run in runs) {
    runPenalties[run] = calculatePenalty(run, slowestCleanMs: slowestCleanMs);
  }

  // Sort by net time (elapsed + penalty), DNS/DSQ at end
  final sortable = runs.where((r) => r.status != RunStatus.dns && r.status != RunStatus.dsq).toList();
  sortable.sort((a, b) {
    final aNet = (a.elapsedMs ?? 0) + (runPenalties[a]?.penaltyMs ?? 0);
    final bNet = (b.elapsedMs ?? 0) + (runPenalties[b]?.penaltyMs ?? 0);
    return aNet.compareTo(bNet);
  });

  // Take best X
  final counting = sortable.take(bestX).toList();
  final aggregate = counting.fold<int>(0, (sum, r) {
    final elapsed = r.elapsedMs ?? 0;
    final penalty = runPenalties[r]?.penaltyMs ?? 0;
    return sum + elapsed + penalty;
  });

  // DNS runs count as slowestClean + 10000
  final dnsCount = runs.where((r) => r.status == RunStatus.dns).length;
  final dnsPenalty = slowestCleanMs + 10000;
  final cappedDnsPenalty = dnsPenalty > slowestCleanMs * 2 ? slowestCleanMs * 2 : dnsPenalty;
  final totalAggregate = aggregate + (dnsCount * cappedDnsPenalty);

  // Determine status
  final testsCompleted = runs.where((r) =>
      r.status == RunStatus.done ||
      (r.elapsedMs != null && r.finishStatus != 'dsq')).length;

  String status;
  if (testsCompleted >= totalTests) {
    status = 'done';
  } else if (testsCompleted > 0) {
    status = 'short';
  } else {
    status = 'open';
  }

  return BestOfXResult(
    countingRuns: counting,
    aggregateMs: totalAggregate,
    status: status,
    testsCompleted: testsCompleted,
  );
}

/// Get penalty for a specific run in a test (for display).
Penalty penaltyForRun(RunResult run, {required int slowestCleanMs}) {
  return calculatePenalty(run, slowestCleanMs: slowestCleanMs);
}

/// Compute net time for a run (elapsed + penalty), or null if incomplete.
int? netTime(RunResult run, {required int slowestCleanMs}) {
  if (run.elapsedMs == null) return null;
  final penalty = calculatePenalty(run, slowestCleanMs: slowestCleanMs);
  return run.elapsedMs! + penalty.penaltyMs;
}

class BestOfXResult {
  final List<RunResult> countingRuns;
  final int aggregateMs;
  final String status; // 'done' | 'short' | 'open' | 'none'
  final int testsCompleted;

  const BestOfXResult({
    required this.countingRuns,
    required this.aggregateMs,
    required this.status,
    required this.testsCompleted,
  });
}
