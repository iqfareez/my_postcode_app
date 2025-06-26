import 'package:flutter/material.dart';

import '../database/app_database.dart';
import '../database/db.dart';

class StatePostcodePage extends StatefulWidget {
  const StatePostcodePage({super.key, required this.stateItem});

  final StateItem stateItem;

  @override
  State<StatePostcodePage> createState() => _StatePostcodePageState();
}

class _StatePostcodePageState extends State<StatePostcodePage> {
  late Future<List<PostcodeItem>> _postcodesFuture;

  @override
  void initState() {
    super.initState();
    final db = DB.instance.database;
    _postcodesFuture = db.getPostcodesByState(widget.stateItem.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.stateItem.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: FutureBuilder<List<PostcodeItem>>(
        future: _postcodesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No postcodes found.'));
          }

          final postcodes = snapshot.data!;

          // Group postcodes by code
          final Map<int, List<PostcodeItem>> groupedPostcodes = {};
          for (final postcode in postcodes) {
            if (!groupedPostcodes.containsKey(postcode.code)) {
              groupedPostcodes[postcode.code] = [];
            }
            groupedPostcodes[postcode.code]!.add(postcode);
          }

          final sortedKeys = groupedPostcodes.keys.toList()..sort();

          return ListView.builder(
            itemCount: sortedKeys.length,
            itemBuilder: (context, index) {
              final postcodeCode = sortedKeys[index];
              final areas = groupedPostcodes[postcodeCode]!;

              return ExpansionTile(
                title: Text(
                  postcodeCode.toString().padLeft(5, '0'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  areas.length == 1
                      ? areas.first.areaName
                      : '${areas.first.areaName}, and ${areas.length - 1} others',
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                children: areas
                    .map((area) => ListTile(
                          title: Text(
                            area.areaName,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 32.0, right: 16.0),
                        ))
                    .toList(),
              );
            },
          );
        },
      ),
    );
  }
}
