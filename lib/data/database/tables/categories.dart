import 'package:drift/drift.dart';
import 'events.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get eventId => text().references(Events, #id)();
  TextColumn get name => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get isOutright => integer().withDefault(const Constant(0))();

  @override
  List<Set<Column>> get uniqueKeys => [{eventId, name}];
}
