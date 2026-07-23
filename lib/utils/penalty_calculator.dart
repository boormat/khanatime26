import 'package:khanatime26/data/models/penalty.dart';
import 'package:khanatime26/data/models/run_result.dart';

/// Calculate penalty for a run based on finish status and marker hits.
///
/// [slowestCleanMs] is the slowest clean elapsed time in the test,
/// used to cap slowest-based penalties at 2× that value.
Penalty calculatePenalty(RunResult run, {required int slowestCleanMs}) {
  // Start penalties
  if (run.startStatus == 'dns') {
    final raw = slowestCleanMs + 10000;
    final capped = raw > slowestCleanMs * 2 ? slowestCleanMs * 2 : raw;
    return Penalty(
      penaltyMs: capped,
      status: 'dns',
      label: 'DNS',
    );
  }

  if (run.startStatus == 'jump_start') {
    final base = _finishPenaltyMs(run, slowestCleanMs);
    return Penalty(
      penaltyMs: base + 5000,
      status: run.finishStatus,
      label: 'JS+${_formatPenaltyTime(base + 5000)}',
    );
  }

  // Finish penalties (no start penalty)
  return _finishPenalty(run, slowestCleanMs);
}

Penalty _finishPenalty(RunResult run, int slowestCleanMs) {
  final ms = _finishPenaltyMs(run, slowestCleanMs);
  final label = _finishLabel(run, ms);
  return Penalty(
    penaltyMs: ms,
    status: run.finishStatus,
    label: label,
  );
}

int _finishPenaltyMs(RunResult run, int slowestCleanMs) {
  final finishStatus = run.finishStatus;

  if (finishStatus == 'dsq') return 0; // DSQ is terminal, no time added

  // Flag penalty (+5s per flag)
  var penalty = run.markerHits * 5000;

  // NFG (+5s flat, flags already added above)
  if (finishStatus == 'nfg') {
    penalty += 5000;
  }

  // Slowest-based penalties
  switch (finishStatus) {
    case 'wrong_direction':
    case 'missed_stop':
    case 'reversed':
    case 'dnf':
      penalty += _cappedSlowest(slowestCleanMs, 5000);
      break;
    case 'wrong_order':
      penalty += _cappedSlowest(slowestCleanMs, 10000);
      break;
  }

  return penalty;
}

/// Slowest + extra, capped at 2× slowest.
int _cappedSlowest(int slowestMs, int extraMs) {
  final raw = slowestMs + extraMs;
  final cap = slowestMs * 2;
  return raw > cap ? cap : raw;
}

String _finishLabel(RunResult run, int totalPenaltyMs) {
  if (totalPenaltyMs == 0 && run.finishStatus == 'clean') return 'Clean';

  final parts = <String>[];

  if (run.markerHits > 0) {
    parts.add('${run.markerHits}F');
  }
  if (run.finishStatus == 'nfg') parts.add('NFG');
  if (run.finishStatus == 'wrong_direction') parts.add('WD');
  if (run.finishStatus == 'missed_stop') parts.add('MS');
  if (run.finishStatus == 'reversed') parts.add('REV');
  if (run.finishStatus == 'dnf') parts.add('DNF');
  if (run.finishStatus == 'wrong_order') parts.add('WO');
  if (run.finishStatus == 'dsq') return 'DSQ';

  if (parts.isEmpty) return '+${_formatPenaltyTime(totalPenaltyMs)}';
  return '${parts.join('+')} +${_formatPenaltyTime(totalPenaltyMs)}';
}

String _formatPenaltyTime(int ms) {
  final seconds = ms ~/ 1000;
  final centiseconds = (ms % 1000) ~/ 10;
  if (centiseconds == 0) return '${seconds}s';
  return '$seconds.${centiseconds.toString().padLeft(2, '0')}s';
}
