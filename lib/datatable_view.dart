import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/postcode_model.dart';

class DatatableView extends StatefulWidget {
  const DatatableView(this.postcodeDatas, {Key? key}) : super(key: key);
  final List<PostcodeModel> postcodeDatas;

  @override
  _DatatableViewState createState() => _DatatableViewState();
}

class _DatatableViewState extends State<DatatableView> {
  bool _sortAsc = true;
  bool _sortLocationAsc = true;
  // bool _sortPostOfficeAsc = true;
  bool _sortPostcodeAsc = true;
  // bool _sortStateAsc = true;
  int? _sortColumnIndex;
  late List<PostcodeModel> _datas;

  @override
  void initState() {
    super.initState();
    _datas = List.from(widget.postcodeDatas);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAsc,
      columns: [
        const DataColumn(label: Text("No.")),
        DataColumn(
          label: const Text("Location"),
          onSort: (columnIndex, ascending) {
            setState(() {
              if (columnIndex == _sortColumnIndex) {
                _sortAsc = _sortLocationAsc = ascending;
              } else {
                _sortColumnIndex = columnIndex;
                _sortAsc = _sortLocationAsc;
              }
              _datas.sort((a, b) => a.location.compareTo(b.location));
              if (!ascending) {
                _datas = _datas.reversed.toList();
              }
            });
          },
        ),
        const DataColumn(label: Text("Post Office")),
        DataColumn(
          label: const Text("Postcode"),
          numeric: true,
          onSort: (columnIndex, ascending) {
            setState(() {
              if (columnIndex == _sortColumnIndex) {
                _sortAsc = _sortPostcodeAsc = ascending;
              } else {
                _sortColumnIndex = columnIndex;
                _sortAsc = _sortPostcodeAsc;
              }
              _datas.sort((a, b) => a.postcode.compareTo(b.postcode));
              if (!ascending) {
                _datas = _datas.reversed.toList();
              }
            });
          },
        ),
        const DataColumn(label: Text("State")),
        const DataColumn(label: Text("Action")),
      ],
      rows: List.generate(_datas.length, (index) {
        var postcodeData = _datas[index];
        return DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              // All rows will have the same selected color.
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
              }
              // Even rows will have a grey color.
              if (index.isEven) {
                return Colors.grey.withOpacity(0.3);
              }
              return null; // Use default value for other states and odd rows.
            }),
            cells: [
              DataCell(
                Text(
                  (index + 1).toString(),
                ),
              ),
              DataCell(
                Text(postcodeData.location),
              ),
              DataCell(
                Text(postcodeData.postOffice),
              ),
              DataCell(
                Text(
                  postcodeData.postcode.toString(),
                ),
              ),
              DataCell(
                Text(
                  postcodeData.state,
                ),
              ),
              DataCell(Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text:
                                "${postcodeData.location}, ${postcodeData.postOffice}, ${postcodeData.postcode}, ${postcodeData.state}"));
                      },
                      child: const Text("Copy")),
                ],
              ))
            ]);
      }),
    );
  }
}
