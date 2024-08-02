import 'package:qfinity/export.dart';

mixin AdditionalAmountMixin on BaseController {
  List<DropdownItemModel> allAccounts = [];
  final additionalAmountTextEditingController = TextEditingController(text: '0.00');

  DropdownItemModel? selectedAdditionalAccount;

  void onAdditionalAccountSelected(DropdownItemModel? value) {
    selectedAdditionalAccount = value;
    update();
  }

  void resetAdditionalAmount() {
    additionalAmountTextEditingController.clear();
    selectedAdditionalAccount = null;
  }

  bool isAdditionalAmountRequired() {
    return selectedAdditionalAccount != null &&
        (additionalAmountTextEditingController.text.isEmpty ||
            (double.tryParse(additionalAmountTextEditingController.text) ?? 0) == 0);
  }

  bool isAdditionalAccountRequired() {
    return (double.tryParse(additionalAmountTextEditingController.text) ?? 0) != 0 && selectedAdditionalAccount == null;
  }

  void onAdditionalAmountChanged(String value) {
    if (value.isEmpty || (double.tryParse(value) ?? 0) == 0) {
      selectedAdditionalAccount = null;
    }
  }

  void disposeAdditionalAmountMixinResources() {
    additionalAmountTextEditingController.dispose();
  }
}
