import 'package:qfinity/export.dart';

mixin NarrationMixin<T extends BaseVoucherItemModel> on BaseVoucherController<T> {
  final narrationTextEditingController = TextEditingController();
  final narrationFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    narrationFocusNode.addListener(_narrationFocusListener);
  }

  void onNarrationChanged(String value) {
    narrationTextEditingController.text = value;
    buildVoucherItemTableRows();
  }

  void resetNarration() {
    narrationTextEditingController.clear();
  }

  void _narrationFocusListener() {
    if (!narrationFocusNode.hasFocus) {
      for (final item in voucherItems) {
        if (item.narration == null || item.narration == '') {
          item.narration = narrationTextEditingController.text;
        }
      }
    }
  }

  void disposeNarrationMixinResources() {
    narrationTextEditingController.dispose();
    narrationFocusNode.dispose();
  }
}
