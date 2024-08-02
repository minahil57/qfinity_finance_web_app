import 'package:qfinity/export.dart';

class TaxCodeBuilder<T extends TaxCodeMixin> extends StatelessWidget {
  const TaxCodeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return Column(
          children: [
            LabeledSearchableDropdown(
              label: 'Tax Code',
              items: controller.taxes,
              onSelected: controller.onSelectedTax,
              selectedItem: controller.selectedTax,
            ),
            MySpacing.height(UIConstants.formInputFieldSpacing),
            Row(
              children: [
                LabeledCheckBox(
                  isChecked: controller.isTaxInclusive,
                  label: 'Tax Inclusive',
                  onChanged: controller.toggleTaxInclusiveCheckBox,
                ),
                MySpacing.width(10),
                TextButton(
                  onPressed: controller.onApplyToRowsPressed,
                  child: const Text('Apply to Rows'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
