import 'package:drift/drift.dart';

class Events extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get date => integer()();
  TextColumn get organiser => text().nullable()();
  IntColumn get bestX => integer().withDefault(const Constant(1))();
  IntColumn get bestY => integer().withDefault(const Constant(1))();
  IntColumn get scheduledTests => integer()();
  TextColumn get status => text().withDefault(const Constant('setup'))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
