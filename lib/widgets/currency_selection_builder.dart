import 'package:qfinity/export.dart';

class CurrencySelectionBuilder<T extends CurrencySelectionMixin> extends StatelessWidget {
  const CurrencySelectionBuilder({
    super.key,
    required this.amountLabel,
    this.disabled = false,
  });

  final String amountLabel;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return Column(
          children: [
            LabeledSearchableDropdown(
              label: 'Currency',
              items: controller.currencies,
              onSelected: controller.onSelectedCurrency,
              selectedItem: controller.selectedCurrency,
              useIdForValue: true,
              disabled: disabled,
            ),
            MySpacing.height(UIConstants.formInputFieldSpacing),
            LabeledTextField(
              label: 'Con Rate',
              hintText: '1.0000',
              textController: controller.conRateTextEditingController,
              keyboardType: TextInputType.number,
              inputFormatters: InputFormatters.positiveNumberWithFourDigitsDicimalPoint,
              onChanged: controller.onConversionRateChanged,
              readOnly: disabled,
            ),
            MySpacing.height(UIConstants.formInputFieldSpacing),
            LabeledTextField(
              label: 'FX Amount',
              hintText: '0.00',
              textController: controller.fxAmountTextEditingController,
              keyboardType: TextInputType.number,
              inputFormatters: InputFormatters.positiveNumberWithTwoDigitsDicimalPoint,
              onChanged: controller.onFxAmoutChanged,
              readOnly: disabled,
            ),
            MySpacing.height(UIConstants.formInputFieldSpacing),
            LabeledTextField(
              label: amountLabel,
              hintText: '0.00',
              textController: controller.amountTextEditingController,
              keyboardType: TextInputType.number,
              inputFormatters: InputFormatters.positiveNumberWithTwoDigitsDicimalPoint,
              onChanged: controller.onAmountChanged,
              readOnly: disabled,
            ),
          ],
        );
      },
    );
  }
}
