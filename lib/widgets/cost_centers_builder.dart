import 'package:qfinity/export.dart';

class CostCentersBuilder<T extends CostCentersMixin> extends StatelessWidget {
  const CostCentersBuilder({
    super.key,
    this.hideCopyCostCenters = false,
  });

  final bool hideCopyCostCenters;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return CostCentersWidget(
          costCenter1: controller.costCenter1,
          costCenter2: controller.costCenter2,
          costCenter3: controller.costCenter3,
          costCenter4: controller.costCenter4,
          onSelectedCostCenter1: controller.onSelectedCostCenter1,
          onSelectedCostCenter2: controller.onSelectedCostCenter2,
          onSelectedCostCenter3: controller.onSelectedCostCenter3,
          onSelectedCostCenter4: controller.onSelectedCostCenter4,
          selectedCostCenter1: controller.selectedCostCenter1,
          selectedCostCenter2: controller.selectedCostCenter2,
          selectedCostCenter3: controller.selectedCostCenter3,
          selectedCostCenter4: controller.selectedCostCenter4,
          isCopyCostCenters: controller.copyCostCenters,
          toggleCopyCostCentersCheckBox: controller.toggleCopyCostCentersCheckBox,
          hideCopyCostCenters: hideCopyCostCenters,
          cc1Label: controller.cc1Label,
          cc2Label: controller.cc2Label,
          cc3Label: controller.cc3Label,
          cc4Label: controller.cc4Label,
        );
      },
    );
  }
}
