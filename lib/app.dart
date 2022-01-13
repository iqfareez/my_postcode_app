import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_postcode_app/datatable_view.dart';
import 'package:my_postcode_app/model/postcode_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Postcode Malaysia"),
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
                SizedBox(
                  width: 130,
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
                    setState(() {
                      print(_selectedState);
                      print(_postcodeInputController.text);
                    });
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
                      return const Text("One moment please...");
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
    );
  }
}
