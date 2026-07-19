import 'package:drift/drift.dart';
import 'events.dart';

class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get eventId => text().references(Events, #id)();
  IntColumn get carNumber => integer()();
  TextColumn get driverName => text()();
  TextColumn get licence => text().nullable()();
  TextColumn get passenger => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  IntColumn get joinAtTest => integer().nullable()();
  IntColumn get scratchTest => integer().nullable()();
  IntColumn get registeredAt => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [{eventId, carNumber}];
}
