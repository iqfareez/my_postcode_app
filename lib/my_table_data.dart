import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_postcode_app/model/postcode_model.dart';

class MyTableData extends DataTableSource {
  late final List<PostcodeModel> _postcodeData;

  MyTableData(this._postcodeData);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(
          (index + 1).toString(),
        ),
      ),
      DataCell(
        Text(_postcodeData[index].location),
      ),
      DataCell(
        Text(_postcodeData[index].postOffice),
      ),
      DataCell(
        Text(
          _postcodeData[index].postcode.toString(),
        ),
      ),
      DataCell(
        Text(
          _postcodeData[index].state,
        ),
      ),
      DataCell(
        Row(
          children: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(
                    text:
                        "${_postcodeData[index].location}, ${_postcodeData[index].postOffice}, ${_postcodeData[index].postcode}, ${_postcodeData[index].state}"));
              },
              child: const Text("Copy"),
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _postcodeData.length;

  @override
  int get selectedRowCount => 0;
}
