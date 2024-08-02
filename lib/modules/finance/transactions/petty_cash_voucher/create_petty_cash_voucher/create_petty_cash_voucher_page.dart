import 'package:qfinity/export.dart';

class CreatePettyCashVoucherPage extends StatelessWidget {
  const CreatePettyCashVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: Column(
          children: [
            const InnerPageHeader(
              title: 'Create Petty Cash Voucher',
            ),
            MySpacing.height(flexSpacing),
            const CreatePettyCashVoucherTransactionDetails(),
            MySpacing.height(flexSpacing),
            const AttachmentBuilder<CreatePettyCashVoucherController>(),
            MySpacing.height(flexSpacing),
            const SaveCreatePettyCashVoucher(),
          ],
        ),
      ),
    );
  }
}
