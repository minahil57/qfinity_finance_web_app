import 'package:qfinity/export.dart';

class EditPettyCashVoucherPage extends StatelessWidget {
  const EditPettyCashVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: Column(
          children: [
            const InnerPageHeader(
              title: 'Update Petty Cash Voucher',
            ),
            MySpacing.height(flexSpacing),
            const EditPettyCashVoucherTransactionDetails(),
            MySpacing.height(flexSpacing),
            const AttachmentBuilder<EditPettyCashVoucherController>(),
            MySpacing.height(flexSpacing),
            const SaveEditPettyCashVoucher(),
          ],
        ),
      ),
    );
  }
}
