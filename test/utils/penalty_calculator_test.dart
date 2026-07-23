import 'package:flutter_test/flutter_test.dart';
import 'package:khanatime26/data/models/run_result.dart';
import 'package:khanatime26/utils/penalty_calculator.dart';

RunResult _makeRun({
  String startStatus = 'clean',
  int? startTimestamp = 100000,
  int? finishTimestamp = 110000,
  int markerHits = 0,
  String finishStatus = 'clean',
}) {
  return RunResult(
    eventId: 'e1',
    testNumber: 1,
    carNumber: 7,
    runNumber: 1,
    startTimestamp: startTimestamp,
    startStatus: startStatus,
    finishTimestamp: finishTimestamp,
    markerHits: markerHits,
    finishStatus: finishStatus,
  );
}

void main() {
  group('calculatePenalty', () {
    test('clean run has zero penalty', () {
      final run = _makeRun();
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 0);
      expect(penalty.status, 'clean');
      expect(penalty.label, 'Clean');
    });

    test('flags penalty is 5s per flag', () {
      final run = _makeRun(markerHits: 2);
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 10000);
      expect(penalty.label, contains('2F'));
    });

    test('single flag penalty', () {
      final run = _makeRun(markerHits: 1);
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 5000);
      expect(penalty.label, contains('1F'));
    });

    test('NFG penalty is 5s flat', () {
      final run = _makeRun(finishStatus: 'nfg');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 5000);
      expect(penalty.label, contains('NFG'));
    });

    test('NFG + flags', () {
      final run = _makeRun(finishStatus: 'nfg', markerHits: 2);
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 15000); // 5000 NFG + 10000 flags
    });

    test('jump start adds 5s', () {
      final run = _makeRun(startStatus: 'jump_start');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 5000);
    });

    test('DNS uses slowest + 10s, capped at 2x', () {
      final run = _makeRun(startStatus: 'dns', finishTimestamp: null);
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 70000); // 60000 + 10000 = 70000, capped at 120000
      expect(penalty.status, 'dns');
    });

    test('DNS cap at 2x slowest', () {
      final run = _makeRun(startStatus: 'dns', finishTimestamp: null);
      final penalty = calculatePenalty(run, slowestCleanMs: 4000);
      expect(penalty.penaltyMs, 8000); // 4000 + 10000 = 14000, capped at 8000
    });

    test('wrong direction uses slowest + 5s', () {
      final run = _makeRun(finishStatus: 'wrong_direction');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 65000);
    });

    test('wrong direction capped at 2x', () {
      final run = _makeRun(finishStatus: 'wrong_direction');
      final penalty = calculatePenalty(run, slowestCleanMs: 3000);
      expect(penalty.penaltyMs, 6000); // 3000 + 5000 = 8000, capped at 6000
    });

    test('wrong order uses slowest + 10s', () {
      final run = _makeRun(finishStatus: 'wrong_order');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 70000);
    });

    test('wrong order capped at 2x', () {
      final run = _makeRun(finishStatus: 'wrong_order');
      final penalty = calculatePenalty(run, slowestCleanMs: 4000);
      expect(penalty.penaltyMs, 8000); // 4000 + 10000 = 14000, capped at 8000
    });

    test('missed stop uses slowest + 5s', () {
      final run = _makeRun(finishStatus: 'missed_stop');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 65000);
    });

    test('reversed uses slowest + 5s', () {
      final run = _makeRun(finishStatus: 'reversed');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 65000);
    });

    test('DNF uses slowest + 5s', () {
      final run = _makeRun(finishStatus: 'dnf');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 65000);
    });

    test('DSQ has zero time penalty', () {
      final run = _makeRun(finishStatus: 'dsq');
      final penalty = calculatePenalty(run, slowestCleanMs: 60000);
      expect(penalty.penaltyMs, 0);
      expect(penalty.status, 'dsq');
    });
  });
}
