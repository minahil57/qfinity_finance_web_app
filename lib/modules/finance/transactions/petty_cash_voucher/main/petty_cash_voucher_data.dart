import 'package:qfinity/export.dart';

class PettyCashVoucherData extends DataTableSource {
  List<PettyCashVoucherModel> data = [];

  PettyCashVoucherData(this.data);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    final PettyCashVoucherModel item = data[index];

    return DataRow(
      color: WidgetStateProperty.all(
        index.isEven ? UIConstants.contentTheme.background : UIConstants.tableYellowColor,
      ),
      cells: [
        DataCell(
          CommonCheckBox(
            isChecked: item.isApproved!,
            onChanged: (value) {},
            isIdle: true,
          ),
        ),
        ...[
          item.voucherNo ?? '',
          item.postingType ?? '',
          if (item.postingDate != null) DateTimeHelper.dateFormatter.format(item.postingDate!) else '',
          item.accountCode ?? '',
          item.accountName ?? '',
          item.refNo ?? '',
          if (item.amountCredit != null) Formatter.formatToMoney(item.amountCredit!) else '',
          if (item.amountDebit != null) Formatter.formatToMoney(item.amountDebit!) else '',
          if (item.transactionMethod != null && item.transactionMethod != '0') item.transactionMethod! else '',
          if (item.transactionDate != null) DateTimeHelper.dateFormatter.format(item.transactionDate!) else '',
          item.createdBy ?? '',
          if (item.createdOn != null) DateTimeHelper.dateFormatter.format(item.createdOn!) else '',
          item.costCenter1!.cc,
          item.costCenter2!.cc,
          item.costCenter3!.cc,
          item.costCenter4!.cc,
        ].map(
          (e) => DataCell(
            TextDataCell(e),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (item.isApproved == false) ...[
                IconButton(
                  icon: const Icon(Icons.edit),
                  color: theme.primaryColor,
                  onPressed: () {
                    Get.find<PettyCashVoucherController>().onEditItemIconPressed(item);
                  },
                ),
                SizedBox(width: flexSpacing * 0.3),
              ],
              IconButton(
                icon: const Icon(Icons.print),
                color: UIConstants.contentTheme.secondary,
                onPressed: () {
                  Get.find<PettyCashVoucherController>().onPrintItemIconPressed(item);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
