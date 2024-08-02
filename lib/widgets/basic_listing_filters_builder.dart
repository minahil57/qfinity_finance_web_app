import 'package:qfinity/export.dart';

class BasicListingFiltersBuilder<T extends BasicListingFiltersMixin> extends StatelessWidget {
  const BasicListingFiltersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return Padding(
          padding: MySpacing.x(flexSpacing),
          child: MyFlex(
            runSpacing: 0,
            children: [
              MyFlexItem(
                sizes: 'lg-3 md-6 sm-12',
                child: Column(
                  children: [
                    LabeledDatePicker(
                      label: 'From',
                      onTap: controller.pickFromDate,
                      selectedDate: controller.selectedFromDate,
                    ),
                    MySpacing.height(3),
                  ],
                ),
              ),
              MyFlexItem(
                sizes: 'lg-3 md-6 sm-12',
                child: Column(
                  children: [
                    LabeledDatePicker(
                      label: 'To',
                      onTap: controller.pickToDate,
                      selectedDate: controller.selectedToDate,
                    ),
                    MySpacing.height(3),
                  ],
                ),
              ),
              MyFlexItem(
                sizes: 'lg-3 md-6 sm-12',
                child: Column(
                  children: [
                    LabeledSearchableDropdown(
                      label: 'Voucher No',
                      items: controller.dropdownVouchers,
                      onSelected: controller.selectedVoucherChanged,
                      selectedItem: controller.selectedVoucher,
                    ),
                    MySpacing.height(3),
                  ],
                ),
              ),
              MyFlexItem(
                sizes: 'lg-3 md-6 sm-12',
                child: Column(
                  children: [
                    FilterActionButton(
                      text: 'Search',
                      onPressed: controller.onSearchPressed,
                      iconData: FontAwesomeIcons.lightCircleCheck,
                      backgroundColor: UIConstants.contentTheme.primary,
                    ),
                    FilterActionButton(
                      text: 'Reset',
                      onPressed: controller.onResetPressed,
                      iconData: FontAwesomeIcons.lightArrowsRotate,
                      backgroundColor: UIConstants.contentTheme.danger,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
