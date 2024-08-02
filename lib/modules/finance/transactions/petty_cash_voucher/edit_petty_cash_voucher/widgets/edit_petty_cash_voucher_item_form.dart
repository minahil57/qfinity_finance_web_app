import 'package:qfinity/export.dart';

class EditPettyCashVoucherItemForm extends StatefulWidget {
  const EditPettyCashVoucherItemForm({super.key});

  @override
  State<EditPettyCashVoucherItemForm> createState() => _EditPettyCashVoucherItemFormState();
}

class _EditPettyCashVoucherItemFormState extends State<EditPettyCashVoucherItemForm> {
  @override
  void initState() {
    super.initState();
    Get
      ..delete<EditPettyCashVoucherItemFormController>()
      ..put(EditPettyCashVoucherItemFormController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPettyCashVoucherItemFormController>(
      builder: (controller) {
        return Form(
          key: controller.basicValidator.formKey,
          autovalidateMode: controller.autovalidateMode,
          child: Column(
            children: [
              LabeledSearchableDropdown(
                label: 'Account Code',
                items: controller.accounts,
                onSelected: controller.onAccountSelected,
                selectedItem: controller.selectedAccount,
                useIdForValue: true,
                validator: (value) {
                  if (value == null) {
                    return 'Please select account code';
                  }
                  return null;
                },
                hintText: 'Select Account Code',
              ),
              SizedBox(height: UIConstants.formInputFieldSpacing),
              LabeledSearchableDropdown(
                label: 'Account Name',
                items: controller.accounts,
                onSelected: controller.onAccountSelected,
                selectedItem: controller.selectedAccount,
                validator: (value) {
                  if (value == null) {
                    return 'Please select account name';
                  }
                  return null;
                },
                hintText: 'Select Account Name',
              ),
              SizedBox(height: UIConstants.formInputFieldSpacing),
              LabeledTextField(
                label: 'Debit',
                hintText: '0.0',
                textController: controller.basicValidator.getController('debit')!,
                validator: controller.basicValidator.getValidation('debit'),
                keyboardType: TextInputType.number,
                inputFormatters: InputFormatters.positiveNumberWithTwoDigitsDicimalPoint,
                focusNode: controller.creditFocusNode,
              ),
              SizedBox(height: UIConstants.formInputFieldSpacing),
              LabeledSearchableDropdown(
                label: 'Tax',
                items: controller.taxes,
                onSelected: controller.onTaxSelected,
                selectedItem: controller.selectedTax,
              ),
              SizedBox(height: UIConstants.formInputFieldSpacing),
              LabeledTextField(
                label: 'VAT',
                hintText: '0.0',
                textController: controller.basicValidator.getController('vat')!,
                keyboardType: TextInputType.number,
                inputFormatters: InputFormatters.positiveNumberWithTwoDigitsDicimalPoint,
                onChanged: controller.onVatChanged,
              ),
              SizedBox(height: UIConstants.formInputFieldSpacing),
              LabeledTextValueInContainer(
                label: 'Total',
                text: controller.total == 0 ? '0.0' : controller.total.toStringAsFixed(2),
                containerColor: theme.cardTheme.color,
                textColor:
                    controller.total == 0 ? theme.colorScheme.onSurface.withAlpha(160) : theme.colorScheme.onSurface,
              ),
              SizedBox(height: UIConstants.formInputFieldSpacing),
              LabeledTextField(
                label: 'Narration',
                hintText: 'Enter Narration...',
                textController: controller.basicValidator.getController('narration')!,
                maxLines: 4,
              ),
              if (controller.showCostCenters) ...[
                SizedBox(height: UIConstants.formInputFieldSpacing),
                const CostCentersBuilder<EditPettyCashVoucherItemFormController>(
                  hideCopyCostCenters: true,
                ),
              ],
              SizedBox(height: flexSpacing),
              if (controller.editPettyCashVoucherController.toBeEditedItem != null)
                UpdateCancelButtons(
                  onUpdatePressed: controller.addOrUpdatePettyCashVoucherItem,
                  onCancelPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              else
                AddCancelButtons(
                  onAddPressed: controller.addOrUpdatePettyCashVoucherItem,
                  onCancelPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
