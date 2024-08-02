import 'package:qfinity/export.dart';

class SaveEditPettyCashVoucher extends StatelessWidget {
  const SaveEditPettyCashVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: MySpacing.xy(flexSpacing, 16),
      shadow: MyShadow(elevation: 0.5),
      child: SaveCancelButtons(
        onSavePressed: () {
          Get.find<EditPettyCashVoucherController>().saveVoucher();
        },
        onCancelPressed: () {
          Get.back();
        },
      ),
    );
  }
}
