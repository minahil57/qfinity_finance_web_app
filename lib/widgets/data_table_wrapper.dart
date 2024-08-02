import 'package:qfinity/export.dart';

class DataTableWrapper extends StatelessWidget {
  const DataTableWrapper({
    super.key,
    required this.rows,
    required this.columnsNames,
  });

  final List<DataRow> rows;
  final List<String> columnsNames;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(MainAppTheme.primaryColor.withOpacity(.8)),
        headingRowHeight: 25,
        dataRowMaxHeight: 25,
        dataRowMinHeight: 25,
        border: TableBorder.all(
          color: const Color.fromARGB(255, 211, 211, 211),
        ),
        columns: columnsNames.map((e) => DataColumn(label: TextDataColumn(e))).toList(),
        rows: rows,
      ),
    );
  }
}
