import 'package:drift/drift.dart';
import 'events.dart';

class Tests extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get eventId => text().references(Events, #id)();
  IntColumn get testNumber => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get startType => text().withDefault(const Constant('same_garage'))();
  TextColumn get status => text().withDefault(const Constant('pending'))();

  @override
  List<Set<Column>> get uniqueKeys => [{eventId, testNumber}];
}
