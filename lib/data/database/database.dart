import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/events.dart';
import 'tables/tests.dart';
import 'tables/entries.dart';
import 'tables/start_events.dart';
import 'tables/finish_events.dart';
import 'tables/categories.dart';
import 'tables/entry_categories.dart';
import 'tables/officials.dart';
import 'daos/event_dao.dart';
import 'daos/timing_dao.dart';
import 'daos/entry_dao.dart';
import 'daos/category_dao.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Events,
  Tests,
  Entries,
  StartEvents,
  FinishEvents,
  Categories,
  EntryCategories,
  Officials,
], daos: [
  EventDao,
  TimingDao,
  EntryDao,
  CategoryDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'khanatime26.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
