import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/events.dart';
import '../tables/categories.dart';

part 'event_dao.g.dart';

@DriftAccessor(tables: [Events, Categories])
class EventDao extends DatabaseAccessor<AppDatabase> with _$EventDaoMixin {
  EventDao(super.db);

  /// Insert event and auto-create Outright category.
  Future<int> createEvent(EventsCompanion event) async {
    return transaction(() async {
      final eventId = await into(events).insert(event);

      // Auto-create Outright category
      await into(categories).insert(CategoriesCompanion.insert(
        eventId: event.id.value,
        name: 'Outright',
        isOutright: const Value(1),
        sortOrder: const Value(0),
      ));

      return eventId;
    });
  }

  Future<List<Event>> allEvents() => select(events).get();

  Stream<List<Event>> watchAllEvents() => select(events).watch();

  Future<Event?> eventById(String id) =>
      (select(events)..where((e) => e.id.equals(id))).getSingleOrNull();

  Future<void> updateEventStatus(String eventId, String status) =>
      (update(events)..where((e) => e.id.equals(eventId)))
          .write(EventsCompanion(status: Value(status)));

  Future<int> deleteEvent(String id) =>
      (delete(events)..where((e) => e.id.equals(id))).go();
}
