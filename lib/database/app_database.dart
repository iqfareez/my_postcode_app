import 'package:drift/drift.dart';

import 'tables/postcode_items.dart';
import 'tables/state_items.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  PostcodeItems,
  StateItems,
])
class AppDatabase extends _$AppDatabase {
  // https://drift.simonbinder.eu/platforms/web/#manual-code-sharing-between-native-apps-and-web
  // ignore: use_super_parameters
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  /// Get all states from the database
  Future<List<StateItem>> get allStateItems => select(stateItems).get();

  /// Get all postcodes for a specific state
  Future<List<PostcodeItem>> getPostcodesByState(String stateCode) {
    return (select(postcodeItems)..where((t) => t.stateCode.equals(stateCode)))
        .get();
  }

  /// Search postcodes by postcode number
  Future<List<PostcodeItem>> searchPostcode(String searchQuery) {
    return (select(postcodeItems)..where((t) => t.code.like('$searchQuery%')))
        .get();
  }
}
