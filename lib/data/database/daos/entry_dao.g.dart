// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_dao.dart';

// ignore_for_file: type=lint
mixin _$EntryDaoMixin on DatabaseAccessor<AppDatabase> {
  $EventsTable get events => attachedDatabase.events;
  $EntriesTable get entries => attachedDatabase.entries;
  $CategoriesTable get categories => attachedDatabase.categories;
  $EntryCategoriesTable get entryCategories => attachedDatabase.entryCategories;
  EntryDaoManager get managers => EntryDaoManager(this);
}

class EntryDaoManager {
  final _$EntryDaoMixin _db;
  EntryDaoManager(this._db);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db.attachedDatabase, _db.events);
  $$EntriesTableTableManager get entries =>
      $$EntriesTableTableManager(_db.attachedDatabase, _db.entries);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$EntryCategoriesTableTableManager get entryCategories =>
      $$EntryCategoriesTableTableManager(
        _db.attachedDatabase,
        _db.entryCategories,
      );
}
