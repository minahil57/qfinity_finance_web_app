import 'package:qfinity/export.dart';

class SaveCreatePettyCashVoucher extends StatelessWidget {
  const SaveCreatePettyCashVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: MySpacing.xy(flexSpacing, 16),
      shadow: MyShadow(elevation: 0.5),
      child: SaveCancelButtons(
        onSavePressed: () {
          Get.find<CreatePettyCashVoucherController>().saveVoucher();
        },
        onCancelPressed: () {
          Get.back();
        },
      ),
    );
  }
}
