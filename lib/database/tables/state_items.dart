import 'package:drift/drift.dart';

class StateItems extends Table {
  TextColumn get code => text().named('state_code')();
  TextColumn get name => text().named('state_name')();

  @override
  String get tableName => 'states';
}
