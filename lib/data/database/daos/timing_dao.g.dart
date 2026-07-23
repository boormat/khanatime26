// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timing_dao.dart';

// ignore_for_file: type=lint
mixin _$TimingDaoMixin on DatabaseAccessor<AppDatabase> {
  $EventsTable get events => attachedDatabase.events;
  $StartEventsTable get startEvents => attachedDatabase.startEvents;
  $FinishEventsTable get finishEvents => attachedDatabase.finishEvents;
  TimingDaoManager get managers => TimingDaoManager(this);
}

class TimingDaoManager {
  final _$TimingDaoMixin _db;
  TimingDaoManager(this._db);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db.attachedDatabase, _db.events);
  $$StartEventsTableTableManager get startEvents =>
      $$StartEventsTableTableManager(_db.attachedDatabase, _db.startEvents);
  $$FinishEventsTableTableManager get finishEvents =>
      $$FinishEventsTableTableManager(_db.attachedDatabase, _db.finishEvents);
}
