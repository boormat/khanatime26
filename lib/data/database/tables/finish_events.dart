import 'package:drift/drift.dart';
import 'events.dart';

class FinishEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get eventId => text().references(Events, #id)();
  IntColumn get testNumber => integer()();
  IntColumn get carNumber => integer().nullable()();
  IntColumn get runNumber => integer().nullable()();
  TextColumn get officialId => text().nullable()();
  IntColumn get timestamp => integer()();
  IntColumn get markerHits => integer().withDefault(const Constant(0))();
  // +5s per flag hit (Rule 12.1)
  TextColumn get status => text().withDefault(const Constant('pending'))();
  // pending | clean | dns | dnf | nfg | wrong_direction | missed_stop
  // | reversed | wrong_order | dsq | unassigned
  TextColumn get signature => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get syncedAt => integer().nullable()();
}
