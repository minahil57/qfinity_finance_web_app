import 'package:qfinity/export.dart';

class CostCentersWidget extends StatelessWidget {
  const CostCentersWidget({
    super.key,
    required this.costCenter1,
    required this.costCenter2,
    required this.costCenter3,
    required this.costCenter4,
    required this.onSelectedCostCenter1,
    required this.onSelectedCostCenter2,
    required this.onSelectedCostCenter3,
    required this.onSelectedCostCenter4,
    required this.selectedCostCenter1,
    required this.selectedCostCenter2,
    required this.selectedCostCenter3,
    required this.selectedCostCenter4,
    required this.isCopyCostCenters,
    required this.toggleCopyCostCentersCheckBox,
    required this.hideCopyCostCenters,
    required this.cc1Label,
    required this.cc2Label,
    required this.cc3Label,
    required this.cc4Label,
  });

  final List<DropdownItemModel> costCenter1;
  final List<DropdownItemModel> costCenter2;
  final List<DropdownItemModel> costCenter3;
  final List<DropdownItemModel> costCenter4;
  final void Function(DropdownItemModel?)? onSelectedCostCenter1;
  final void Function(DropdownItemModel?)? onSelectedCostCenter2;
  final void Function(DropdownItemModel?)? onSelectedCostCenter3;
  final void Function(DropdownItemModel?)? onSelectedCostCenter4;
  final DropdownItemModel selectedCostCenter1;
  final DropdownItemModel selectedCostCenter2;
  final DropdownItemModel selectedCostCenter3;
  final DropdownItemModel selectedCostCenter4;
  final bool isCopyCostCenters;
  final void Function(bool?) toggleCopyCostCentersCheckBox;
  final bool hideCopyCostCenters;
  final String cc1Label;
  final String cc2Label;
  final String cc3Label;
  final String cc4Label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledSearchableDropdown(
          label: cc1Label,
          items: costCenter1,
          onSelected: onSelectedCostCenter1,
          selectedItem: selectedCostCenter1,
        ),
        MySpacing.height(UIConstants.formInputFieldSpacing),
        LabeledSearchableDropdown(
          label: cc2Label,
          items: costCenter2,
          onSelected: onSelectedCostCenter2,
          selectedItem: selectedCostCenter2,
        ),
        MySpacing.height(UIConstants.formInputFieldSpacing),
        LabeledSearchableDropdown(
          label: cc3Label,
          items: costCenter3,
          onSelected: onSelectedCostCenter3,
          selectedItem: selectedCostCenter3,
        ),
        MySpacing.height(UIConstants.formInputFieldSpacing),
        LabeledSearchableDropdown(
          label: cc4Label,
          items: costCenter4,
          onSelected: onSelectedCostCenter4,
          selectedItem: selectedCostCenter4,
        ),
        if (!hideCopyCostCenters) ...[
          MySpacing.height(UIConstants.formInputFieldSpacing),
          LabeledCheckBox(
            isChecked: isCopyCostCenters,
            label: 'Copy Cost Centers',
            onChanged: toggleCopyCostCentersCheckBox,
          ),
        ],
      ],
    );
  }
}
