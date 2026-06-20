import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'app_database.dart';

AppDatabase constructDb() {
  final db = LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (!await file.exists()) {
      log('Database does not exist yet, creating default from asset',
          name: 'DatabaseProvider');
      // Database does not exist yet, use default from asset
      final content = await rootBundle.load('assets/Malaysia_Postcode.sqlite');

      await file.parent.create(recursive: true);
      await file.writeAsBytes(content.buffer.asUint8List(0));
    }

    return NativeDatabase.createInBackground(file);
  });
  return AppDatabase(db);
}
