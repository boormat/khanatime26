import 'package:drift/drift.dart';

class Officials extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get did => text()();
  TextColumn get name => text().nullable()();
  TextColumn get role => text().withDefault(const Constant('official'))();
  TextColumn get publicKey => text()();
  IntColumn get isAuthorized => integer().withDefault(const Constant(1))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [{did}];
}
