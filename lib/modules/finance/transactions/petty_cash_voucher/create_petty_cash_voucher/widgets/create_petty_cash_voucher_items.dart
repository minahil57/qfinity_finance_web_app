import 'package:qfinity/export.dart';

class CreatePettyCashVoucherItems extends StatelessWidget {
  const CreatePettyCashVoucherItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePettyCashVoucherController>(
      builder: (controller) {
        return DataTableWrapper(
          columnsNames: controller.voucherItemColumns,
          rows: controller.voucherItemRows,
        );
      },
    );
  }
}
