// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organiserMeta = const VerificationMeta(
    'organiser',
  );
  @override
  late final GeneratedColumn<String> organiser = GeneratedColumn<String>(
    'organiser',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bestXMeta = const VerificationMeta('bestX');
  @override
  late final GeneratedColumn<int> bestX = GeneratedColumn<int>(
    'best_x',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _bestYMeta = const VerificationMeta('bestY');
  @override
  late final GeneratedColumn<int> bestY = GeneratedColumn<int>(
    'best_y',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _scheduledTestsMeta = const VerificationMeta(
    'scheduledTests',
  );
  @override
  late final GeneratedColumn<int> scheduledTests = GeneratedColumn<int>(
    'scheduled_tests',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('setup'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    date,
    organiser,
    bestX,
    bestY,
    scheduledTests,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<Event> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('organiser')) {
      context.handle(
        _organiserMeta,
        organiser.isAcceptableOrUnknown(data['organiser']!, _organiserMeta),
      );
    }
    if (data.containsKey('best_x')) {
      context.handle(
        _bestXMeta,
        bestX.isAcceptableOrUnknown(data['best_x']!, _bestXMeta),
      );
    }
    if (data.containsKey('best_y')) {
      context.handle(
        _bestYMeta,
        bestY.isAcceptableOrUnknown(data['best_y']!, _bestYMeta),
      );
    }
    if (data.containsKey('scheduled_tests')) {
      context.handle(
        _scheduledTestsMeta,
        scheduledTests.isAcceptableOrUnknown(
          data['scheduled_tests']!,
          _scheduledTestsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledTestsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}date'],
          )!,
      organiser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organiser'],
      ),
      bestX:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}best_x'],
          )!,
      bestY:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}best_y'],
          )!,
      scheduledTests:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}scheduled_tests'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String name;
  final int date;
  final String? organiser;
  final int bestX;
  final int bestY;
  final int scheduledTests;
  final String status;
  final int createdAt;
  const Event({
    required this.id,
    required this.name,
    required this.date,
    this.organiser,
    required this.bestX,
    required this.bestY,
    required this.scheduledTests,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['date'] = Variable<int>(date);
    if (!nullToAbsent || organiser != null) {
      map['organiser'] = Variable<String>(organiser);
    }
    map['best_x'] = Variable<int>(bestX);
    map['best_y'] = Variable<int>(bestY);
    map['scheduled_tests'] = Variable<int>(scheduledTests);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      name: Value(name),
      date: Value(date),
      organiser:
          organiser == null && nullToAbsent
              ? const Value.absent()
              : Value(organiser),
      bestX: Value(bestX),
      bestY: Value(bestY),
      scheduledTests: Value(scheduledTests),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory Event.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<int>(json['date']),
      organiser: serializer.fromJson<String?>(json['organiser']),
      bestX: serializer.fromJson<int>(json['bestX']),
      bestY: serializer.fromJson<int>(json['bestY']),
      scheduledTests: serializer.fromJson<int>(json['scheduledTests']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<int>(date),
      'organiser': serializer.toJson<String?>(organiser),
      'bestX': serializer.toJson<int>(bestX),
      'bestY': serializer.toJson<int>(bestY),
      'scheduledTests': serializer.toJson<int>(scheduledTests),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Event copyWith({
    String? id,
    String? name,
    int? date,
    Value<String?> organiser = const Value.absent(),
    int? bestX,
    int? bestY,
    int? scheduledTests,
    String? status,
    int? createdAt,
  }) => Event(
    id: id ?? this.id,
    name: name ?? this.name,
    date: date ?? this.date,
    organiser: organiser.present ? organiser.value : this.organiser,
    bestX: bestX ?? this.bestX,
    bestY: bestY ?? this.bestY,
    scheduledTests: scheduledTests ?? this.scheduledTests,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      date: data.date.present ? data.date.value : this.date,
      organiser: data.organiser.present ? data.organiser.value : this.organiser,
      bestX: data.bestX.present ? data.bestX.value : this.bestX,
      bestY: data.bestY.present ? data.bestY.value : this.bestY,
      scheduledTests:
          data.scheduledTests.present
              ? data.scheduledTests.value
              : this.scheduledTests,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('organiser: $organiser, ')
          ..write('bestX: $bestX, ')
          ..write('bestY: $bestY, ')
          ..write('scheduledTests: $scheduledTests, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    date,
    organiser,
    bestX,
    bestY,
    scheduledTests,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date &&
          other.organiser == this.organiser &&
          other.bestX == this.bestX &&
          other.bestY == this.bestY &&
          other.scheduledTests == this.scheduledTests &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> date;
  final Value<String?> organiser;
  final Value<int> bestX;
  final Value<int> bestY;
  final Value<int> scheduledTests;
  final Value<String> status;
  final Value<int> createdAt;
  final Value<int> rowid;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.organiser = const Value.absent(),
    this.bestX = const Value.absent(),
    this.bestY = const Value.absent(),
    this.scheduledTests = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String name,
    required int date,
    this.organiser = const Value.absent(),
    this.bestX = const Value.absent(),
    this.bestY = const Value.absent(),
    required int scheduledTests,
    this.status = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       date = Value(date),
       scheduledTests = Value(scheduledTests),
       createdAt = Value(createdAt);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? date,
    Expression<String>? organiser,
    Expression<int>? bestX,
    Expression<int>? bestY,
    Expression<int>? scheduledTests,
    Expression<String>? status,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (organiser != null) 'organiser': organiser,
      if (bestX != null) 'best_x': bestX,
      if (bestY != null) 'best_y': bestY,
      if (scheduledTests != null) 'scheduled_tests': scheduledTests,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? date,
    Value<String?>? organiser,
    Value<int>? bestX,
    Value<int>? bestY,
    Value<int>? scheduledTests,
    Value<String>? status,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      organiser: organiser ?? this.organiser,
      bestX: bestX ?? this.bestX,
      bestY: bestY ?? this.bestY,
      scheduledTests: scheduledTests ?? this.scheduledTests,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (organiser.present) {
      map['organiser'] = Variable<String>(organiser.value);
    }
    if (bestX.present) {
      map['best_x'] = Variable<int>(bestX.value);
    }
    if (bestY.present) {
      map['best_y'] = Variable<int>(bestY.value);
    }
    if (scheduledTests.present) {
      map['scheduled_tests'] = Variable<int>(scheduledTests.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('organiser: $organiser, ')
          ..write('bestX: $bestX, ')
          ..write('bestY: $bestY, ')
          ..write('scheduledTests: $scheduledTests, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestsTable extends Tests with TableInfo<$TestsTable, Test> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id)',
    ),
  );
  static const VerificationMeta _testNumberMeta = const VerificationMeta(
    'testNumber',
  );
  @override
  late final GeneratedColumn<int> testNumber = GeneratedColumn<int>(
    'test_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTypeMeta = const VerificationMeta(
    'startType',
  );
  @override
  late final GeneratedColumn<String> startType = GeneratedColumn<String>(
    'start_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('same_garage'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventId,
    testNumber,
    name,
    startType,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tests';
  @override
  VerificationContext validateIntegrity(
    Insertable<Test> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('test_number')) {
      context.handle(
        _testNumberMeta,
        testNumber.isAcceptableOrUnknown(data['test_number']!, _testNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_testNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('start_type')) {
      context.handle(
        _startTypeMeta,
        startType.isAcceptableOrUnknown(data['start_type']!, _startTypeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {eventId, testNumber},
  ];
  @override
  Test map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Test(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      eventId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}event_id'],
          )!,
      testNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}test_number'],
          )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      startType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}start_type'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $TestsTable createAlias(String alias) {
    return $TestsTable(attachedDatabase, alias);
  }
}

class Test extends DataClass implements Insertable<Test> {
  final int id;
  final String eventId;
  final int testNumber;
  final String? name;
  final String startType;
  final String status;
  const Test({
    required this.id,
    required this.eventId,
    required this.testNumber,
    this.name,
    required this.startType,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<String>(eventId);
    map['test_number'] = Variable<int>(testNumber);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['start_type'] = Variable<String>(startType);
    map['status'] = Variable<String>(status);
    return map;
  }

  TestsCompanion toCompanion(bool nullToAbsent) {
    return TestsCompanion(
      id: Value(id),
      eventId: Value(eventId),
      testNumber: Value(testNumber),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      startType: Value(startType),
      status: Value(status),
    );
  }

  factory Test.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Test(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      testNumber: serializer.fromJson<int>(json['testNumber']),
      name: serializer.fromJson<String?>(json['name']),
      startType: serializer.fromJson<String>(json['startType']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<String>(eventId),
      'testNumber': serializer.toJson<int>(testNumber),
      'name': serializer.toJson<String?>(name),
      'startType': serializer.toJson<String>(startType),
      'status': serializer.toJson<String>(status),
    };
  }

  Test copyWith({
    int? id,
    String? eventId,
    int? testNumber,
    Value<String?> name = const Value.absent(),
    String? startType,
    String? status,
  }) => Test(
    id: id ?? this.id,
    eventId: eventId ?? this.eventId,
    testNumber: testNumber ?? this.testNumber,
    name: name.present ? name.value : this.name,
    startType: startType ?? this.startType,
    status: status ?? this.status,
  );
  Test copyWithCompanion(TestsCompanion data) {
    return Test(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      testNumber:
          data.testNumber.present ? data.testNumber.value : this.testNumber,
      name: data.name.present ? data.name.value : this.name,
      startType: data.startType.present ? data.startType.value : this.startType,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Test(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('testNumber: $testNumber, ')
          ..write('name: $name, ')
          ..write('startType: $startType, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, eventId, testNumber, name, startType, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Test &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.testNumber == this.testNumber &&
          other.name == this.name &&
          other.startType == this.startType &&
          other.status == this.status);
}

class TestsCompanion extends UpdateCompanion<Test> {
  final Value<int> id;
  final Value<String> eventId;
  final Value<int> testNumber;
  final Value<String?> name;
  final Value<String> startType;
  final Value<String> status;
  const TestsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.testNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.startType = const Value.absent(),
    this.status = const Value.absent(),
  });
  TestsCompanion.insert({
    this.id = const Value.absent(),
    required String eventId,
    required int testNumber,
    this.name = const Value.absent(),
    this.startType = const Value.absent(),
    this.status = const Value.absent(),
  }) : eventId = Value(eventId),
       testNumber = Value(testNumber);
  static Insertable<Test> custom({
    Expression<int>? id,
    Expression<String>? eventId,
    Expression<int>? testNumber,
    Expression<String>? name,
    Expression<String>? startType,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (testNumber != null) 'test_number': testNumber,
      if (name != null) 'name': name,
      if (startType != null) 'start_type': startType,
      if (status != null) 'status': status,
    });
  }

  TestsCompanion copyWith({
    Value<int>? id,
    Value<String>? eventId,
    Value<int>? testNumber,
    Value<String?>? name,
    Value<String>? startType,
    Value<String>? status,
  }) {
    return TestsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      testNumber: testNumber ?? this.testNumber,
      name: name ?? this.name,
      startType: startType ?? this.startType,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (testNumber.present) {
      map['test_number'] = Variable<int>(testNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startType.present) {
      map['start_type'] = Variable<String>(startType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('testNumber: $testNumber, ')
          ..write('name: $name, ')
          ..write('startType: $startType, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, Entry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id)',
    ),
  );
  static const VerificationMeta _carNumberMeta = const VerificationMeta(
    'carNumber',
  );
  @override
  late final GeneratedColumn<int> carNumber = GeneratedColumn<int>(
    'car_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _driverNameMeta = const VerificationMeta(
    'driverName',
  );
  @override
  late final GeneratedColumn<String> driverName = GeneratedColumn<String>(
    'driver_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _licenceMeta = const VerificationMeta(
    'licence',
  );
  @override
  late final GeneratedColumn<String> licence = GeneratedColumn<String>(
    'licence',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passengerMeta = const VerificationMeta(
    'passenger',
  );
  @override
  late final GeneratedColumn<String> passenger = GeneratedColumn<String>(
    'passenger',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _joinAtTestMeta = const VerificationMeta(
    'joinAtTest',
  );
  @override
  late final GeneratedColumn<int> joinAtTest = GeneratedColumn<int>(
    'join_at_test',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scratchTestMeta = const VerificationMeta(
    'scratchTest',
  );
  @override
  late final GeneratedColumn<int> scratchTest = GeneratedColumn<int>(
    'scratch_test',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registeredAtMeta = const VerificationMeta(
    'registeredAt',
  );
  @override
  late final GeneratedColumn<int> registeredAt = GeneratedColumn<int>(
    'registered_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventId,
    carNumber,
    driverName,
    licence,
    passenger,
    status,
    joinAtTest,
    scratchTest,
    registeredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Entry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('car_number')) {
      context.handle(
        _carNumberMeta,
        carNumber.isAcceptableOrUnknown(data['car_number']!, _carNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_carNumberMeta);
    }
    if (data.containsKey('driver_name')) {
      context.handle(
        _driverNameMeta,
        driverName.isAcceptableOrUnknown(data['driver_name']!, _driverNameMeta),
      );
    } else if (isInserting) {
      context.missing(_driverNameMeta);
    }
    if (data.containsKey('licence')) {
      context.handle(
        _licenceMeta,
        licence.isAcceptableOrUnknown(data['licence']!, _licenceMeta),
      );
    }
    if (data.containsKey('passenger')) {
      context.handle(
        _passengerMeta,
        passenger.isAcceptableOrUnknown(data['passenger']!, _passengerMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('join_at_test')) {
      context.handle(
        _joinAtTestMeta,
        joinAtTest.isAcceptableOrUnknown(
          data['join_at_test']!,
          _joinAtTestMeta,
        ),
      );
    }
    if (data.containsKey('scratch_test')) {
      context.handle(
        _scratchTestMeta,
        scratchTest.isAcceptableOrUnknown(
          data['scratch_test']!,
          _scratchTestMeta,
        ),
      );
    }
    if (data.containsKey('registered_at')) {
      context.handle(
        _registeredAtMeta,
        registeredAt.isAcceptableOrUnknown(
          data['registered_at']!,
          _registeredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registeredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {eventId, carNumber},
  ];
  @override
  Entry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Entry(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      eventId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}event_id'],
          )!,
      carNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}car_number'],
          )!,
      driverName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}driver_name'],
          )!,
      licence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}licence'],
      ),
      passenger: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}passenger'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      joinAtTest: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}join_at_test'],
      ),
      scratchTest: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scratch_test'],
      ),
      registeredAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}registered_at'],
          )!,
    );
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(attachedDatabase, alias);
  }
}

class Entry extends DataClass implements Insertable<Entry> {
  final int id;
  final String eventId;
  final int carNumber;
  final String driverName;
  final String? licence;
  final String? passenger;
  final String status;
  final int? joinAtTest;
  final int? scratchTest;
  final int registeredAt;
  const Entry({
    required this.id,
    required this.eventId,
    required this.carNumber,
    required this.driverName,
    this.licence,
    this.passenger,
    required this.status,
    this.joinAtTest,
    this.scratchTest,
    required this.registeredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<String>(eventId);
    map['car_number'] = Variable<int>(carNumber);
    map['driver_name'] = Variable<String>(driverName);
    if (!nullToAbsent || licence != null) {
      map['licence'] = Variable<String>(licence);
    }
    if (!nullToAbsent || passenger != null) {
      map['passenger'] = Variable<String>(passenger);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || joinAtTest != null) {
      map['join_at_test'] = Variable<int>(joinAtTest);
    }
    if (!nullToAbsent || scratchTest != null) {
      map['scratch_test'] = Variable<int>(scratchTest);
    }
    map['registered_at'] = Variable<int>(registeredAt);
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: Value(id),
      eventId: Value(eventId),
      carNumber: Value(carNumber),
      driverName: Value(driverName),
      licence:
          licence == null && nullToAbsent
              ? const Value.absent()
              : Value(licence),
      passenger:
          passenger == null && nullToAbsent
              ? const Value.absent()
              : Value(passenger),
      status: Value(status),
      joinAtTest:
          joinAtTest == null && nullToAbsent
              ? const Value.absent()
              : Value(joinAtTest),
      scratchTest:
          scratchTest == null && nullToAbsent
              ? const Value.absent()
              : Value(scratchTest),
      registeredAt: Value(registeredAt),
    );
  }

  factory Entry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Entry(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      carNumber: serializer.fromJson<int>(json['carNumber']),
      driverName: serializer.fromJson<String>(json['driverName']),
      licence: serializer.fromJson<String?>(json['licence']),
      passenger: serializer.fromJson<String?>(json['passenger']),
      status: serializer.fromJson<String>(json['status']),
      joinAtTest: serializer.fromJson<int?>(json['joinAtTest']),
      scratchTest: serializer.fromJson<int?>(json['scratchTest']),
      registeredAt: serializer.fromJson<int>(json['registeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<String>(eventId),
      'carNumber': serializer.toJson<int>(carNumber),
      'driverName': serializer.toJson<String>(driverName),
      'licence': serializer.toJson<String?>(licence),
      'passenger': serializer.toJson<String?>(passenger),
      'status': serializer.toJson<String>(status),
      'joinAtTest': serializer.toJson<int?>(joinAtTest),
      'scratchTest': serializer.toJson<int?>(scratchTest),
      'registeredAt': serializer.toJson<int>(registeredAt),
    };
  }

  Entry copyWith({
    int? id,
    String? eventId,
    int? carNumber,
    String? driverName,
    Value<String?> licence = const Value.absent(),
    Value<String?> passenger = const Value.absent(),
    String? status,
    Value<int?> joinAtTest = const Value.absent(),
    Value<int?> scratchTest = const Value.absent(),
    int? registeredAt,
  }) => Entry(
    id: id ?? this.id,
    eventId: eventId ?? this.eventId,
    carNumber: carNumber ?? this.carNumber,
    driverName: driverName ?? this.driverName,
    licence: licence.present ? licence.value : this.licence,
    passenger: passenger.present ? passenger.value : this.passenger,
    status: status ?? this.status,
    joinAtTest: joinAtTest.present ? joinAtTest.value : this.joinAtTest,
    scratchTest: scratchTest.present ? scratchTest.value : this.scratchTest,
    registeredAt: registeredAt ?? this.registeredAt,
  );
  Entry copyWithCompanion(EntriesCompanion data) {
    return Entry(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      carNumber: data.carNumber.present ? data.carNumber.value : this.carNumber,
      driverName:
          data.driverName.present ? data.driverName.value : this.driverName,
      licence: data.licence.present ? data.licence.value : this.licence,
      passenger: data.passenger.present ? data.passenger.value : this.passenger,
      status: data.status.present ? data.status.value : this.status,
      joinAtTest:
          data.joinAtTest.present ? data.joinAtTest.value : this.joinAtTest,
      scratchTest:
          data.scratchTest.present ? data.scratchTest.value : this.scratchTest,
      registeredAt:
          data.registeredAt.present
              ? data.registeredAt.value
              : this.registeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Entry(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('carNumber: $carNumber, ')
          ..write('driverName: $driverName, ')
          ..write('licence: $licence, ')
          ..write('passenger: $passenger, ')
          ..write('status: $status, ')
          ..write('joinAtTest: $joinAtTest, ')
          ..write('scratchTest: $scratchTest, ')
          ..write('registeredAt: $registeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    eventId,
    carNumber,
    driverName,
    licence,
    passenger,
    status,
    joinAtTest,
    scratchTest,
    registeredAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entry &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.carNumber == this.carNumber &&
          other.driverName == this.driverName &&
          other.licence == this.licence &&
          other.passenger == this.passenger &&
          other.status == this.status &&
          other.joinAtTest == this.joinAtTest &&
          other.scratchTest == this.scratchTest &&
          other.registeredAt == this.registeredAt);
}

class EntriesCompanion extends UpdateCompanion<Entry> {
  final Value<int> id;
  final Value<String> eventId;
  final Value<int> carNumber;
  final Value<String> driverName;
  final Value<String?> licence;
  final Value<String?> passenger;
  final Value<String> status;
  final Value<int?> joinAtTest;
  final Value<int?> scratchTest;
  final Value<int> registeredAt;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.carNumber = const Value.absent(),
    this.driverName = const Value.absent(),
    this.licence = const Value.absent(),
    this.passenger = const Value.absent(),
    this.status = const Value.absent(),
    this.joinAtTest = const Value.absent(),
    this.scratchTest = const Value.absent(),
    this.registeredAt = const Value.absent(),
  });
  EntriesCompanion.insert({
    this.id = const Value.absent(),
    required String eventId,
    required int carNumber,
    required String driverName,
    this.licence = const Value.absent(),
    this.passenger = const Value.absent(),
    this.status = const Value.absent(),
    this.joinAtTest = const Value.absent(),
    this.scratchTest = const Value.absent(),
    required int registeredAt,
  }) : eventId = Value(eventId),
       carNumber = Value(carNumber),
       driverName = Value(driverName),
       registeredAt = Value(registeredAt);
  static Insertable<Entry> custom({
    Expression<int>? id,
    Expression<String>? eventId,
    Expression<int>? carNumber,
    Expression<String>? driverName,
    Expression<String>? licence,
    Expression<String>? passenger,
    Expression<String>? status,
    Expression<int>? joinAtTest,
    Expression<int>? scratchTest,
    Expression<int>? registeredAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (carNumber != null) 'car_number': carNumber,
      if (driverName != null) 'driver_name': driverName,
      if (licence != null) 'licence': licence,
      if (passenger != null) 'passenger': passenger,
      if (status != null) 'status': status,
      if (joinAtTest != null) 'join_at_test': joinAtTest,
      if (scratchTest != null) 'scratch_test': scratchTest,
      if (registeredAt != null) 'registered_at': registeredAt,
    });
  }

  EntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? eventId,
    Value<int>? carNumber,
    Value<String>? driverName,
    Value<String?>? licence,
    Value<String?>? passenger,
    Value<String>? status,
    Value<int?>? joinAtTest,
    Value<int?>? scratchTest,
    Value<int>? registeredAt,
  }) {
    return EntriesCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      carNumber: carNumber ?? this.carNumber,
      driverName: driverName ?? this.driverName,
      licence: licence ?? this.licence,
      passenger: passenger ?? this.passenger,
      status: status ?? this.status,
      joinAtTest: joinAtTest ?? this.joinAtTest,
      scratchTest: scratchTest ?? this.scratchTest,
      registeredAt: registeredAt ?? this.registeredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (carNumber.present) {
      map['car_number'] = Variable<int>(carNumber.value);
    }
    if (driverName.present) {
      map['driver_name'] = Variable<String>(driverName.value);
    }
    if (licence.present) {
      map['licence'] = Variable<String>(licence.value);
    }
    if (passenger.present) {
      map['passenger'] = Variable<String>(passenger.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (joinAtTest.present) {
      map['join_at_test'] = Variable<int>(joinAtTest.value);
    }
    if (scratchTest.present) {
      map['scratch_test'] = Variable<int>(scratchTest.value);
    }
    if (registeredAt.present) {
      map['registered_at'] = Variable<int>(registeredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('carNumber: $carNumber, ')
          ..write('driverName: $driverName, ')
          ..write('licence: $licence, ')
          ..write('passenger: $passenger, ')
          ..write('status: $status, ')
          ..write('joinAtTest: $joinAtTest, ')
          ..write('scratchTest: $scratchTest, ')
          ..write('registeredAt: $registeredAt')
          ..write(')'))
        .toString();
  }
}

class $StartEventsTable extends StartEvents
    with TableInfo<$StartEventsTable, StartEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StartEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id)',
    ),
  );
  static const VerificationMeta _testNumberMeta = const VerificationMeta(
    'testNumber',
  );
  @override
  late final GeneratedColumn<int> testNumber = GeneratedColumn<int>(
    'test_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carNumberMeta = const VerificationMeta(
    'carNumber',
  );
  @override
  late final GeneratedColumn<int> carNumber = GeneratedColumn<int>(
    'car_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _runNumberMeta = const VerificationMeta(
    'runNumber',
  );
  @override
  late final GeneratedColumn<int> runNumber = GeneratedColumn<int>(
    'run_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _officialIdMeta = const VerificationMeta(
    'officialId',
  );
  @override
  late final GeneratedColumn<String> officialId = GeneratedColumn<String>(
    'official_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _signatureMeta = const VerificationMeta(
    'signature',
  );
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
    'signature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<int> syncedAt = GeneratedColumn<int>(
    'synced_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventId,
    testNumber,
    carNumber,
    runNumber,
    officialId,
    timestamp,
    status,
    signature,
    createdAt,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'start_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<StartEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('test_number')) {
      context.handle(
        _testNumberMeta,
        testNumber.isAcceptableOrUnknown(data['test_number']!, _testNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_testNumberMeta);
    }
    if (data.containsKey('car_number')) {
      context.handle(
        _carNumberMeta,
        carNumber.isAcceptableOrUnknown(data['car_number']!, _carNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_carNumberMeta);
    }
    if (data.containsKey('run_number')) {
      context.handle(
        _runNumberMeta,
        runNumber.isAcceptableOrUnknown(data['run_number']!, _runNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_runNumberMeta);
    }
    if (data.containsKey('official_id')) {
      context.handle(
        _officialIdMeta,
        officialId.isAcceptableOrUnknown(data['official_id']!, _officialIdMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('signature')) {
      context.handle(
        _signatureMeta,
        signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StartEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StartEvent(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      eventId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}event_id'],
          )!,
      testNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}test_number'],
          )!,
      carNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}car_number'],
          )!,
      runNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}run_number'],
          )!,
      officialId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}official_id'],
      ),
      timestamp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}timestamp'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      signature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}created_at'],
          )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synced_at'],
      ),
    );
  }

  @override
  $StartEventsTable createAlias(String alias) {
    return $StartEventsTable(attachedDatabase, alias);
  }
}

class StartEvent extends DataClass implements Insertable<StartEvent> {
  final int id;
  final String eventId;
  final int testNumber;
  final int carNumber;
  final int runNumber;
  final String? officialId;
  final int timestamp;
  final String status;
  final String? signature;
  final int createdAt;
  final int? syncedAt;
  const StartEvent({
    required this.id,
    required this.eventId,
    required this.testNumber,
    required this.carNumber,
    required this.runNumber,
    this.officialId,
    required this.timestamp,
    required this.status,
    this.signature,
    required this.createdAt,
    this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<String>(eventId);
    map['test_number'] = Variable<int>(testNumber);
    map['car_number'] = Variable<int>(carNumber);
    map['run_number'] = Variable<int>(runNumber);
    if (!nullToAbsent || officialId != null) {
      map['official_id'] = Variable<String>(officialId);
    }
    map['timestamp'] = Variable<int>(timestamp);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || signature != null) {
      map['signature'] = Variable<String>(signature);
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<int>(syncedAt);
    }
    return map;
  }

  StartEventsCompanion toCompanion(bool nullToAbsent) {
    return StartEventsCompanion(
      id: Value(id),
      eventId: Value(eventId),
      testNumber: Value(testNumber),
      carNumber: Value(carNumber),
      runNumber: Value(runNumber),
      officialId:
          officialId == null && nullToAbsent
              ? const Value.absent()
              : Value(officialId),
      timestamp: Value(timestamp),
      status: Value(status),
      signature:
          signature == null && nullToAbsent
              ? const Value.absent()
              : Value(signature),
      createdAt: Value(createdAt),
      syncedAt:
          syncedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(syncedAt),
    );
  }

  factory StartEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StartEvent(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      testNumber: serializer.fromJson<int>(json['testNumber']),
      carNumber: serializer.fromJson<int>(json['carNumber']),
      runNumber: serializer.fromJson<int>(json['runNumber']),
      officialId: serializer.fromJson<String?>(json['officialId']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      status: serializer.fromJson<String>(json['status']),
      signature: serializer.fromJson<String?>(json['signature']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      syncedAt: serializer.fromJson<int?>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<String>(eventId),
      'testNumber': serializer.toJson<int>(testNumber),
      'carNumber': serializer.toJson<int>(carNumber),
      'runNumber': serializer.toJson<int>(runNumber),
      'officialId': serializer.toJson<String?>(officialId),
      'timestamp': serializer.toJson<int>(timestamp),
      'status': serializer.toJson<String>(status),
      'signature': serializer.toJson<String?>(signature),
      'createdAt': serializer.toJson<int>(createdAt),
      'syncedAt': serializer.toJson<int?>(syncedAt),
    };
  }

  StartEvent copyWith({
    int? id,
    String? eventId,
    int? testNumber,
    int? carNumber,
    int? runNumber,
    Value<String?> officialId = const Value.absent(),
    int? timestamp,
    String? status,
    Value<String?> signature = const Value.absent(),
    int? createdAt,
    Value<int?> syncedAt = const Value.absent(),
  }) => StartEvent(
    id: id ?? this.id,
    eventId: eventId ?? this.eventId,
    testNumber: testNumber ?? this.testNumber,
    carNumber: carNumber ?? this.carNumber,
    runNumber: runNumber ?? this.runNumber,
    officialId: officialId.present ? officialId.value : this.officialId,
    timestamp: timestamp ?? this.timestamp,
    status: status ?? this.status,
    signature: signature.present ? signature.value : this.signature,
    createdAt: createdAt ?? this.createdAt,
    syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
  );
  StartEvent copyWithCompanion(StartEventsCompanion data) {
    return StartEvent(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      testNumber:
          data.testNumber.present ? data.testNumber.value : this.testNumber,
      carNumber: data.carNumber.present ? data.carNumber.value : this.carNumber,
      runNumber: data.runNumber.present ? data.runNumber.value : this.runNumber,
      officialId:
          data.officialId.present ? data.officialId.value : this.officialId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      status: data.status.present ? data.status.value : this.status,
      signature: data.signature.present ? data.signature.value : this.signature,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StartEvent(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('testNumber: $testNumber, ')
          ..write('carNumber: $carNumber, ')
          ..write('runNumber: $runNumber, ')
          ..write('officialId: $officialId, ')
          ..write('timestamp: $timestamp, ')
          ..write('status: $status, ')
          ..write('signature: $signature, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    eventId,
    testNumber,
    carNumber,
    runNumber,
    officialId,
    timestamp,
    status,
    signature,
    createdAt,
    syncedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StartEvent &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.testNumber == this.testNumber &&
          other.carNumber == this.carNumber &&
          other.runNumber == this.runNumber &&
          other.officialId == this.officialId &&
          other.timestamp == this.timestamp &&
          other.status == this.status &&
          other.signature == this.signature &&
          other.createdAt == this.createdAt &&
          other.syncedAt == this.syncedAt);
}

class StartEventsCompanion extends UpdateCompanion<StartEvent> {
  final Value<int> id;
  final Value<String> eventId;
  final Value<int> testNumber;
  final Value<int> carNumber;
  final Value<int> runNumber;
  final Value<String?> officialId;
  final Value<int> timestamp;
  final Value<String> status;
  final Value<String?> signature;
  final Value<int> createdAt;
  final Value<int?> syncedAt;
  const StartEventsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.testNumber = const Value.absent(),
    this.carNumber = const Value.absent(),
    this.runNumber = const Value.absent(),
    this.officialId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.status = const Value.absent(),
    this.signature = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncedAt = const Value.absent(),
  });
  StartEventsCompanion.insert({
    this.id = const Value.absent(),
    required String eventId,
    required int testNumber,
    required int carNumber,
    required int runNumber,
    this.officialId = const Value.absent(),
    required int timestamp,
    this.status = const Value.absent(),
    this.signature = const Value.absent(),
    required int createdAt,
    this.syncedAt = const Value.absent(),
  }) : eventId = Value(eventId),
       testNumber = Value(testNumber),
       carNumber = Value(carNumber),
       runNumber = Value(runNumber),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt);
  static Insertable<StartEvent> custom({
    Expression<int>? id,
    Expression<String>? eventId,
    Expression<int>? testNumber,
    Expression<int>? carNumber,
    Expression<int>? runNumber,
    Expression<String>? officialId,
    Expression<int>? timestamp,
    Expression<String>? status,
    Expression<String>? signature,
    Expression<int>? createdAt,
    Expression<int>? syncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (testNumber != null) 'test_number': testNumber,
      if (carNumber != null) 'car_number': carNumber,
      if (runNumber != null) 'run_number': runNumber,
      if (officialId != null) 'official_id': officialId,
      if (timestamp != null) 'timestamp': timestamp,
      if (status != null) 'status': status,
      if (signature != null) 'signature': signature,
      if (createdAt != null) 'created_at': createdAt,
      if (syncedAt != null) 'synced_at': syncedAt,
    });
  }

  StartEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? eventId,
    Value<int>? testNumber,
    Value<int>? carNumber,
    Value<int>? runNumber,
    Value<String?>? officialId,
    Value<int>? timestamp,
    Value<String>? status,
    Value<String?>? signature,
    Value<int>? createdAt,
    Value<int?>? syncedAt,
  }) {
    return StartEventsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      testNumber: testNumber ?? this.testNumber,
      carNumber: carNumber ?? this.carNumber,
      runNumber: runNumber ?? this.runNumber,
      officialId: officialId ?? this.officialId,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      signature: signature ?? this.signature,
      createdAt: createdAt ?? this.createdAt,
      syncedAt: syncedAt ?? this.syncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (testNumber.present) {
      map['test_number'] = Variable<int>(testNumber.value);
    }
    if (carNumber.present) {
      map['car_number'] = Variable<int>(carNumber.value);
    }
    if (runNumber.present) {
      map['run_number'] = Variable<int>(runNumber.value);
    }
    if (officialId.present) {
      map['official_id'] = Variable<String>(officialId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<int>(syncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StartEventsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('testNumber: $testNumber, ')
          ..write('carNumber: $carNumber, ')
          ..write('runNumber: $runNumber, ')
          ..write('officialId: $officialId, ')
          ..write('timestamp: $timestamp, ')
          ..write('status: $status, ')
          ..write('signature: $signature, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }
}

class $FinishEventsTable extends FinishEvents
    with TableInfo<$FinishEventsTable, FinishEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FinishEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id)',
    ),
  );
  static const VerificationMeta _testNumberMeta = const VerificationMeta(
    'testNumber',
  );
  @override
  late final GeneratedColumn<int> testNumber = GeneratedColumn<int>(
    'test_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carNumberMeta = const VerificationMeta(
    'carNumber',
  );
  @override
  late final GeneratedColumn<int> carNumber = GeneratedColumn<int>(
    'car_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _runNumberMeta = const VerificationMeta(
    'runNumber',
  );
  @override
  late final GeneratedColumn<int> runNumber = GeneratedColumn<int>(
    'run_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _officialIdMeta = const VerificationMeta(
    'officialId',
  );
  @override
  late final GeneratedColumn<String> officialId = GeneratedColumn<String>(
    'official_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _markerHitsMeta = const VerificationMeta(
    'markerHits',
  );
  @override
  late final GeneratedColumn<int> markerHits = GeneratedColumn<int>(
    'marker_hits',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _signatureMeta = const VerificationMeta(
    'signature',
  );
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
    'signature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<int> syncedAt = GeneratedColumn<int>(
    'synced_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventId,
    testNumber,
    carNumber,
    runNumber,
    officialId,
    timestamp,
    markerHits,
    status,
    signature,
    createdAt,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'finish_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<FinishEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('test_number')) {
      context.handle(
        _testNumberMeta,
        testNumber.isAcceptableOrUnknown(data['test_number']!, _testNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_testNumberMeta);
    }
    if (data.containsKey('car_number')) {
      context.handle(
        _carNumberMeta,
        carNumber.isAcceptableOrUnknown(data['car_number']!, _carNumberMeta),
      );
    }
    if (data.containsKey('run_number')) {
      context.handle(
        _runNumberMeta,
        runNumber.isAcceptableOrUnknown(data['run_number']!, _runNumberMeta),
      );
    }
    if (data.containsKey('official_id')) {
      context.handle(
        _officialIdMeta,
        officialId.isAcceptableOrUnknown(data['official_id']!, _officialIdMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('marker_hits')) {
      context.handle(
        _markerHitsMeta,
        markerHits.isAcceptableOrUnknown(data['marker_hits']!, _markerHitsMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('signature')) {
      context.handle(
        _signatureMeta,
        signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinishEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinishEvent(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      eventId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}event_id'],
          )!,
      testNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}test_number'],
          )!,
      carNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}car_number'],
      ),
      runNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}run_number'],
      ),
      officialId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}official_id'],
      ),
      timestamp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}timestamp'],
          )!,
      markerHits:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}marker_hits'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      signature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}created_at'],
          )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synced_at'],
      ),
    );
  }

  @override
  $FinishEventsTable createAlias(String alias) {
    return $FinishEventsTable(attachedDatabase, alias);
  }
}

class FinishEvent extends DataClass implements Insertable<FinishEvent> {
  final int id;
  final String eventId;
  final int testNumber;
  final int? carNumber;
  final int? runNumber;
  final String? officialId;
  final int timestamp;
  final int markerHits;
  final String status;
  final String? signature;
  final int createdAt;
  final int? syncedAt;
  const FinishEvent({
    required this.id,
    required this.eventId,
    required this.testNumber,
    this.carNumber,
    this.runNumber,
    this.officialId,
    required this.timestamp,
    required this.markerHits,
    required this.status,
    this.signature,
    required this.createdAt,
    this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<String>(eventId);
    map['test_number'] = Variable<int>(testNumber);
    if (!nullToAbsent || carNumber != null) {
      map['car_number'] = Variable<int>(carNumber);
    }
    if (!nullToAbsent || runNumber != null) {
      map['run_number'] = Variable<int>(runNumber);
    }
    if (!nullToAbsent || officialId != null) {
      map['official_id'] = Variable<String>(officialId);
    }
    map['timestamp'] = Variable<int>(timestamp);
    map['marker_hits'] = Variable<int>(markerHits);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || signature != null) {
      map['signature'] = Variable<String>(signature);
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<int>(syncedAt);
    }
    return map;
  }

  FinishEventsCompanion toCompanion(bool nullToAbsent) {
    return FinishEventsCompanion(
      id: Value(id),
      eventId: Value(eventId),
      testNumber: Value(testNumber),
      carNumber:
          carNumber == null && nullToAbsent
              ? const Value.absent()
              : Value(carNumber),
      runNumber:
          runNumber == null && nullToAbsent
              ? const Value.absent()
              : Value(runNumber),
      officialId:
          officialId == null && nullToAbsent
              ? const Value.absent()
              : Value(officialId),
      timestamp: Value(timestamp),
      markerHits: Value(markerHits),
      status: Value(status),
      signature:
          signature == null && nullToAbsent
              ? const Value.absent()
              : Value(signature),
      createdAt: Value(createdAt),
      syncedAt:
          syncedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(syncedAt),
    );
  }

  factory FinishEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinishEvent(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      testNumber: serializer.fromJson<int>(json['testNumber']),
      carNumber: serializer.fromJson<int?>(json['carNumber']),
      runNumber: serializer.fromJson<int?>(json['runNumber']),
      officialId: serializer.fromJson<String?>(json['officialId']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      markerHits: serializer.fromJson<int>(json['markerHits']),
      status: serializer.fromJson<String>(json['status']),
      signature: serializer.fromJson<String?>(json['signature']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      syncedAt: serializer.fromJson<int?>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<String>(eventId),
      'testNumber': serializer.toJson<int>(testNumber),
      'carNumber': serializer.toJson<int?>(carNumber),
      'runNumber': serializer.toJson<int?>(runNumber),
      'officialId': serializer.toJson<String?>(officialId),
      'timestamp': serializer.toJson<int>(timestamp),
      'markerHits': serializer.toJson<int>(markerHits),
      'status': serializer.toJson<String>(status),
      'signature': serializer.toJson<String?>(signature),
      'createdAt': serializer.toJson<int>(createdAt),
      'syncedAt': serializer.toJson<int?>(syncedAt),
    };
  }

  FinishEvent copyWith({
    int? id,
    String? eventId,
    int? testNumber,
    Value<int?> carNumber = const Value.absent(),
    Value<int?> runNumber = const Value.absent(),
    Value<String?> officialId = const Value.absent(),
    int? timestamp,
    int? markerHits,
    String? status,
    Value<String?> signature = const Value.absent(),
    int? createdAt,
    Value<int?> syncedAt = const Value.absent(),
  }) => FinishEvent(
    id: id ?? this.id,
    eventId: eventId ?? this.eventId,
    testNumber: testNumber ?? this.testNumber,
    carNumber: carNumber.present ? carNumber.value : this.carNumber,
    runNumber: runNumber.present ? runNumber.value : this.runNumber,
    officialId: officialId.present ? officialId.value : this.officialId,
    timestamp: timestamp ?? this.timestamp,
    markerHits: markerHits ?? this.markerHits,
    status: status ?? this.status,
    signature: signature.present ? signature.value : this.signature,
    createdAt: createdAt ?? this.createdAt,
    syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
  );
  FinishEvent copyWithCompanion(FinishEventsCompanion data) {
    return FinishEvent(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      testNumber:
          data.testNumber.present ? data.testNumber.value : this.testNumber,
      carNumber: data.carNumber.present ? data.carNumber.value : this.carNumber,
      runNumber: data.runNumber.present ? data.runNumber.value : this.runNumber,
      officialId:
          data.officialId.present ? data.officialId.value : this.officialId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      markerHits:
          data.markerHits.present ? data.markerHits.value : this.markerHits,
      status: data.status.present ? data.status.value : this.status,
      signature: data.signature.present ? data.signature.value : this.signature,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinishEvent(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('testNumber: $testNumber, ')
          ..write('carNumber: $carNumber, ')
          ..write('runNumber: $runNumber, ')
          ..write('officialId: $officialId, ')
          ..write('timestamp: $timestamp, ')
          ..write('markerHits: $markerHits, ')
          ..write('status: $status, ')
          ..write('signature: $signature, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    eventId,
    testNumber,
    carNumber,
    runNumber,
    officialId,
    timestamp,
    markerHits,
    status,
    signature,
    createdAt,
    syncedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinishEvent &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.testNumber == this.testNumber &&
          other.carNumber == this.carNumber &&
          other.runNumber == this.runNumber &&
          other.officialId == this.officialId &&
          other.timestamp == this.timestamp &&
          other.markerHits == this.markerHits &&
          other.status == this.status &&
          other.signature == this.signature &&
          other.createdAt == this.createdAt &&
          other.syncedAt == this.syncedAt);
}

class FinishEventsCompanion extends UpdateCompanion<FinishEvent> {
  final Value<int> id;
  final Value<String> eventId;
  final Value<int> testNumber;
  final Value<int?> carNumber;
  final Value<int?> runNumber;
  final Value<String?> officialId;
  final Value<int> timestamp;
  final Value<int> markerHits;
  final Value<String> status;
  final Value<String?> signature;
  final Value<int> createdAt;
  final Value<int?> syncedAt;
  const FinishEventsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.testNumber = const Value.absent(),
    this.carNumber = const Value.absent(),
    this.runNumber = const Value.absent(),
    this.officialId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.markerHits = const Value.absent(),
    this.status = const Value.absent(),
    this.signature = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncedAt = const Value.absent(),
  });
  FinishEventsCompanion.insert({
    this.id = const Value.absent(),
    required String eventId,
    required int testNumber,
    this.carNumber = const Value.absent(),
    this.runNumber = const Value.absent(),
    this.officialId = const Value.absent(),
    required int timestamp,
    this.markerHits = const Value.absent(),
    this.status = const Value.absent(),
    this.signature = const Value.absent(),
    required int createdAt,
    this.syncedAt = const Value.absent(),
  }) : eventId = Value(eventId),
       testNumber = Value(testNumber),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt);
  static Insertable<FinishEvent> custom({
    Expression<int>? id,
    Expression<String>? eventId,
    Expression<int>? testNumber,
    Expression<int>? carNumber,
    Expression<int>? runNumber,
    Expression<String>? officialId,
    Expression<int>? timestamp,
    Expression<int>? markerHits,
    Expression<String>? status,
    Expression<String>? signature,
    Expression<int>? createdAt,
    Expression<int>? syncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (testNumber != null) 'test_number': testNumber,
      if (carNumber != null) 'car_number': carNumber,
      if (runNumber != null) 'run_number': runNumber,
      if (officialId != null) 'official_id': officialId,
      if (timestamp != null) 'timestamp': timestamp,
      if (markerHits != null) 'marker_hits': markerHits,
      if (status != null) 'status': status,
      if (signature != null) 'signature': signature,
      if (createdAt != null) 'created_at': createdAt,
      if (syncedAt != null) 'synced_at': syncedAt,
    });
  }

  FinishEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? eventId,
    Value<int>? testNumber,
    Value<int?>? carNumber,
    Value<int?>? runNumber,
    Value<String?>? officialId,
    Value<int>? timestamp,
    Value<int>? markerHits,
    Value<String>? status,
    Value<String?>? signature,
    Value<int>? createdAt,
    Value<int?>? syncedAt,
  }) {
    return FinishEventsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      testNumber: testNumber ?? this.testNumber,
      carNumber: carNumber ?? this.carNumber,
      runNumber: runNumber ?? this.runNumber,
      officialId: officialId ?? this.officialId,
      timestamp: timestamp ?? this.timestamp,
      markerHits: markerHits ?? this.markerHits,
      status: status ?? this.status,
      signature: signature ?? this.signature,
      createdAt: createdAt ?? this.createdAt,
      syncedAt: syncedAt ?? this.syncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (testNumber.present) {
      map['test_number'] = Variable<int>(testNumber.value);
    }
    if (carNumber.present) {
      map['car_number'] = Variable<int>(carNumber.value);
    }
    if (runNumber.present) {
      map['run_number'] = Variable<int>(runNumber.value);
    }
    if (officialId.present) {
      map['official_id'] = Variable<String>(officialId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (markerHits.present) {
      map['marker_hits'] = Variable<int>(markerHits.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<int>(syncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinishEventsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('testNumber: $testNumber, ')
          ..write('carNumber: $carNumber, ')
          ..write('runNumber: $runNumber, ')
          ..write('officialId: $officialId, ')
          ..write('timestamp: $timestamp, ')
          ..write('markerHits: $markerHits, ')
          ..write('status: $status, ')
          ..write('signature: $signature, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isOutrightMeta = const VerificationMeta(
    'isOutright',
  );
  @override
  late final GeneratedColumn<int> isOutright = GeneratedColumn<int>(
    'is_outright',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventId,
    name,
    sortOrder,
    isOutright,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_outright')) {
      context.handle(
        _isOutrightMeta,
        isOutright.isAcceptableOrUnknown(data['is_outright']!, _isOutrightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {eventId, name},
  ];
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      eventId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}event_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      sortOrder:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sort_order'],
          )!,
      isOutright:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}is_outright'],
          )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String eventId;
  final String name;
  final int sortOrder;
  final int isOutright;
  const Category({
    required this.id,
    required this.eventId,
    required this.name,
    required this.sortOrder,
    required this.isOutright,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<String>(eventId);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_outright'] = Variable<int>(isOutright);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      eventId: Value(eventId),
      name: Value(name),
      sortOrder: Value(sortOrder),
      isOutright: Value(isOutright),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      name: serializer.fromJson<String>(json['name']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isOutright: serializer.fromJson<int>(json['isOutright']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<String>(eventId),
      'name': serializer.toJson<String>(name),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isOutright': serializer.toJson<int>(isOutright),
    };
  }

  Category copyWith({
    int? id,
    String? eventId,
    String? name,
    int? sortOrder,
    int? isOutright,
  }) => Category(
    id: id ?? this.id,
    eventId: eventId ?? this.eventId,
    name: name ?? this.name,
    sortOrder: sortOrder ?? this.sortOrder,
    isOutright: isOutright ?? this.isOutright,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      name: data.name.present ? data.name.value : this.name,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isOutright:
          data.isOutright.present ? data.isOutright.value : this.isOutright,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isOutright: $isOutright')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, eventId, name, sortOrder, isOutright);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.name == this.name &&
          other.sortOrder == this.sortOrder &&
          other.isOutright == this.isOutright);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> eventId;
  final Value<String> name;
  final Value<int> sortOrder;
  final Value<int> isOutright;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.name = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isOutright = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String eventId,
    required String name,
    this.sortOrder = const Value.absent(),
    this.isOutright = const Value.absent(),
  }) : eventId = Value(eventId),
       name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? eventId,
    Expression<String>? name,
    Expression<int>? sortOrder,
    Expression<int>? isOutright,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (name != null) 'name': name,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isOutright != null) 'is_outright': isOutright,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? eventId,
    Value<String>? name,
    Value<int>? sortOrder,
    Value<int>? isOutright,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      name: name ?? this.name,
      sortOrder: sortOrder ?? this.sortOrder,
      isOutright: isOutright ?? this.isOutright,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isOutright.present) {
      map['is_outright'] = Variable<int>(isOutright.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isOutright: $isOutright')
          ..write(')'))
        .toString();
  }
}

class $EntryCategoriesTable extends EntryCategories
    with TableInfo<$EntryCategoriesTable, EntryCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntryCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<int> entryId = GeneratedColumn<int>(
    'entry_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES entries (id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [entryId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entry_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<EntryCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entryId, categoryId};
  @override
  EntryCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntryCategory(
      entryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}entry_id'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
    );
  }

  @override
  $EntryCategoriesTable createAlias(String alias) {
    return $EntryCategoriesTable(attachedDatabase, alias);
  }
}

class EntryCategory extends DataClass implements Insertable<EntryCategory> {
  final int entryId;
  final int categoryId;
  const EntryCategory({required this.entryId, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entry_id'] = Variable<int>(entryId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  EntryCategoriesCompanion toCompanion(bool nullToAbsent) {
    return EntryCategoriesCompanion(
      entryId: Value(entryId),
      categoryId: Value(categoryId),
    );
  }

  factory EntryCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntryCategory(
      entryId: serializer.fromJson<int>(json['entryId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entryId': serializer.toJson<int>(entryId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  EntryCategory copyWith({int? entryId, int? categoryId}) => EntryCategory(
    entryId: entryId ?? this.entryId,
    categoryId: categoryId ?? this.categoryId,
  );
  EntryCategory copyWithCompanion(EntryCategoriesCompanion data) {
    return EntryCategory(
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntryCategory(')
          ..write('entryId: $entryId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(entryId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntryCategory &&
          other.entryId == this.entryId &&
          other.categoryId == this.categoryId);
}

class EntryCategoriesCompanion extends UpdateCompanion<EntryCategory> {
  final Value<int> entryId;
  final Value<int> categoryId;
  final Value<int> rowid;
  const EntryCategoriesCompanion({
    this.entryId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EntryCategoriesCompanion.insert({
    required int entryId,
    required int categoryId,
    this.rowid = const Value.absent(),
  }) : entryId = Value(entryId),
       categoryId = Value(categoryId);
  static Insertable<EntryCategory> custom({
    Expression<int>? entryId,
    Expression<int>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (entryId != null) 'entry_id': entryId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EntryCategoriesCompanion copyWith({
    Value<int>? entryId,
    Value<int>? categoryId,
    Value<int>? rowid,
  }) {
    return EntryCategoriesCompanion(
      entryId: entryId ?? this.entryId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntryCategoriesCompanion(')
          ..write('entryId: $entryId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfficialsTable extends Officials
    with TableInfo<$OfficialsTable, Official> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfficialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _didMeta = const VerificationMeta('did');
  @override
  late final GeneratedColumn<String> did = GeneratedColumn<String>(
    'did',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('official'),
  );
  static const VerificationMeta _publicKeyMeta = const VerificationMeta(
    'publicKey',
  );
  @override
  late final GeneratedColumn<String> publicKey = GeneratedColumn<String>(
    'public_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isAuthorizedMeta = const VerificationMeta(
    'isAuthorized',
  );
  @override
  late final GeneratedColumn<int> isAuthorized = GeneratedColumn<int>(
    'is_authorized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    did,
    name,
    role,
    publicKey,
    isAuthorized,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'officials';
  @override
  VerificationContext validateIntegrity(
    Insertable<Official> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('did')) {
      context.handle(
        _didMeta,
        did.isAcceptableOrUnknown(data['did']!, _didMeta),
      );
    } else if (isInserting) {
      context.missing(_didMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('public_key')) {
      context.handle(
        _publicKeyMeta,
        publicKey.isAcceptableOrUnknown(data['public_key']!, _publicKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_publicKeyMeta);
    }
    if (data.containsKey('is_authorized')) {
      context.handle(
        _isAuthorizedMeta,
        isAuthorized.isAcceptableOrUnknown(
          data['is_authorized']!,
          _isAuthorizedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {did},
  ];
  @override
  Official map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Official(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      did:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}did'],
          )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      role:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}role'],
          )!,
      publicKey:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}public_key'],
          )!,
      isAuthorized:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}is_authorized'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $OfficialsTable createAlias(String alias) {
    return $OfficialsTable(attachedDatabase, alias);
  }
}

class Official extends DataClass implements Insertable<Official> {
  final int id;
  final String did;
  final String? name;
  final String role;
  final String publicKey;
  final int isAuthorized;
  final int createdAt;
  const Official({
    required this.id,
    required this.did,
    this.name,
    required this.role,
    required this.publicKey,
    required this.isAuthorized,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['did'] = Variable<String>(did);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['role'] = Variable<String>(role);
    map['public_key'] = Variable<String>(publicKey);
    map['is_authorized'] = Variable<int>(isAuthorized);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  OfficialsCompanion toCompanion(bool nullToAbsent) {
    return OfficialsCompanion(
      id: Value(id),
      did: Value(did),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      role: Value(role),
      publicKey: Value(publicKey),
      isAuthorized: Value(isAuthorized),
      createdAt: Value(createdAt),
    );
  }

  factory Official.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Official(
      id: serializer.fromJson<int>(json['id']),
      did: serializer.fromJson<String>(json['did']),
      name: serializer.fromJson<String?>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      publicKey: serializer.fromJson<String>(json['publicKey']),
      isAuthorized: serializer.fromJson<int>(json['isAuthorized']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'did': serializer.toJson<String>(did),
      'name': serializer.toJson<String?>(name),
      'role': serializer.toJson<String>(role),
      'publicKey': serializer.toJson<String>(publicKey),
      'isAuthorized': serializer.toJson<int>(isAuthorized),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Official copyWith({
    int? id,
    String? did,
    Value<String?> name = const Value.absent(),
    String? role,
    String? publicKey,
    int? isAuthorized,
    int? createdAt,
  }) => Official(
    id: id ?? this.id,
    did: did ?? this.did,
    name: name.present ? name.value : this.name,
    role: role ?? this.role,
    publicKey: publicKey ?? this.publicKey,
    isAuthorized: isAuthorized ?? this.isAuthorized,
    createdAt: createdAt ?? this.createdAt,
  );
  Official copyWithCompanion(OfficialsCompanion data) {
    return Official(
      id: data.id.present ? data.id.value : this.id,
      did: data.did.present ? data.did.value : this.did,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      publicKey: data.publicKey.present ? data.publicKey.value : this.publicKey,
      isAuthorized:
          data.isAuthorized.present
              ? data.isAuthorized.value
              : this.isAuthorized,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Official(')
          ..write('id: $id, ')
          ..write('did: $did, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('publicKey: $publicKey, ')
          ..write('isAuthorized: $isAuthorized, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, did, name, role, publicKey, isAuthorized, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Official &&
          other.id == this.id &&
          other.did == this.did &&
          other.name == this.name &&
          other.role == this.role &&
          other.publicKey == this.publicKey &&
          other.isAuthorized == this.isAuthorized &&
          other.createdAt == this.createdAt);
}

class OfficialsCompanion extends UpdateCompanion<Official> {
  final Value<int> id;
  final Value<String> did;
  final Value<String?> name;
  final Value<String> role;
  final Value<String> publicKey;
  final Value<int> isAuthorized;
  final Value<int> createdAt;
  const OfficialsCompanion({
    this.id = const Value.absent(),
    this.did = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.isAuthorized = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OfficialsCompanion.insert({
    this.id = const Value.absent(),
    required String did,
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    required String publicKey,
    this.isAuthorized = const Value.absent(),
    required int createdAt,
  }) : did = Value(did),
       publicKey = Value(publicKey),
       createdAt = Value(createdAt);
  static Insertable<Official> custom({
    Expression<int>? id,
    Expression<String>? did,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? publicKey,
    Expression<int>? isAuthorized,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (did != null) 'did': did,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (publicKey != null) 'public_key': publicKey,
      if (isAuthorized != null) 'is_authorized': isAuthorized,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OfficialsCompanion copyWith({
    Value<int>? id,
    Value<String>? did,
    Value<String?>? name,
    Value<String>? role,
    Value<String>? publicKey,
    Value<int>? isAuthorized,
    Value<int>? createdAt,
  }) {
    return OfficialsCompanion(
      id: id ?? this.id,
      did: did ?? this.did,
      name: name ?? this.name,
      role: role ?? this.role,
      publicKey: publicKey ?? this.publicKey,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (did.present) {
      map['did'] = Variable<String>(did.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (publicKey.present) {
      map['public_key'] = Variable<String>(publicKey.value);
    }
    if (isAuthorized.present) {
      map['is_authorized'] = Variable<int>(isAuthorized.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfficialsCompanion(')
          ..write('id: $id, ')
          ..write('did: $did, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('publicKey: $publicKey, ')
          ..write('isAuthorized: $isAuthorized, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EventsTable events = $EventsTable(this);
  late final $TestsTable tests = $TestsTable(this);
  late final $EntriesTable entries = $EntriesTable(this);
  late final $StartEventsTable startEvents = $StartEventsTable(this);
  late final $FinishEventsTable finishEvents = $FinishEventsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $EntryCategoriesTable entryCategories = $EntryCategoriesTable(
    this,
  );
  late final $OfficialsTable officials = $OfficialsTable(this);
  late final EventDao eventDao = EventDao(this as AppDatabase);
  late final TimingDao timingDao = TimingDao(this as AppDatabase);
  late final EntryDao entryDao = EntryDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    events,
    tests,
    entries,
    startEvents,
    finishEvents,
    categories,
    entryCategories,
    officials,
  ];
}

typedef $$EventsTableCreateCompanionBuilder =
    EventsCompanion Function({
      required String id,
      required String name,
      required int date,
      Value<String?> organiser,
      Value<int> bestX,
      Value<int> bestY,
      required int scheduledTests,
      Value<String> status,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$EventsTableUpdateCompanionBuilder =
    EventsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> date,
      Value<String?> organiser,
      Value<int> bestX,
      Value<int> bestY,
      Value<int> scheduledTests,
      Value<String> status,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$EventsTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TestsTable, List<Test>> _testsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tests,
    aliasName: $_aliasNameGenerator(db.events.id, db.tests.eventId),
  );

  $$TestsTableProcessedTableManager get testsRefs {
    final manager = $$TestsTableTableManager(
      $_db,
      $_db.tests,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_testsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EntriesTable, List<Entry>> _entriesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.entries,
    aliasName: $_aliasNameGenerator(db.events.id, db.entries.eventId),
  );

  $$EntriesTableProcessedTableManager get entriesRefs {
    final manager = $$EntriesTableTableManager(
      $_db,
      $_db.entries,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_entriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StartEventsTable, List<StartEvent>>
  _startEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.startEvents,
    aliasName: $_aliasNameGenerator(db.events.id, db.startEvents.eventId),
  );

  $$StartEventsTableProcessedTableManager get startEventsRefs {
    final manager = $$StartEventsTableTableManager(
      $_db,
      $_db.startEvents,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_startEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FinishEventsTable, List<FinishEvent>>
  _finishEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.finishEvents,
    aliasName: $_aliasNameGenerator(db.events.id, db.finishEvents.eventId),
  );

  $$FinishEventsTableProcessedTableManager get finishEventsRefs {
    final manager = $$FinishEventsTableTableManager(
      $_db,
      $_db.finishEvents,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_finishEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CategoriesTable, List<Category>>
  _categoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.categories,
    aliasName: $_aliasNameGenerator(db.events.id, db.categories.eventId),
  );

  $$CategoriesTableProcessedTableManager get categoriesRefs {
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_categoriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organiser => $composableBuilder(
    column: $table.organiser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestX => $composableBuilder(
    column: $table.bestX,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestY => $composableBuilder(
    column: $table.bestY,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduledTests => $composableBuilder(
    column: $table.scheduledTests,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> testsRefs(
    Expression<bool> Function($$TestsTableFilterComposer f) f,
  ) {
    final $$TestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tests,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestsTableFilterComposer(
            $db: $db,
            $table: $db.tests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> entriesRefs(
    Expression<bool> Function($$EntriesTableFilterComposer f) f,
  ) {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableFilterComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> startEventsRefs(
    Expression<bool> Function($$StartEventsTableFilterComposer f) f,
  ) {
    final $$StartEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.startEvents,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StartEventsTableFilterComposer(
            $db: $db,
            $table: $db.startEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> finishEventsRefs(
    Expression<bool> Function($$FinishEventsTableFilterComposer f) f,
  ) {
    final $$FinishEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.finishEvents,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FinishEventsTableFilterComposer(
            $db: $db,
            $table: $db.finishEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> categoriesRefs(
    Expression<bool> Function($$CategoriesTableFilterComposer f) f,
  ) {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organiser => $composableBuilder(
    column: $table.organiser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestX => $composableBuilder(
    column: $table.bestX,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestY => $composableBuilder(
    column: $table.bestY,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduledTests => $composableBuilder(
    column: $table.scheduledTests,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get organiser =>
      $composableBuilder(column: $table.organiser, builder: (column) => column);

  GeneratedColumn<int> get bestX =>
      $composableBuilder(column: $table.bestX, builder: (column) => column);

  GeneratedColumn<int> get bestY =>
      $composableBuilder(column: $table.bestY, builder: (column) => column);

  GeneratedColumn<int> get scheduledTests => $composableBuilder(
    column: $table.scheduledTests,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> testsRefs<T extends Object>(
    Expression<T> Function($$TestsTableAnnotationComposer a) f,
  ) {
    final $$TestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tests,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestsTableAnnotationComposer(
            $db: $db,
            $table: $db.tests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> entriesRefs<T extends Object>(
    Expression<T> Function($$EntriesTableAnnotationComposer a) f,
  ) {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> startEventsRefs<T extends Object>(
    Expression<T> Function($$StartEventsTableAnnotationComposer a) f,
  ) {
    final $$StartEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.startEvents,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StartEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.startEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> finishEventsRefs<T extends Object>(
    Expression<T> Function($$FinishEventsTableAnnotationComposer a) f,
  ) {
    final $$FinishEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.finishEvents,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FinishEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.finishEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> categoriesRefs<T extends Object>(
    Expression<T> Function($$CategoriesTableAnnotationComposer a) f,
  ) {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTable,
          Event,
          $$EventsTableFilterComposer,
          $$EventsTableOrderingComposer,
          $$EventsTableAnnotationComposer,
          $$EventsTableCreateCompanionBuilder,
          $$EventsTableUpdateCompanionBuilder,
          (Event, $$EventsTableReferences),
          Event,
          PrefetchHooks Function({
            bool testsRefs,
            bool entriesRefs,
            bool startEventsRefs,
            bool finishEventsRefs,
            bool categoriesRefs,
          })
        > {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String?> organiser = const Value.absent(),
                Value<int> bestX = const Value.absent(),
                Value<int> bestY = const Value.absent(),
                Value<int> scheduledTests = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion(
                id: id,
                name: name,
                date: date,
                organiser: organiser,
                bestX: bestX,
                bestY: bestY,
                scheduledTests: scheduledTests,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int date,
                Value<String?> organiser = const Value.absent(),
                Value<int> bestX = const Value.absent(),
                Value<int> bestY = const Value.absent(),
                required int scheduledTests,
                Value<String> status = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                name: name,
                date: date,
                organiser: organiser,
                bestX: bestX,
                bestY: bestY,
                scheduledTests: scheduledTests,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EventsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            testsRefs = false,
            entriesRefs = false,
            startEventsRefs = false,
            finishEventsRefs = false,
            categoriesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (testsRefs) db.tests,
                if (entriesRefs) db.entries,
                if (startEventsRefs) db.startEvents,
                if (finishEventsRefs) db.finishEvents,
                if (categoriesRefs) db.categories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (testsRefs)
                    await $_getPrefetchedData<Event, $EventsTable, Test>(
                      currentTable: table,
                      referencedTable: $$EventsTableReferences._testsRefsTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventsTableReferences(db, table, p0).testsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.eventId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (entriesRefs)
                    await $_getPrefetchedData<Event, $EventsTable, Entry>(
                      currentTable: table,
                      referencedTable: $$EventsTableReferences
                          ._entriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).entriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.eventId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (startEventsRefs)
                    await $_getPrefetchedData<Event, $EventsTable, StartEvent>(
                      currentTable: table,
                      referencedTable: $$EventsTableReferences
                          ._startEventsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).startEventsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.eventId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (finishEventsRefs)
                    await $_getPrefetchedData<Event, $EventsTable, FinishEvent>(
                      currentTable: table,
                      referencedTable: $$EventsTableReferences
                          ._finishEventsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).finishEventsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.eventId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (categoriesRefs)
                    await $_getPrefetchedData<Event, $EventsTable, Category>(
                      currentTable: table,
                      referencedTable: $$EventsTableReferences
                          ._categoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).categoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.eventId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTable,
      Event,
      $$EventsTableFilterComposer,
      $$EventsTableOrderingComposer,
      $$EventsTableAnnotationComposer,
      $$EventsTableCreateCompanionBuilder,
      $$EventsTableUpdateCompanionBuilder,
      (Event, $$EventsTableReferences),
      Event,
      PrefetchHooks Function({
        bool testsRefs,
        bool entriesRefs,
        bool startEventsRefs,
        bool finishEventsRefs,
        bool categoriesRefs,
      })
    >;
typedef $$TestsTableCreateCompanionBuilder =
    TestsCompanion Function({
      Value<int> id,
      required String eventId,
      required int testNumber,
      Value<String?> name,
      Value<String> startType,
      Value<String> status,
    });
typedef $$TestsTableUpdateCompanionBuilder =
    TestsCompanion Function({
      Value<int> id,
      Value<String> eventId,
      Value<int> testNumber,
      Value<String?> name,
      Value<String> startType,
      Value<String> status,
    });

final class $$TestsTableReferences
    extends BaseReferences<_$AppDatabase, $TestsTable, Test> {
  $$TestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.tests.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TestsTableFilterComposer extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startType => $composableBuilder(
    column: $table.startType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestsTableOrderingComposer
    extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startType => $composableBuilder(
    column: $table.startType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestsTable> {
  $$TestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get startType =>
      $composableBuilder(column: $table.startType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestsTable,
          Test,
          $$TestsTableFilterComposer,
          $$TestsTableOrderingComposer,
          $$TestsTableAnnotationComposer,
          $$TestsTableCreateCompanionBuilder,
          $$TestsTableUpdateCompanionBuilder,
          (Test, $$TestsTableReferences),
          Test,
          PrefetchHooks Function({bool eventId})
        > {
  $$TestsTableTableManager(_$AppDatabase db, $TestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<int> testNumber = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String> startType = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => TestsCompanion(
                id: id,
                eventId: eventId,
                testNumber: testNumber,
                name: name,
                startType: startType,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String eventId,
                required int testNumber,
                Value<String?> name = const Value.absent(),
                Value<String> startType = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => TestsCompanion.insert(
                id: id,
                eventId: eventId,
                testNumber: testNumber,
                name: name,
                startType: startType,
                status: status,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TestsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (eventId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.eventId,
                            referencedTable: $$TestsTableReferences
                                ._eventIdTable(db),
                            referencedColumn:
                                $$TestsTableReferences._eventIdTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestsTable,
      Test,
      $$TestsTableFilterComposer,
      $$TestsTableOrderingComposer,
      $$TestsTableAnnotationComposer,
      $$TestsTableCreateCompanionBuilder,
      $$TestsTableUpdateCompanionBuilder,
      (Test, $$TestsTableReferences),
      Test,
      PrefetchHooks Function({bool eventId})
    >;
typedef $$EntriesTableCreateCompanionBuilder =
    EntriesCompanion Function({
      Value<int> id,
      required String eventId,
      required int carNumber,
      required String driverName,
      Value<String?> licence,
      Value<String?> passenger,
      Value<String> status,
      Value<int?> joinAtTest,
      Value<int?> scratchTest,
      required int registeredAt,
    });
typedef $$EntriesTableUpdateCompanionBuilder =
    EntriesCompanion Function({
      Value<int> id,
      Value<String> eventId,
      Value<int> carNumber,
      Value<String> driverName,
      Value<String?> licence,
      Value<String?> passenger,
      Value<String> status,
      Value<int?> joinAtTest,
      Value<int?> scratchTest,
      Value<int> registeredAt,
    });

final class $$EntriesTableReferences
    extends BaseReferences<_$AppDatabase, $EntriesTable, Entry> {
  $$EntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.entries.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EntryCategoriesTable, List<EntryCategory>>
  _entryCategoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.entryCategories,
    aliasName: $_aliasNameGenerator(db.entries.id, db.entryCategories.entryId),
  );

  $$EntryCategoriesTableProcessedTableManager get entryCategoriesRefs {
    final manager = $$EntryCategoriesTableTableManager(
      $_db,
      $_db.entryCategories,
    ).filter((f) => f.entryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _entryCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EntriesTableFilterComposer
    extends Composer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get carNumber => $composableBuilder(
    column: $table.carNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get driverName => $composableBuilder(
    column: $table.driverName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licence => $composableBuilder(
    column: $table.licence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passenger => $composableBuilder(
    column: $table.passenger,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get joinAtTest => $composableBuilder(
    column: $table.joinAtTest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scratchTest => $composableBuilder(
    column: $table.scratchTest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get registeredAt => $composableBuilder(
    column: $table.registeredAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> entryCategoriesRefs(
    Expression<bool> Function($$EntryCategoriesTableFilterComposer f) f,
  ) {
    final $$EntryCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entryCategories,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntryCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.entryCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get carNumber => $composableBuilder(
    column: $table.carNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get driverName => $composableBuilder(
    column: $table.driverName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licence => $composableBuilder(
    column: $table.licence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passenger => $composableBuilder(
    column: $table.passenger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get joinAtTest => $composableBuilder(
    column: $table.joinAtTest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scratchTest => $composableBuilder(
    column: $table.scratchTest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get registeredAt => $composableBuilder(
    column: $table.registeredAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntriesTable> {
  $$EntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get carNumber =>
      $composableBuilder(column: $table.carNumber, builder: (column) => column);

  GeneratedColumn<String> get driverName => $composableBuilder(
    column: $table.driverName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get licence =>
      $composableBuilder(column: $table.licence, builder: (column) => column);

  GeneratedColumn<String> get passenger =>
      $composableBuilder(column: $table.passenger, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get joinAtTest => $composableBuilder(
    column: $table.joinAtTest,
    builder: (column) => column,
  );

  GeneratedColumn<int> get scratchTest => $composableBuilder(
    column: $table.scratchTest,
    builder: (column) => column,
  );

  GeneratedColumn<int> get registeredAt => $composableBuilder(
    column: $table.registeredAt,
    builder: (column) => column,
  );

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> entryCategoriesRefs<T extends Object>(
    Expression<T> Function($$EntryCategoriesTableAnnotationComposer a) f,
  ) {
    final $$EntryCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entryCategories,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntryCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entryCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EntriesTable,
          Entry,
          $$EntriesTableFilterComposer,
          $$EntriesTableOrderingComposer,
          $$EntriesTableAnnotationComposer,
          $$EntriesTableCreateCompanionBuilder,
          $$EntriesTableUpdateCompanionBuilder,
          (Entry, $$EntriesTableReferences),
          Entry,
          PrefetchHooks Function({bool eventId, bool entryCategoriesRefs})
        > {
  $$EntriesTableTableManager(_$AppDatabase db, $EntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$EntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<int> carNumber = const Value.absent(),
                Value<String> driverName = const Value.absent(),
                Value<String?> licence = const Value.absent(),
                Value<String?> passenger = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> joinAtTest = const Value.absent(),
                Value<int?> scratchTest = const Value.absent(),
                Value<int> registeredAt = const Value.absent(),
              }) => EntriesCompanion(
                id: id,
                eventId: eventId,
                carNumber: carNumber,
                driverName: driverName,
                licence: licence,
                passenger: passenger,
                status: status,
                joinAtTest: joinAtTest,
                scratchTest: scratchTest,
                registeredAt: registeredAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String eventId,
                required int carNumber,
                required String driverName,
                Value<String?> licence = const Value.absent(),
                Value<String?> passenger = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> joinAtTest = const Value.absent(),
                Value<int?> scratchTest = const Value.absent(),
                required int registeredAt,
              }) => EntriesCompanion.insert(
                id: id,
                eventId: eventId,
                carNumber: carNumber,
                driverName: driverName,
                licence: licence,
                passenger: passenger,
                status: status,
                joinAtTest: joinAtTest,
                scratchTest: scratchTest,
                registeredAt: registeredAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EntriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            eventId = false,
            entryCategoriesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (entryCategoriesRefs) db.entryCategories,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (eventId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.eventId,
                            referencedTable: $$EntriesTableReferences
                                ._eventIdTable(db),
                            referencedColumn:
                                $$EntriesTableReferences._eventIdTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (entryCategoriesRefs)
                    await $_getPrefetchedData<
                      Entry,
                      $EntriesTable,
                      EntryCategory
                    >(
                      currentTable: table,
                      referencedTable: $$EntriesTableReferences
                          ._entryCategoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).entryCategoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.entryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EntriesTable,
      Entry,
      $$EntriesTableFilterComposer,
      $$EntriesTableOrderingComposer,
      $$EntriesTableAnnotationComposer,
      $$EntriesTableCreateCompanionBuilder,
      $$EntriesTableUpdateCompanionBuilder,
      (Entry, $$EntriesTableReferences),
      Entry,
      PrefetchHooks Function({bool eventId, bool entryCategoriesRefs})
    >;
typedef $$StartEventsTableCreateCompanionBuilder =
    StartEventsCompanion Function({
      Value<int> id,
      required String eventId,
      required int testNumber,
      required int carNumber,
      required int runNumber,
      Value<String?> officialId,
      required int timestamp,
      Value<String> status,
      Value<String?> signature,
      required int createdAt,
      Value<int?> syncedAt,
    });
typedef $$StartEventsTableUpdateCompanionBuilder =
    StartEventsCompanion Function({
      Value<int> id,
      Value<String> eventId,
      Value<int> testNumber,
      Value<int> carNumber,
      Value<int> runNumber,
      Value<String?> officialId,
      Value<int> timestamp,
      Value<String> status,
      Value<String?> signature,
      Value<int> createdAt,
      Value<int?> syncedAt,
    });

final class $$StartEventsTableReferences
    extends BaseReferences<_$AppDatabase, $StartEventsTable, StartEvent> {
  $$StartEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.startEvents.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StartEventsTableFilterComposer
    extends Composer<_$AppDatabase, $StartEventsTable> {
  $$StartEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get carNumber => $composableBuilder(
    column: $table.carNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get runNumber => $composableBuilder(
    column: $table.runNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officialId => $composableBuilder(
    column: $table.officialId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StartEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $StartEventsTable> {
  $$StartEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get carNumber => $composableBuilder(
    column: $table.carNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get runNumber => $composableBuilder(
    column: $table.runNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officialId => $composableBuilder(
    column: $table.officialId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StartEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StartEventsTable> {
  $$StartEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get carNumber =>
      $composableBuilder(column: $table.carNumber, builder: (column) => column);

  GeneratedColumn<int> get runNumber =>
      $composableBuilder(column: $table.runNumber, builder: (column) => column);

  GeneratedColumn<String> get officialId => $composableBuilder(
    column: $table.officialId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get signature =>
      $composableBuilder(column: $table.signature, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StartEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StartEventsTable,
          StartEvent,
          $$StartEventsTableFilterComposer,
          $$StartEventsTableOrderingComposer,
          $$StartEventsTableAnnotationComposer,
          $$StartEventsTableCreateCompanionBuilder,
          $$StartEventsTableUpdateCompanionBuilder,
          (StartEvent, $$StartEventsTableReferences),
          StartEvent,
          PrefetchHooks Function({bool eventId})
        > {
  $$StartEventsTableTableManager(_$AppDatabase db, $StartEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$StartEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$StartEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$StartEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<int> testNumber = const Value.absent(),
                Value<int> carNumber = const Value.absent(),
                Value<int> runNumber = const Value.absent(),
                Value<String?> officialId = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> signature = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> syncedAt = const Value.absent(),
              }) => StartEventsCompanion(
                id: id,
                eventId: eventId,
                testNumber: testNumber,
                carNumber: carNumber,
                runNumber: runNumber,
                officialId: officialId,
                timestamp: timestamp,
                status: status,
                signature: signature,
                createdAt: createdAt,
                syncedAt: syncedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String eventId,
                required int testNumber,
                required int carNumber,
                required int runNumber,
                Value<String?> officialId = const Value.absent(),
                required int timestamp,
                Value<String> status = const Value.absent(),
                Value<String?> signature = const Value.absent(),
                required int createdAt,
                Value<int?> syncedAt = const Value.absent(),
              }) => StartEventsCompanion.insert(
                id: id,
                eventId: eventId,
                testNumber: testNumber,
                carNumber: carNumber,
                runNumber: runNumber,
                officialId: officialId,
                timestamp: timestamp,
                status: status,
                signature: signature,
                createdAt: createdAt,
                syncedAt: syncedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$StartEventsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (eventId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.eventId,
                            referencedTable: $$StartEventsTableReferences
                                ._eventIdTable(db),
                            referencedColumn:
                                $$StartEventsTableReferences
                                    ._eventIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StartEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StartEventsTable,
      StartEvent,
      $$StartEventsTableFilterComposer,
      $$StartEventsTableOrderingComposer,
      $$StartEventsTableAnnotationComposer,
      $$StartEventsTableCreateCompanionBuilder,
      $$StartEventsTableUpdateCompanionBuilder,
      (StartEvent, $$StartEventsTableReferences),
      StartEvent,
      PrefetchHooks Function({bool eventId})
    >;
typedef $$FinishEventsTableCreateCompanionBuilder =
    FinishEventsCompanion Function({
      Value<int> id,
      required String eventId,
      required int testNumber,
      Value<int?> carNumber,
      Value<int?> runNumber,
      Value<String?> officialId,
      required int timestamp,
      Value<int> markerHits,
      Value<String> status,
      Value<String?> signature,
      required int createdAt,
      Value<int?> syncedAt,
    });
typedef $$FinishEventsTableUpdateCompanionBuilder =
    FinishEventsCompanion Function({
      Value<int> id,
      Value<String> eventId,
      Value<int> testNumber,
      Value<int?> carNumber,
      Value<int?> runNumber,
      Value<String?> officialId,
      Value<int> timestamp,
      Value<int> markerHits,
      Value<String> status,
      Value<String?> signature,
      Value<int> createdAt,
      Value<int?> syncedAt,
    });

final class $$FinishEventsTableReferences
    extends BaseReferences<_$AppDatabase, $FinishEventsTable, FinishEvent> {
  $$FinishEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.finishEvents.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FinishEventsTableFilterComposer
    extends Composer<_$AppDatabase, $FinishEventsTable> {
  $$FinishEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get carNumber => $composableBuilder(
    column: $table.carNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get runNumber => $composableBuilder(
    column: $table.runNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officialId => $composableBuilder(
    column: $table.officialId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get markerHits => $composableBuilder(
    column: $table.markerHits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FinishEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $FinishEventsTable> {
  $$FinishEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get carNumber => $composableBuilder(
    column: $table.carNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get runNumber => $composableBuilder(
    column: $table.runNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officialId => $composableBuilder(
    column: $table.officialId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get markerHits => $composableBuilder(
    column: $table.markerHits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FinishEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FinishEventsTable> {
  $$FinishEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get testNumber => $composableBuilder(
    column: $table.testNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get carNumber =>
      $composableBuilder(column: $table.carNumber, builder: (column) => column);

  GeneratedColumn<int> get runNumber =>
      $composableBuilder(column: $table.runNumber, builder: (column) => column);

  GeneratedColumn<String> get officialId => $composableBuilder(
    column: $table.officialId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get markerHits => $composableBuilder(
    column: $table.markerHits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get signature =>
      $composableBuilder(column: $table.signature, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FinishEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FinishEventsTable,
          FinishEvent,
          $$FinishEventsTableFilterComposer,
          $$FinishEventsTableOrderingComposer,
          $$FinishEventsTableAnnotationComposer,
          $$FinishEventsTableCreateCompanionBuilder,
          $$FinishEventsTableUpdateCompanionBuilder,
          (FinishEvent, $$FinishEventsTableReferences),
          FinishEvent,
          PrefetchHooks Function({bool eventId})
        > {
  $$FinishEventsTableTableManager(_$AppDatabase db, $FinishEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FinishEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$FinishEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$FinishEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<int> testNumber = const Value.absent(),
                Value<int?> carNumber = const Value.absent(),
                Value<int?> runNumber = const Value.absent(),
                Value<String?> officialId = const Value.absent(),
                Value<int> timestamp = const Value.absent(),
                Value<int> markerHits = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> signature = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> syncedAt = const Value.absent(),
              }) => FinishEventsCompanion(
                id: id,
                eventId: eventId,
                testNumber: testNumber,
                carNumber: carNumber,
                runNumber: runNumber,
                officialId: officialId,
                timestamp: timestamp,
                markerHits: markerHits,
                status: status,
                signature: signature,
                createdAt: createdAt,
                syncedAt: syncedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String eventId,
                required int testNumber,
                Value<int?> carNumber = const Value.absent(),
                Value<int?> runNumber = const Value.absent(),
                Value<String?> officialId = const Value.absent(),
                required int timestamp,
                Value<int> markerHits = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> signature = const Value.absent(),
                required int createdAt,
                Value<int?> syncedAt = const Value.absent(),
              }) => FinishEventsCompanion.insert(
                id: id,
                eventId: eventId,
                testNumber: testNumber,
                carNumber: carNumber,
                runNumber: runNumber,
                officialId: officialId,
                timestamp: timestamp,
                markerHits: markerHits,
                status: status,
                signature: signature,
                createdAt: createdAt,
                syncedAt: syncedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$FinishEventsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (eventId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.eventId,
                            referencedTable: $$FinishEventsTableReferences
                                ._eventIdTable(db),
                            referencedColumn:
                                $$FinishEventsTableReferences
                                    ._eventIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FinishEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FinishEventsTable,
      FinishEvent,
      $$FinishEventsTableFilterComposer,
      $$FinishEventsTableOrderingComposer,
      $$FinishEventsTableAnnotationComposer,
      $$FinishEventsTableCreateCompanionBuilder,
      $$FinishEventsTableUpdateCompanionBuilder,
      (FinishEvent, $$FinishEventsTableReferences),
      FinishEvent,
      PrefetchHooks Function({bool eventId})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String eventId,
      required String name,
      Value<int> sortOrder,
      Value<int> isOutright,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> eventId,
      Value<String> name,
      Value<int> sortOrder,
      Value<int> isOutright,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.categories.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EntryCategoriesTable, List<EntryCategory>>
  _entryCategoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.entryCategories,
    aliasName: $_aliasNameGenerator(
      db.categories.id,
      db.entryCategories.categoryId,
    ),
  );

  $$EntryCategoriesTableProcessedTableManager get entryCategoriesRefs {
    final manager = $$EntryCategoriesTableTableManager(
      $_db,
      $_db.entryCategories,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _entryCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isOutright => $composableBuilder(
    column: $table.isOutright,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> entryCategoriesRefs(
    Expression<bool> Function($$EntryCategoriesTableFilterComposer f) f,
  ) {
    final $$EntryCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entryCategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntryCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.entryCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isOutright => $composableBuilder(
    column: $table.isOutright,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get isOutright => $composableBuilder(
    column: $table.isOutright,
    builder: (column) => column,
  );

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> entryCategoriesRefs<T extends Object>(
    Expression<T> Function($$EntryCategoriesTableAnnotationComposer a) f,
  ) {
    final $$EntryCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.entryCategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntryCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entryCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool eventId, bool entryCategoriesRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> isOutright = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                eventId: eventId,
                name: name,
                sortOrder: sortOrder,
                isOutright: isOutright,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String eventId,
                required String name,
                Value<int> sortOrder = const Value.absent(),
                Value<int> isOutright = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                eventId: eventId,
                name: name,
                sortOrder: sortOrder,
                isOutright: isOutright,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CategoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            eventId = false,
            entryCategoriesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (entryCategoriesRefs) db.entryCategories,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (eventId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.eventId,
                            referencedTable: $$CategoriesTableReferences
                                ._eventIdTable(db),
                            referencedColumn:
                                $$CategoriesTableReferences
                                    ._eventIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (entryCategoriesRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      EntryCategory
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._entryCategoriesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).entryCategoriesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool eventId, bool entryCategoriesRefs})
    >;
typedef $$EntryCategoriesTableCreateCompanionBuilder =
    EntryCategoriesCompanion Function({
      required int entryId,
      required int categoryId,
      Value<int> rowid,
    });
typedef $$EntryCategoriesTableUpdateCompanionBuilder =
    EntryCategoriesCompanion Function({
      Value<int> entryId,
      Value<int> categoryId,
      Value<int> rowid,
    });

final class $$EntryCategoriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $EntryCategoriesTable, EntryCategory> {
  $$EntryCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EntriesTable _entryIdTable(_$AppDatabase db) =>
      db.entries.createAlias(
        $_aliasNameGenerator(db.entryCategories.entryId, db.entries.id),
      );

  $$EntriesTableProcessedTableManager get entryId {
    final $_column = $_itemColumn<int>('entry_id')!;

    final manager = $$EntriesTableTableManager(
      $_db,
      $_db.entries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.entryCategories.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EntryCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $EntryCategoriesTable> {
  $$EntryCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EntriesTableFilterComposer get entryId {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableFilterComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EntryCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $EntryCategoriesTable> {
  $$EntryCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EntriesTableOrderingComposer get entryId {
    final $$EntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableOrderingComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EntryCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntryCategoriesTable> {
  $$EntryCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EntriesTableAnnotationComposer get entryId {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.entries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.entries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EntryCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EntryCategoriesTable,
          EntryCategory,
          $$EntryCategoriesTableFilterComposer,
          $$EntryCategoriesTableOrderingComposer,
          $$EntryCategoriesTableAnnotationComposer,
          $$EntryCategoriesTableCreateCompanionBuilder,
          $$EntryCategoriesTableUpdateCompanionBuilder,
          (EntryCategory, $$EntryCategoriesTableReferences),
          EntryCategory,
          PrefetchHooks Function({bool entryId, bool categoryId})
        > {
  $$EntryCategoriesTableTableManager(
    _$AppDatabase db,
    $EntryCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$EntryCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EntryCategoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$EntryCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> entryId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EntryCategoriesCompanion(
                entryId: entryId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int entryId,
                required int categoryId,
                Value<int> rowid = const Value.absent(),
              }) => EntryCategoriesCompanion.insert(
                entryId: entryId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EntryCategoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({entryId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (entryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.entryId,
                            referencedTable: $$EntryCategoriesTableReferences
                                ._entryIdTable(db),
                            referencedColumn:
                                $$EntryCategoriesTableReferences
                                    ._entryIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (categoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$EntryCategoriesTableReferences
                                ._categoryIdTable(db),
                            referencedColumn:
                                $$EntryCategoriesTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EntryCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EntryCategoriesTable,
      EntryCategory,
      $$EntryCategoriesTableFilterComposer,
      $$EntryCategoriesTableOrderingComposer,
      $$EntryCategoriesTableAnnotationComposer,
      $$EntryCategoriesTableCreateCompanionBuilder,
      $$EntryCategoriesTableUpdateCompanionBuilder,
      (EntryCategory, $$EntryCategoriesTableReferences),
      EntryCategory,
      PrefetchHooks Function({bool entryId, bool categoryId})
    >;
typedef $$OfficialsTableCreateCompanionBuilder =
    OfficialsCompanion Function({
      Value<int> id,
      required String did,
      Value<String?> name,
      Value<String> role,
      required String publicKey,
      Value<int> isAuthorized,
      required int createdAt,
    });
typedef $$OfficialsTableUpdateCompanionBuilder =
    OfficialsCompanion Function({
      Value<int> id,
      Value<String> did,
      Value<String?> name,
      Value<String> role,
      Value<String> publicKey,
      Value<int> isAuthorized,
      Value<int> createdAt,
    });

class $$OfficialsTableFilterComposer
    extends Composer<_$AppDatabase, $OfficialsTable> {
  $$OfficialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get did => $composableBuilder(
    column: $table.did,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isAuthorized => $composableBuilder(
    column: $table.isAuthorized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OfficialsTableOrderingComposer
    extends Composer<_$AppDatabase, $OfficialsTable> {
  $$OfficialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get did => $composableBuilder(
    column: $table.did,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicKey => $composableBuilder(
    column: $table.publicKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isAuthorized => $composableBuilder(
    column: $table.isAuthorized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OfficialsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfficialsTable> {
  $$OfficialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get did =>
      $composableBuilder(column: $table.did, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get publicKey =>
      $composableBuilder(column: $table.publicKey, builder: (column) => column);

  GeneratedColumn<int> get isAuthorized => $composableBuilder(
    column: $table.isAuthorized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OfficialsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OfficialsTable,
          Official,
          $$OfficialsTableFilterComposer,
          $$OfficialsTableOrderingComposer,
          $$OfficialsTableAnnotationComposer,
          $$OfficialsTableCreateCompanionBuilder,
          $$OfficialsTableUpdateCompanionBuilder,
          (Official, BaseReferences<_$AppDatabase, $OfficialsTable, Official>),
          Official,
          PrefetchHooks Function()
        > {
  $$OfficialsTableTableManager(_$AppDatabase db, $OfficialsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$OfficialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$OfficialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$OfficialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> did = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> publicKey = const Value.absent(),
                Value<int> isAuthorized = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => OfficialsCompanion(
                id: id,
                did: did,
                name: name,
                role: role,
                publicKey: publicKey,
                isAuthorized: isAuthorized,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String did,
                Value<String?> name = const Value.absent(),
                Value<String> role = const Value.absent(),
                required String publicKey,
                Value<int> isAuthorized = const Value.absent(),
                required int createdAt,
              }) => OfficialsCompanion.insert(
                id: id,
                did: did,
                name: name,
                role: role,
                publicKey: publicKey,
                isAuthorized: isAuthorized,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OfficialsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OfficialsTable,
      Official,
      $$OfficialsTableFilterComposer,
      $$OfficialsTableOrderingComposer,
      $$OfficialsTableAnnotationComposer,
      $$OfficialsTableCreateCompanionBuilder,
      $$OfficialsTableUpdateCompanionBuilder,
      (Official, BaseReferences<_$AppDatabase, $OfficialsTable, Official>),
      Official,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$TestsTableTableManager get tests =>
      $$TestsTableTableManager(_db, _db.tests);
  $$EntriesTableTableManager get entries =>
      $$EntriesTableTableManager(_db, _db.entries);
  $$StartEventsTableTableManager get startEvents =>
      $$StartEventsTableTableManager(_db, _db.startEvents);
  $$FinishEventsTableTableManager get finishEvents =>
      $$FinishEventsTableTableManager(_db, _db.finishEvents);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$EntryCategoriesTableTableManager get entryCategories =>
      $$EntryCategoriesTableTableManager(_db, _db.entryCategories);
  $$OfficialsTableTableManager get officials =>
      $$OfficialsTableTableManager(_db, _db.officials);
}
