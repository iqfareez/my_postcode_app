import 'package:drift/drift.dart';

import 'tables/postcode_items.dart';
import 'tables/state_items.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  PostcodeItems,
  StateItems,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.queryExecutor);

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
    return (select(postcodeItems)
          ..where((t) => t.code.equals(int.parse(searchQuery))))
        .get();
  }
}
