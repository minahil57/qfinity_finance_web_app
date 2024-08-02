import 'package:qfinity/export.dart';

class EditPettyCashVoucherItems extends StatelessWidget {
  const EditPettyCashVoucherItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPettyCashVoucherController>(
      builder: (controller) {
        return DataTableWrapper(
          columnsNames: controller.voucherItemColumns,
          rows: controller.voucherItemRows,
        );
      },
    );
  }
}
