import 'package:flutter/material.dart';

import 'model/postcode_model.dart';
import 'my_table_data.dart';

class DatatableView extends StatefulWidget {
  const DatatableView(this.postcodeDatas, {Key? key}) : super(key: key);
  final List<PostcodeModel> postcodeDatas;

  @override
  _DatatableViewState createState() => _DatatableViewState();
}

class _DatatableViewState extends State<DatatableView> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 16,
      columns: const [
        DataColumn(label: Text("No.")),
        DataColumn(
          label: Text("Location"),
        ),
        DataColumn(label: Text("Post Office")),
        DataColumn(
          label: Text("Postcode"),
          numeric: true,
        ),
        DataColumn(label: Text("State")),
        DataColumn(label: Text("Action")),
      ],
      source: MyTableData(widget.postcodeDatas),
    );
  }
}
