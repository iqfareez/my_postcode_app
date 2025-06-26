import 'package:flutter/material.dart';

import 'database/db.dart';
import 'views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DB.instance.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malaysia Postcode Finder',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 240, 17, 17)),
        fontFamily: 'Roboto',
      ),
      home: Home(),
    );
  }
}
