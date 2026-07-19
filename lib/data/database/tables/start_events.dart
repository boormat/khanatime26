import 'package:drift/drift.dart';
import 'events.dart';

class StartEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get eventId => text().references(Events, #id)();
  IntColumn get testNumber => integer()();
  IntColumn get carNumber => integer()();
  IntColumn get runNumber => integer()();
  TextColumn get officialId => text().nullable()();
  IntColumn get timestamp => integer()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  // pending | clean | dns | jump_start
  TextColumn get signature => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get syncedAt => integer().nullable()();

  // Pairing key: (event_id, test_number, car_number, run_number)
  // Multiple officials may submit start_events for same key (averaging)
}
