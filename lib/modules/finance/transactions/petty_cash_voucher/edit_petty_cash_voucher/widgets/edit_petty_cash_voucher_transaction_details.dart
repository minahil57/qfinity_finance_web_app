import 'package:qfinity/export.dart';

class EditPettyCashVoucherTransactionDetails extends StatelessWidget {
  const EditPettyCashVoucherTransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPettyCashVoucherController>(
      builder: (controller) {
        return MyCard(
          paddingAll: flexSpacing,
          shadow: MyShadow(elevation: 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText.titleMedium(
                'Transaction Details',
                fontSize: 16,
                fontWeight: 20,
              ),
              MySpacing.height(flexSpacing * 1.5),
              MyFlex(
                contentPadding: false,
                children: [
                  MyFlexItem(
                    sizes: 'lg-3 md-6 sm-12',
                    child: Column(
                      children: [
                        LabeledTextField(
                          label: 'Voucher No',
                          hintText: 'Enter Cheque No',
                          textController: controller.voucherNoTextEditingController,
                          readOnly: true,
                        ),
                        MySpacing.height(UIConstants.formInputFieldSpacing),
                        LabeledDatePicker(
                          label: 'Voucher Date',
                          onTap: controller.pickVoucherDate,
                          selectedDate: controller.voucherDate,
                        ),
                        MySpacing.height(UIConstants.formInputFieldSpacing),
                        LabeledSearchableDropdown(
                          label: 'Account (Cr)',
                          items: controller.cashAccounts,
                          onSelected: controller.onSelectedAccount,
                          selectedItem: controller.selectedAccount,
                        ),
                        MySpacing.height(UIConstants.formInputFieldSpacing),
                        LabeledTextValueInContainer(
                          label: 'Balance',
                          text: Formatter.formatToMoney(controller.balance),
                          textColor: Colors.red,
                          labelColor: Colors.black,
                          isMuted: false,
                          fontWeight: FontWeight.bold,
                        ),
                        MySpacing.height(UIConstants.formInputFieldSpacing * 2),
                        const NarrationBuilder<EditPettyCashVoucherController>(),
                      ],
                    ),
                  ),
                  MyFlexItem(
                    sizes: 'lg-3 md-6 sm-12',
                    child: Column(
                      children: [
                        const CurrencySelectionBuilder<EditPettyCashVoucherController>(
                          amountLabel: 'Base Amount (Cr)',
                        ),
                        MySpacing.height(UIConstants.formInputFieldSpacing),
                        const TaxCodeBuilder<EditPettyCashVoucherController>(),
                      ],
                    ),
                  ),
                  MyFlexItem(
                    sizes: 'lg-3 md-6 sm-12',
                    child: Column(
                      children: [
                        LabeledTextField(
                          label: 'Invoice No',
                          hintText: 'Enter Invoice No',
                          textController: controller.invoiceNoTextEditingController,
                        ),
                        MySpacing.height(UIConstants.formInputFieldSpacing),
                        LabeledTextField(
                          label: 'Paid To',
                          hintText: 'Enter Paid To',
                          textController: controller.paidToTextEditingController,
                        ),
                        MySpacing.height(UIConstants.formInputFieldSpacing),
                        LabeledTextField(
                          label: 'Ref No',
                          hintText: 'Enter Ref No',
                          textController: controller.refNoTextEditingController,
                        ),
                      ],
                    ),
                  ),
                  const MyFlexItem(
                    sizes: 'lg-3 md-6 sm-12',
                    child: CostCentersBuilder<EditPettyCashVoucherController>(),
                  ),
                ],
              ),
              MySpacing.height(flexSpacing * 1.5),
              AddNewRowButton(
                onPressed: controller.onAddNewRowPressed,
              ),
              MySpacing.height(flexSpacing * .25),
              const EditPettyCashVoucherItems(),
            ],
          ),
        );
      },
    );
  }
}
