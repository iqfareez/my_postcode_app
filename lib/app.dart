import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'datatable_view.dart';
import 'model/postcode_model.dart';
import 'utils/link_launcher.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final TextEditingController _postcodeInputController =
      TextEditingController();
  String? _selectedState;
  final List<String> _states = [
    "Johor",
    "Kedah",
    "Kelantan",
    "Melaka",
    "Negeri_Sembilan",
    "Pahang",
    "Perak",
    "Perlis",
    "Pulau_Pinang",
    "Sabah",
    "Sarawak",
    "Selangor",
    "Terengganu",
    "WP_Kuala_Lumpur",
    "WP_Labuan",
    "WP_Putrajaya",
  ];
  Future<List<PostcodeModel>>? loadDataFromAssets(
      String state, String postcode) async {
    // read csv from assets
    var csvString =
        await rootBundle.loadString("assets/postcode/postcode_${state}_my.csv");
    var csvList = const CsvToListConverter().convert(csvString);
    csvList.removeAt(0); // remove csv header

    var list = <PostcodeModel>[];
    for (var item in csvList) {
      list.add(PostcodeModel.fromList(item));
    }

    // search for certain postcode
    // remove the unrelated
    if (postcode.length == 5) {
      list.removeWhere((element) => element.postcode != int.parse(postcode));
    }

    return list;
  }

  void handleMoreMenu(String value) {
    switch (value) {
      case 'Open on web':
        LinkLauncher.open("https://my-postcode.web.app/");
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Postcode Malaysia"),
          actions: [
            PopupMenuButton(
              onSelected: handleMoreMenu,
              itemBuilder: (context) {
                return {'Open on web'}
                    .map(
                      (e) => PopupMenuItem(child: Text(e), value: e),
                    )
                    .toList();
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Flexible(
                    child: TextField(
                      controller: _postcodeInputController,
                      maxLength: 5,
                      decoration: const InputDecoration(
                        hintText: "Postcode",
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 2,
                    child: DropdownButton<String>(
                      value: _selectedState,
                      hint: const Text("Select state"),
                      items: _states
                          .map((e) => DropdownMenuItem(
                              value: e, child: Text(e.replaceAll('_', ' '))))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedState = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                      child: ElevatedButton(
                    child: const Text("Go"),
                    onPressed: () {
                      setState(() {});
                    },
                  ))
                ],
              ),
            )),
            Expanded(
              flex: 4,
              child: Builder(builder: (_) {
                if (_selectedState != null) {
                  return FutureBuilder<List<PostcodeModel>>(
                    future: loadDataFromAssets(
                        _selectedState!, _postcodeInputController.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: const [
                            Text("One moment please..."),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            )
                          ],
                        );
                      }

                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      return SingleChildScrollView(
                          child: DatatableView(snapshot.data!));
                    },
                  );
                } else {
                  return const Text("Select state to begin");
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
