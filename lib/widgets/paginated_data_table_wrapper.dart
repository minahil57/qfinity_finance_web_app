import 'package:qfinity/export.dart';

class PaginatedDataTableWrapper extends StatelessWidget {
  PaginatedDataTableWrapper({
    super.key,
    required this.data,
    required this.columnsNames,
    this.header,
    this.actions,
  });

  final DataTableSource data;
  final List<String> columnsNames;
  final String? header;
  final List<Widget>? actions;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySpacing.x(flexSpacing),
      child: Scrollbar(
        controller: scrollController,
        interactive: true,
        thumbVisibility: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: PaginatedDataTable(
            controller: scrollController,
            header: header != null ? Text(header!) : null,
            actions: actions,
            source: data,
            columns: columnsNames.map((e) => DataColumn(label: TextDataColumn(e))).toList(),
            arrowHeadColor: UIConstants.contentTheme.primary,
            horizontalMargin: 20,
            columnSpacing: 100,
            headingRowColor: WidgetStateProperty.all(
              MainAppTheme.primaryColor.withOpacity(.8),
            ),
            rowsPerPage: data.rowCount > 10
                ? 10
                : data.rowCount != 0
                    ? data.rowCount
                    : 1,
            headingRowHeight: 35,
            dataRowMaxHeight: 35,
            dataRowMinHeight: 35,
            showEmptyRows: false,
          ),
        ),
      ),
    );
  }
}
