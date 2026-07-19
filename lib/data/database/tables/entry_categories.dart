import 'package:drift/drift.dart';
import 'entries.dart';
import 'categories.dart';

class EntryCategories extends Table {
  IntColumn get entryId => integer().references(Entries, #id)();
  IntColumn get categoryId => integer().references(Categories, #id)();

  @override
  Set<Column> get primaryKey => {entryId, categoryId};
}
