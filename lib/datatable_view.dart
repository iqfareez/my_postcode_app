import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_postcode_app/my_table_data.dart';

import 'model/postcode_model.dart';

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
