import 'package:qfinity/export.dart';

class PettyCashVoucherDataTable extends StatelessWidget {
  const PettyCashVoucherDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PettyCashVoucherController>(
      builder: (controller) {
        return PaginatedDataTableWrapper(
          data: controller.data,
          columnsNames: controller.columns,
          header: 'Listing',
          actions: [
            TableActionButton(
              text: 'Add',
              backgroundColor: UIConstants.contentTheme.primary,
              onPressed: () {
                Get.toNamed(Routes.createPettyCashVoucher);
              },
            ),
          ],
        );
      },
    );
  }
}
