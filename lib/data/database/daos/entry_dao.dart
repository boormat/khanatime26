import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/entries.dart';
import '../tables/entry_categories.dart';
import '../tables/categories.dart';

part 'entry_dao.g.dart';

@DriftAccessor(
    tables: [Entries, EntryCategories, Categories])
class EntryDao extends DatabaseAccessor<AppDatabase> with _$EntryDaoMixin {
  EntryDao(super.db);

  /// Insert entry and auto-assign to Outright category.
  Future<int> createEntry(EntriesCompanion entry) async {
    return transaction(() async {
      final entryId = await into(entries).insert(entry);

      // Auto-assign to Outright
      final outright = await (select(categories)
            ..where((c) =>
                c.eventId.equals(entry.eventId.value) &
                c.isOutright.equals(1)))
          .getSingleOrNull();
      if (outright != null) {
        await into(entryCategories).insert(
          EntryCategoriesCompanion.insert(
            entryId: entryId,
            categoryId: outright.id,
          ),
        );
      }

      return entryId;
    });
  }

  Future<List<Entry>> entriesForEvent(String eventId) =>
      (select(entries)..where((e) => e.eventId.equals(eventId))).get();

  Stream<List<Entry>> watchEntriesForEvent(String eventId) =>
      (select(entries)..where((e) => e.eventId.equals(eventId))).watch();

  Future<Entry?> entryById(int id) =>
      (select(entries)..where((e) => e.id.equals(id))).getSingleOrNull();

  Future<void> updateEntryStatus(int entryId, String status) =>
      (update(entries)..where((e) => e.id.equals(entryId)))
          .write(EntriesCompanion(status: Value(status)));

  Future<void> assignCategory(int entryId, int categoryId) async {
    await into(entryCategories).insert(
      EntryCategoriesCompanion.insert(
        entryId: entryId,
        categoryId: categoryId,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> removeCategory(int entryId, int categoryId) =>
      (delete(entryCategories)
            ..where((ec) =>
                ec.entryId.equals(entryId) &
                ec.categoryId.equals(categoryId)))
          .go();

  Future<List<int>> categoriesForEntry(int entryId) async {
    final results = await (select(entryCategories)
          ..where((ec) => ec.entryId.equals(entryId)))
        .get();
    return results.map((r) => r.categoryId).toList();
  }
}
