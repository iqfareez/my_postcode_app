import 'package:drift/drift.dart';

class PostcodeItems extends Table {
  TextColumn get code => text().named('postcode')();
  TextColumn get areaName => text().named('area_name')();
  TextColumn get postOffice => text().named('post_office')();
  TextColumn get stateCode => text().named('state_code')();

  @override
  String get tableName => 'postcodes';
}
