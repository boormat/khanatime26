import 'package:flutter_test/flutter_test.dart';
import 'package:khanatime26/data/database/database.dart';
import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';

AppDatabase createTestDb() => AppDatabase.forTesting(NativeDatabase.memory());

void main() {
  late AppDatabase db;

  setUp(() {
    db = createTestDb();
  });

  tearDown(() async {
    await db.close();
  });

  group('Events', () {
    test('create event with Outright category', () async {
      await db.eventDao.createEvent(
        EventsCompanion.insert(
          id: 'test_001',
          name: 'Test Event',
          date: DateTime(2026, 7, 19).millisecondsSinceEpoch,
          scheduledTests: 3,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      final event = await db.eventDao.eventById('test_001');
      expect(event, isNotNull);
      expect(event!.name, 'Test Event');

      final categories =
          await db.categoryDao.categoriesForEvent('test_001');
      expect(categories.length, 1);
      expect(categories.first.name, 'Outright');
      expect(categories.first.isOutright, 1);
    });

    test('watch all events', () async {
      await db.eventDao.createEvent(
        EventsCompanion.insert(
          id: 'e1',
          name: 'Event 1',
          date: 0,
          scheduledTests: 1,
          createdAt: 0,
        ),
      );
      await db.eventDao.createEvent(
        EventsCompanion.insert(
          id: 'e2',
          name: 'Event 2',
          date: 0,
          scheduledTests: 2,
          createdAt: 0,
        ),
      );

      final events = await db.eventDao.allEvents();
      expect(events.length, 2);
    });
  });

  group('Entries', () {
    setUp(() async {
      await db.eventDao.createEvent(
        EventsCompanion.insert(
          id: 'e1',
          name: 'Event',
          date: 0,
          scheduledTests: 1,
          createdAt: 0,
        ),
      );
    });

    test('create entry auto-assigns to Outright', () async {
      await db.entryDao.createEntry(
        EntriesCompanion.insert(
          eventId: 'e1',
          carNumber: 7,
          driverName: 'Smith',
          registeredAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      final entries = await db.entryDao.entriesForEvent('e1');
      expect(entries.length, 1);
      expect(entries.first.carNumber, 7);

      final outright = await db.categoryDao.outrightForEvent('e1');
      expect(outright, isNotNull);

      final cats =
          await db.entryDao.categoriesForEntry(entries.first.id);
      expect(cats.length, 1);
      expect(cats.first, outright!.id);
    });

    test('unique car number per event', () async {
      await db.entryDao.createEntry(
        EntriesCompanion.insert(
          eventId: 'e1',
          carNumber: 7,
          driverName: 'Smith',
          registeredAt: 0,
        ),
      );
      expect(
        () => db.entryDao.createEntry(
          EntriesCompanion.insert(
            eventId: 'e1',
            carNumber: 7,
            driverName: 'Jones',
            registeredAt: 0,
          ),
        ),
        throwsA(anything),
      );
    });
  });

  group('Categories', () {
    setUp(() async {
      await db.eventDao.createEvent(
        EventsCompanion.insert(
          id: 'e1',
          name: 'Event',
          date: 0,
          scheduledTests: 1,
          createdAt: 0,
        ),
      );
    });

    test('add and list categories', () async {
      await db.categoryDao.addCategory('e1', 'Junior');
      await db.categoryDao.addCategory('e1', 'Female', sortOrder: 1);

      final cats = await db.categoryDao.categoriesForEvent('e1');
      expect(cats.length, 3);
      // Outright created on event + 2 added = 3
    });

    test('delete category', () async {
      final id = await db.categoryDao.addCategory('e1', 'Buggy');
      await db.categoryDao.deleteCategory(id);

      final cats = await db.categoryDao.categoriesForEvent('e1');
      expect(cats.length, 1); // only Outright
    });
  });

  group('Timing', () {
    setUp(() async {
      await db.eventDao.createEvent(
        EventsCompanion.insert(
          id: 'e1',
          name: 'Event',
          date: 0,
          scheduledTests: 1,
          createdAt: 0,
        ),
      );
    });

    test('insert start event and get next run number', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      await db.timingDao.insertStartEvent(
        StartEventsCompanion.insert(
          eventId: 'e1',
          testNumber: 1,
          carNumber: 23,
          runNumber: 1,
          timestamp: now,
          createdAt: now,
        ),
      );

      final next = await db.timingDao.nextRunNumber('e1', 1, 23);
      expect(next, 2);

      final starts = await db.timingDao.getStartsForTest('e1', 1);
      expect(starts.length, 1);
    });

    test('average start timestamp', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      await db.timingDao.insertStartEvent(
        StartEventsCompanion.insert(
          eventId: 'e1',
          testNumber: 1,
          carNumber: 7,
          runNumber: 1,
          timestamp: now,
          officialId: const Value('off1'),
          status: const Value('clean'),
          createdAt: now,
        ),
      );
      await db.timingDao.insertStartEvent(
        StartEventsCompanion.insert(
          eventId: 'e1',
          testNumber: 1,
          carNumber: 7,
          runNumber: 1,
          timestamp: now + 100,
          officialId: const Value('off2'),
          status: const Value('clean'),
          createdAt: now,
        ),
      );

      final avg = await db.timingDao.avgStartTimestamp('e1', 1, 7, 1);
      expect(avg, now + 50); // average of now and now+100
    });

    test('insert finish event', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      await db.timingDao.insertFinishEvent(
        FinishEventsCompanion.insert(
          eventId: 'e1',
          testNumber: 1,
          carNumber: const Value(17),
          runNumber: const Value(1),
          timestamp: now + 5000,
          createdAt: now,
        ),
      );

      final finishes =
          await db.timingDao.getFinishesForTest('e1', 1);
      expect(finishes.length, 1);
      expect(finishes.first.markerHits, 0);
    });
  });
}
