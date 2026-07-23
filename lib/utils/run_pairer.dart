import 'package:khanatime26/data/database/database.dart';
import 'package:khanatime26/data/models/run_result.dart';

/// Pair start and finish events into [RunResult]s.
///
/// Matches by (eventId, testNumber, carNumber, runNumber).
/// Multiple starts or finishes for the same key are averaged.
/// Unmatched starts become inProgress; unmatched finishes become orphan.
List<RunResult> pairRuns({
  required List<StartEvent> starts,
  required List<FinishEvent> finishes,
  required List<Entry> entries,
}) {
  final finishMap = <_PairingKey, List<FinishEvent>>{};
  for (final f in finishes) {
    if (f.carNumber == null || f.runNumber == null) continue;
    final key = _PairingKey(
      eventId: f.eventId,
      testNumber: f.testNumber,
      carNumber: f.carNumber!,
      runNumber: f.runNumber!,
    );
    finishMap.putIfAbsent(key, () => []).add(f);
  }

  final startMap = <_PairingKey, List<StartEvent>>{};
  for (final s in starts) {
    final key = _PairingKey(
      eventId: s.eventId,
      testNumber: s.testNumber,
      carNumber: s.carNumber,
      runNumber: s.runNumber,
    );
    startMap.putIfAbsent(key, () => []).add(s);
  }

  final entryMap = <int, Entry>{};
  for (final e in entries) {
    entryMap[e.carNumber] = e;
  }

  final results = <RunResult>[];
  final seenKeys = <_PairingKey>{};

  for (final entry in startMap.entries) {
    seenKeys.add(entry.key);
    final startList = entry.value;
    final finishList = finishMap[entry.key];

    final avgStart = _avgTimestamp(startList.map((s) => s.timestamp).toList());
    final startStatus = _worstStartStatus(startList);

    int? avgFinish;
    String finishStatus = 'pending';
    int markerHits = 0;
    if (finishList != null && finishList.isNotEmpty) {
      avgFinish = _avgTimestamp(finishList.map((f) => f.timestamp).toList());
      finishStatus = _worstFinishStatus(finishList);
      markerHits = finishList.fold<int>(0, (sum, f) => sum + f.markerHits);
    }

    final entry_ = entryMap[entry.key.carNumber];
    results.add(RunResult(
      eventId: entry.key.eventId,
      testNumber: entry.key.testNumber,
      carNumber: entry.key.carNumber,
      runNumber: entry.key.runNumber,
      startTimestamp: avgStart,
      startStatus: startStatus,
      finishTimestamp: avgFinish,
      markerHits: markerHits,
      finishStatus: finishStatus,
      driverName: entry_?.driverName,
      passenger: entry_?.passenger,
    ));
  }

  for (final entry in finishMap.entries) {
    if (seenKeys.contains(entry.key)) continue;
    final finishList = entry.value;
    final avgFinish = _avgTimestamp(finishList.map((f) => f.timestamp).toList());
    final finishStatus = _worstFinishStatus(finishList);
    final markerHits = finishList.fold<int>(0, (sum, f) => sum + f.markerHits);

    final entry_ = entryMap[entry.key.carNumber];
    results.add(RunResult(
      eventId: entry.key.eventId,
      testNumber: entry.key.testNumber,
      carNumber: entry.key.carNumber,
      runNumber: entry.key.runNumber,
      finishTimestamp: avgFinish,
      finishStatus: finishStatus,
      markerHits: markerHits,
      driverName: entry_?.driverName,
      passenger: entry_?.passenger,
    ));
  }

  results.sort((a, b) {
    final cmp = a.carNumber.compareTo(b.carNumber);
    if (cmp != 0) return cmp;
    return a.runNumber.compareTo(b.runNumber);
  });

  return results;
}

int? _avgTimestamp(List<int> timestamps) {
  if (timestamps.isEmpty) return null;
  final sum = timestamps.fold<int>(0, (prev, t) => prev + t);
  return (sum / timestamps.length).round();
}

String _worstStartStatus(List<StartEvent> starts) {
  if (starts.any((s) => s.status == 'jump_start')) return 'jump_start';
  if (starts.any((s) => s.status == 'dns')) return 'dns';
  if (starts.every((s) => s.status == 'clean')) return 'clean';
  return starts.first.status;
}

String _worstFinishStatus(List<FinishEvent> finishes) {
  const priority = [
    'dsq', 'dnf', 'wrong_order', 'wrong_direction', 'missed_stop',
    'reversed', 'nfg', 'clean', 'unassigned', 'pending',
  ];
  for (final status in priority) {
    if (finishes.any((f) => f.status == status)) return status;
  }
  return finishes.first.status;
}

class _PairingKey {
  final String eventId;
  final int testNumber;
  final int carNumber;
  final int runNumber;

  const _PairingKey({
    required this.eventId,
    required this.testNumber,
    required this.carNumber,
    required this.runNumber,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _PairingKey &&
          eventId == other.eventId &&
          testNumber == other.testNumber &&
          carNumber == other.carNumber &&
          runNumber == other.runNumber;

  @override
  int get hashCode => Object.hash(eventId, testNumber, carNumber, runNumber);
}
