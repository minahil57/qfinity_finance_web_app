import 'package:qfinity/export.dart';

class SFDataTableWrapper extends StatelessWidget {
  SFDataTableWrapper({
    super.key,
    required this.data,
    required this.columnsNames,
    required this.dataGridController,
    required this.isRowSelected,
    required this.onSelectionChanged,
    this.header,
    this.actions,
  });

  final DataGridSource data;
  final List<String> columnsNames;
  final String? header;
  final List<Widget>? actions;
  final ScrollController scrollController = ScrollController();

  final DataGridController dataGridController;
  final RxBool isRowSelected;
  final void Function(List<DataGridRow>, List<DataGridRow>)? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    const double rowHeight = 35;
    final double maxHeight = (data.rows.length + 1) < 16 ? (data.rows.length + 1) * rowHeight + 8 : 16 * rowHeight + 8;

    const double minColumnWidth = 150;
    bool isTotalWidthExceeds = false;

    return Padding(
      padding: MySpacing.x(flexSpacing),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (columnsNames.length * minColumnWidth > constraints.maxWidth) {
            isTotalWidthExceeds = true;
          }
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight,
              maxWidth: constraints.maxWidth,
            ),
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                headerHoverColor: Colors.white.withOpacity(0.2),
                headerColor: MainAppTheme.primaryColor.withOpacity(.8),
                sortIconColor: Colors.blueGrey.shade900,
                filterIconColor: Colors.blueGrey.shade900,
                rowHoverColor: MainAppTheme.primaryColor.withOpacity(.3),
                gridLineColor: Colors.blueGrey.shade900,
                gridLineStrokeWidth: 0.5,
                selectionColor: MainAppTheme.primaryColor.withOpacity(.6),
                rowHoverTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.26),
                    ),
                  ),
                  child: SfDataGrid(
                    isScrollbarAlwaysShown: true,
                    controller: dataGridController,
                    selectionMode: SelectionMode.singleDeselect,
                    rowHeight: rowHeight,
                    headerRowHeight: rowHeight,
                    footerHeight: rowHeight,
                    allowSorting: true,
                    allowFiltering: true,
                    source: data,
                    columns: columnsNames.map((e) {
                      return GridColumn(
                        columnName: e,
                        columnWidthMode: isTotalWidthExceeds ? ColumnWidthMode.auto : ColumnWidthMode.fill,
                        maximumWidth: e == 'ID' ? 90 : double.nan,
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8),
                          child: TextDataColumn(e),
                        ),
                      );
                    }).toList(),
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    onSelectionChanged: onSelectionChanged,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
