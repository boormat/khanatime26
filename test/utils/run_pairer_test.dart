import 'package:flutter_test/flutter_test.dart';
import 'package:khanatime26/data/database/database.dart';
import 'package:khanatime26/data/models/run_result.dart';
import 'package:khanatime26/utils/run_pairer.dart';

void main() {
  group('pairRuns', () {
    test('matches single start with finish', () {
      final starts = [
        StartEvent(
          id: 1,
          eventId: 'e1',
          testNumber: 1,
          carNumber: 7,
          runNumber: 1,
          timestamp: 100000,
          status: 'clean',
          createdAt: 100000,
        ),
      ];
      final finishes = [
        FinishEvent(
          id: 1,
          eventId: 'e1',
          testNumber: 1,
          carNumber: 7,
          runNumber: 1,
          timestamp: 110000,
          markerHits: 0,
          status: 'clean',
          createdAt: 110000,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: finishes, entries: []);
      expect(results.length, 1);
      expect(results.first.elapsedMs, 10000);
      expect(results.first.status, RunStatus.done);
      expect(results.first.startStatus, 'clean');
      expect(results.first.finishStatus, 'clean');
    });

    test('unmatched start becomes inProgress', () {
      final starts = [
        StartEvent(
          id: 1,
          eventId: 'e1',
          testNumber: 1,
          carNumber: 7,
          runNumber: 1,
          timestamp: 100000,
          status: 'clean',
          createdAt: 100000,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: [], entries: []);
      expect(results.length, 1);
      expect(results.first.finishTimestamp, isNull);
      expect(results.first.status, RunStatus.inProgress);
    });

    test('unmatched finish becomes orphan', () {
      final finishes = [
        FinishEvent(
          id: 1,
          eventId: 'e1',
          testNumber: 1,
          carNumber: 7,
          runNumber: 1,
          timestamp: 110000,
          markerHits: 0,
          status: 'clean',
          createdAt: 110000,
        ),
      ];

      final results = pairRuns(starts: [], finishes: finishes, entries: []);
      expect(results.length, 1);
      expect(results.first.startTimestamp, isNull);
      expect(results.first.finishTimestamp, 110000);
    });

    test('multiple starts are averaged', () {
      final starts = [
        StartEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100000, status: 'clean', createdAt: 100000,
        ),
        StartEvent(
          id: 2, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100200, status: 'clean', createdAt: 100000,
        ),
      ];
      final finishes = [
        FinishEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 110000, markerHits: 0, status: 'clean', createdAt: 110000,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: finishes, entries: []);
      expect(results.first.startTimestamp, 100100);
      expect(results.first.elapsedMs, 9900);
    });

    test('multiple finishes are averaged', () {
      final starts = [
        StartEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100000, status: 'clean', createdAt: 100000,
        ),
      ];
      final finishes = [
        FinishEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 110000, markerHits: 0, status: 'clean', createdAt: 110000,
        ),
        FinishEvent(
          id: 2, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 110400, markerHits: 0, status: 'clean', createdAt: 110000,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: finishes, entries: []);
      expect(results.first.finishTimestamp, 110200);
      expect(results.first.elapsedMs, 10200);
    });

    test('driver name populated from entries', () {
      final starts = [
        StartEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100000, status: 'clean', createdAt: 100000,
        ),
      ];
      final entries = [
        Entry(
          id: 1,
          eventId: 'e1',
          carNumber: 7,
          driverName: 'Smith',
          passenger: 'Jones',
          status: 'active',
          registeredAt: 0,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: [], entries: entries);
      expect(results.first.driverName, 'Smith');
      expect(results.first.passenger, 'Jones');
    });

    test('worst start status wins (jump_start over clean)', () {
      final starts = [
        StartEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100000, status: 'clean', createdAt: 100000,
        ),
        StartEvent(
          id: 2, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100100, status: 'jump_start', createdAt: 100000,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: [], entries: []);
      expect(results.first.startStatus, 'jump_start');
    });

    test('results sorted by car number then run number', () {
      final starts = [
        StartEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 23, runNumber: 1,
          timestamp: 100000, status: 'clean', createdAt: 100000,
        ),
        StartEvent(
          id: 2, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100000, status: 'clean', createdAt: 100000,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: [], entries: []);
      expect(results[0].carNumber, 7);
      expect(results[1].carNumber, 23);
    });

    test('marker hits summed from multiple finishes', () {
      final starts = [
        StartEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 100000, status: 'clean', createdAt: 100000,
        ),
      ];
      final finishes = [
        FinishEvent(
          id: 1, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 110000, markerHits: 1, status: 'clean', createdAt: 110000,
        ),
        FinishEvent(
          id: 2, eventId: 'e1', testNumber: 1, carNumber: 7, runNumber: 1,
          timestamp: 110100, markerHits: 2, status: 'clean', createdAt: 110000,
        ),
      ];

      final results = pairRuns(starts: starts, finishes: finishes, entries: []);
      expect(results.first.markerHits, 3);
    });
  });
}
