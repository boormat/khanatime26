import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/categories.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<List<Category>> categoriesForEvent(String eventId) =>
      (select(categories)
            ..where((c) => c.eventId.equals(eventId))
            ..orderBy([(c) => OrderingTerm.asc(c.sortOrder)]))
          .get();

  Stream<List<Category>> watchCategoriesForEvent(String eventId) =>
      (select(categories)
            ..where((c) => c.eventId.equals(eventId))
            ..orderBy([(c) => OrderingTerm.asc(c.sortOrder)]))
          .watch();

  Future<Category?> outrightForEvent(String eventId) =>
      (select(categories)
            ..where(
                (c) => c.eventId.equals(eventId) & c.isOutright.equals(1)))
          .getSingleOrNull();

  Future<int> addCategory(String eventId, String name, {int sortOrder = 0}) =>
      into(categories).insert(CategoriesCompanion.insert(
        eventId: eventId,
        name: name,
        sortOrder: Value(sortOrder),
      ));

  Future<void> deleteCategory(int categoryId) =>
      (delete(categories)..where((c) => c.id.equals(categoryId))).go();
}
