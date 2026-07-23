import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/start_events.dart';
import '../tables/finish_events.dart';

part 'timing_dao.g.dart';

@DriftAccessor(tables: [StartEvents, FinishEvents])
class TimingDao extends DatabaseAccessor<AppDatabase> with _$TimingDaoMixin {
  TimingDao(super.db);

  // --- Start events ---

  Future<int> insertStartEvent(StartEventsCompanion start) =>
      into(startEvents).insert(start);

  Future<List<StartEvent>> getStartsForTest(String eventId, int testNumber) =>
      (select(startEvents)
            ..where((s) =>
                s.eventId.equals(eventId) & s.testNumber.equals(testNumber))
            ..orderBy([(s) => OrderingTerm.asc(s.timestamp)]))
          .get();

  Stream<List<StartEvent>> watchStartsForTest(
          String eventId, int testNumber) =>
      (select(startEvents)
            ..where((s) =>
                s.eventId.equals(eventId) & s.testNumber.equals(testNumber))
            ..orderBy([(s) => OrderingTerm.asc(s.timestamp)]))
          .watch();

  /// Pending starts: started but not yet finished for a test.
  Future<List<StartEvent>> pendingStarts(String eventId, int testNumber) {
    // TODO: implement proper subquery for pending starts
    return (select(startEvents)
          ..where((s) =>
              s.eventId.equals(eventId) & s.testNumber.equals(testNumber))
          ..orderBy([(s) => OrderingTerm.desc(s.timestamp)]))
        .get();
  }

  /// Next run number for a car in a test.
  Future<int> nextRunNumber(String eventId, int testNumber, int carNumber) async {
    final runs = await (select(startEvents)
          ..where((s) =>
              s.eventId.equals(eventId) &
              s.testNumber.equals(testNumber) &
              s.carNumber.equals(carNumber))
          ..orderBy([(s) => OrderingTerm.desc(s.runNumber)]))
        .get();
    if (runs.isEmpty) return 1;
    return runs.first.runNumber + 1;
  }

  /// Average start timestamp for a pairing key (multi-stopwatch).
  Future<int?> avgStartTimestamp(
      String eventId, int testNumber, int carNumber, int runNumber) async {
    final starts = await (select(startEvents)
          ..where((s) =>
              s.eventId.equals(eventId) &
              s.testNumber.equals(testNumber) &
              s.carNumber.equals(carNumber) &
              s.runNumber.equals(runNumber) &
              s.status.equals('clean')))
        .get();
    if (starts.isEmpty) return null;
    final sum = starts.fold<int>(0, (prev, s) => prev + s.timestamp);
    return (sum / starts.length).round();
  }

  // --- Finish events ---

  Future<int> insertFinishEvent(FinishEventsCompanion finish) =>
      into(finishEvents).insert(finish);

  Future<List<FinishEvent>> getFinishesForTest(
          String eventId, int testNumber) =>
      (select(finishEvents)
            ..where((f) =>
                f.eventId.equals(eventId) & f.testNumber.equals(testNumber))
            ..orderBy([(f) => OrderingTerm.asc(f.timestamp)]))
          .get();

  Stream<List<FinishEvent>> watchFinishesForTest(
          String eventId, int testNumber) =>
      (select(finishEvents)
            ..where((f) =>
                f.eventId.equals(eventId) & f.testNumber.equals(testNumber))
            ..orderBy([(f) => OrderingTerm.asc(f.timestamp)]))
          .watch();

  /// Average finish timestamp for a pairing key.
  Future<int?> avgFinishTimestamp(
      String eventId, int testNumber, int carNumber, int runNumber) async {
    final finishes = await (select(finishEvents)
          ..where((f) =>
              f.eventId.equals(eventId) &
              f.testNumber.equals(testNumber) &
              f.carNumber.equals(carNumber) &
              f.runNumber.equals(runNumber) &
              f.status.equals('clean')))
        .get();
    if (finishes.isEmpty) return null;
    final sum = finishes.fold<int>(0, (prev, f) => prev + f.timestamp);
    return (sum / finishes.length).round();
  }

  /// Watch starts that have no matching finish for a test.
  Stream<List<StartEvent>> watchPendingStarts(
      String eventId, int testNumber) async* {
    await for (final starts in watchStartsForTest(eventId, testNumber)) {
      final finishes = await getFinishesForTest(eventId, testNumber);
      final finishedKeys = <_Key>{};
      for (final f in finishes) {
        if (f.carNumber != null && f.runNumber != null) {
          finishedKeys.add(_Key(f.carNumber!, f.runNumber!));
        }
      }
      yield starts
          .where((s) => !finishedKeys.contains(_Key(s.carNumber, s.runNumber)))
          .toList();
    }
  }

  /// Slowest clean elapsed time for a test (for penalty caps).
  Future<int?> slowestCleanTime(String eventId, int testNumber) async {
    final starts = await (select(startEvents)
          ..where((s) =>
              s.eventId.equals(eventId) &
              s.testNumber.equals(testNumber) &
              s.status.equals('clean')))
        .get();
    final finishes = await (select(finishEvents)
          ..where((f) =>
              f.eventId.equals(eventId) &
              f.testNumber.equals(testNumber) &
              f.status.equals('clean')))
        .get();

    if (starts.isEmpty || finishes.isEmpty) return null;

    // Index finishes by pairing key
    final finishMap = <_Key, List<FinishEvent>>{};
    for (final f in finishes) {
      if (f.carNumber != null && f.runNumber != null) {
        final key = _Key(f.carNumber!, f.runNumber!);
        finishMap.putIfAbsent(key, () => []).add(f);
      }
    }

    int? slowest;
    for (final s in starts) {
      final key = _Key(s.carNumber, s.runNumber);
      final matchingFinishes = finishMap[key];
      if (matchingFinishes == null || matchingFinishes.isEmpty) continue;

      final avgFinish = matchingFinishes
          .map((f) => f.timestamp)
          .fold<int>(0, (a, b) => a + b) ~/
          matchingFinishes.length;
      final elapsed = avgFinish - s.timestamp;

      if (slowest == null || elapsed > slowest) {
        slowest = elapsed;
      }
    }

    return slowest;
  }
}

class _Key {
  final int car;
  final int run;
  const _Key(this.car, this.run);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Key && car == other.car && run == other.run;
  @override
  int get hashCode => Object.hash(car, run);
}
