import 'package:qfinity/export.dart';

class AdditionalAmountBuilder<T extends AdditionalAmountMixin> extends StatelessWidget {
  const AdditionalAmountBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return Column(
          children: [
            LabeledTextField(
              label: 'Amount',
              hintText: '0.00',
              textController: controller.additionalAmountTextEditingController,
              keyboardType: TextInputType.number,
              inputFormatters: InputFormatters.positiveNumberWithTwoDigitsDicimalPoint,
              onChanged: controller.onAdditionalAmountChanged,
            ),
            MySpacing.height(UIConstants.formInputFieldSpacing),
            LabeledSearchableDropdown(
              label: 'Account',
              items: controller.allAccounts,
              onSelected: controller.onAdditionalAccountSelected,
              selectedItem: controller.selectedAdditionalAccount,
            ),
          ],
        );
      },
    );
  }
}
