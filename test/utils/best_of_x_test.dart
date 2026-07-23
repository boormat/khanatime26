import 'package:flutter_test/flutter_test.dart';
import 'package:khanatime26/data/models/run_result.dart';
import 'package:khanatime26/utils/best_of_x.dart';

RunResult _makeRun({
  required int carNumber,
  int? startTimestamp,
  int? finishTimestamp,
  String startStatus = 'clean',
  String finishStatus = 'clean',
  int markerHits = 0,
}) {
  return RunResult(
    eventId: 'e1',
    testNumber: 1,
    carNumber: carNumber,
    runNumber: 1,
    startTimestamp: startTimestamp,
    startStatus: startStatus,
    finishTimestamp: finishTimestamp,
    markerHits: markerHits,
    finishStatus: finishStatus,
  );
}

void main() {
  group('bestOfX', () {
    test('best 1 of 1', () {
      final runs = [_makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: 50000)];
      final result = bestOfX(runs: runs, bestX: 1, totalTests: 1, slowestCleanMs: 60000);
      expect(result.testsCompleted, 1);
      expect(result.aggregateMs, 50000);
      expect(result.status, 'done');
      expect(result.countingRuns.length, 1);
    });

    test('best 2 of 3 picks two fastest', () {
      final runs = [
        _makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: 50000),  // 50s
        _makeRun(carNumber: 8, startTimestamp: 0, finishTimestamp: 40000),  // 40s
        _makeRun(carNumber: 9, startTimestamp: 0, finishTimestamp: 60000),  // 60s
      ];
      final result = bestOfX(runs: runs, bestX: 2, totalTests: 3, slowestCleanMs: 60000);
      expect(result.testsCompleted, 3);
      expect(result.countingRuns.length, 2);
      expect(result.aggregateMs, 90000); // 40s + 50s
      expect(result.status, 'done');
    });

    test('DNS runs add slowest + 10s penalty', () {
      final runs = [
        _makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: 50000),
        _makeRun(carNumber: 7, startStatus: 'dns', startTimestamp: 0),
      ];
      final result = bestOfX(runs: runs, bestX: 1, totalTests: 2, slowestCleanMs: 50000);
      // DNS penalty: 50000 + 10000 = 60000, capped at 100000
      // Aggregate: 50000 (clean) + 60000 (DNS) = 110000
      expect(result.aggregateMs, 110000);
    });

    test('status short when some tests completed', () {
      final runs = [
        _makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: 50000),
      ];
      final result = bestOfX(runs: runs, bestX: 2, totalTests: 3, slowestCleanMs: 60000);
      expect(result.status, 'short');
      expect(result.testsCompleted, 1);
    });

    test('status open when no tests completed', () {
      final result = bestOfX(runs: [], bestX: 1, totalTests: 1, slowestCleanMs: 60000);
      expect(result.status, 'open');
      expect(result.testsCompleted, 0);
    });

    test('aggregate sums net times including penalties', () {
      final runs = [
        _makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: 50000, markerHits: 1),  // 50s + 5s = 55s
        _makeRun(carNumber: 8, startTimestamp: 0, finishTimestamp: 45000),  // 45s
      ];
      final result = bestOfX(runs: runs, bestX: 2, totalTests: 2, slowestCleanMs: 60000);
      expect(result.aggregateMs, 100000); // 55000 + 45000
    });

    test('penaltyForRun returns correct penalty', () {
      final run = _makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: 50000, markerHits: 2);
      final penalty = penaltyForRun(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 10000); // 2 flags × 5s
    });

    test('netTime returns null for incomplete run', () {
      final run = _makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: null);
      final result = netTime(run, slowestCleanMs: 60000);
      expect(result, isNull);
    });

    test('netTime returns elapsed + penalty for complete run', () {
      final run = _makeRun(carNumber: 7, startTimestamp: 0, finishTimestamp: 50000, markerHits: 1);
      final result = netTime(run, slowestCleanMs: 60000);
      expect(result, 55000); // 50s + 5s flags
    });
  });
}
