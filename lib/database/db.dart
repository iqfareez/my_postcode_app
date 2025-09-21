import 'app_database.dart';
import 'shared.dart';

/// Access a singleton instance of the app database
/// Always use this class than directly referencing to [AppDatabase]
/// Example:
/// ```dart
/// final db = DB.instance.database;
/// db.getSurahTranslations();
/// ```
///
class DB {
  static final DB _db = DB._internal();
  DB._internal();
  static DB get instance => _db;
  static AppDatabase? _database;

  void init() {
    _database = constructDb();
  }

  AppDatabase get database {
    if (_database == null) {
      throw "Database is not init. Please call DB.instance.init() before calling getting database";
    }

    return _database!;
  }
}
