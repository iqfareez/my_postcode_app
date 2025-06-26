import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'app_database.dart';

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
    _database = AppDatabase(openConnection());
  }

  AppDatabase get database {
    if (_database == null) {
      throw "Database is not init. Please call DB.instance.init() before calling getting database";
    }

    return _database!;
  }

  LazyDatabase openConnection() {
    // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      if (!await file.exists()) {
        log('Database does not exist yet, creating default from asset',
            name: 'DatabaseProvider');
        // Database does not exist yet, use default from asset
        final content =
            await rootBundle.load('assets/Malaysia_Postcode.sqlite');

        await file.parent.create(recursive: true);
        await file.writeAsBytes(content.buffer.asUint8List(0));
      }

      // Also work around limitations on old Android versions
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      // Make sqlite3 pick a more suitable location for temporary files - the
      // one from the system may be inaccessible due to sandboxing.
      final cachebase = (await getTemporaryDirectory()).path;
      // We can't access /tmp on Android, which sqlite3 would try by default.
      // Explicitly tell it about the correct temporary directory.
      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    });
  }
}
