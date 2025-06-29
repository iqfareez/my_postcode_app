import 'package:drift/drift.dart';

class PostcodeItems extends Table {
  IntColumn get code => integer().named('postcode')();
  TextColumn get areaName => text().named('area_name')();
  TextColumn get postOffice => text().named('post_office')();
  TextColumn get stateCode => text().named('state_code')();

  @override
  String get tableName => 'postcodes';
}
