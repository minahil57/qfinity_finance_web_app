import 'package:qfinity/export.dart';

mixin CostCentersMixin on BaseController {
  List<DropdownItemModel> costCenter1 = [
    const DropdownItemModel(id: '', name: 'None'),
  ];

  List<DropdownItemModel> costCenter2 = [
    const DropdownItemModel(id: '', name: 'None'),
  ];

  List<DropdownItemModel> costCenter3 = [
    const DropdownItemModel(id: '', name: 'None'),
  ];

  List<DropdownItemModel> costCenter4 = [
    const DropdownItemModel(id: '', name: 'None'),
  ];

  DropdownItemModel selectedCostCenter1 = const DropdownItemModel(id: '', name: 'None');

  DropdownItemModel selectedCostCenter2 = const DropdownItemModel(id: '', name: 'None');

  DropdownItemModel selectedCostCenter3 = const DropdownItemModel(id: '', name: 'None');

  DropdownItemModel selectedCostCenter4 = const DropdownItemModel(id: '', name: 'None');

  bool copyCostCenters = false;
  String cc1Label = 'Cost Center 1';
  String cc2Label = 'Cost Center 2';
  String cc3Label = 'Cost Center 3';
  String cc4Label = 'Cost Center 4';

  Future<void> onSelectedCostCenter1(DropdownItemModel? value) async {
    selectedCostCenter1 = value!;
    selectedCostCenter2 = const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter3 = const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter4 = const DropdownItemModel(id: '', name: 'None');
    await _getCostCenter2ByCost1(selectedCostCenter1.id);
    // await _getCostCenter3ByCost1AndCost2(
    //   selectedCostCenter1.id,
    //   selectedCostCenter2.id,
    // );
    // await _getCostCenter4ByCost1AndCost2AndCost3(
    //   selectedCostCenter1.id,
    //   selectedCostCenter2.id,
    //   selectedCostCenter3.id,
    // );

    update();
  }

  Future<void> onSelectedCostCenter2(DropdownItemModel? value) async {
    selectedCostCenter2 = value!;
    selectedCostCenter3 = const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter4 = const DropdownItemModel(id: '', name: 'None');
    // await _getCostCenter3ByCost1AndCost2(
    //   selectedCostCenter1.id,
    //   selectedCostCenter2.id,
    // );
    // await _getCostCenter4ByCost1AndCost2AndCost3(
    //   selectedCostCenter1.id,
    //   selectedCostCenter2.id,
    //   selectedCostCenter3.id,
    // );
    update();
  }

  Future<void> onSelectedCostCenter3(DropdownItemModel? value) async {
    selectedCostCenter3 = value!;
    selectedCostCenter4 = const DropdownItemModel(id: '', name: 'None');
    // await _getCostCenter4ByCost1AndCost2AndCost3(
    //   selectedCostCenter1.id,
    //   selectedCostCenter2.id,
    //   selectedCostCenter3.id,
    // );
    update();
  }

  void onSelectedCostCenter4(DropdownItemModel? value) {
    selectedCostCenter4 = value!;
    update();
  }

  void resetCostCenters() {
    selectedCostCenter1 = const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter2 = const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter3 = const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter4 = const DropdownItemModel(id: '', name: 'None');
    copyCostCenters = false;
  }

  void toggleCopyCostCentersCheckBox(bool? value) {
    copyCostCenters = value ?? false;
    update();
  }

  Future<void> _getCostCenter2ByCost1(String costCenter1) async {
    try {
      var response = await ApiProvider.generalFinance.getCostCenter2(costCenter1: costCenter1);

      if (response.statusCode == 200) {
        costCenter2 = response.data['data'].map<DropdownItemModel>((e) => DropdownItemModel.fromJson(e)).toList();
        costCenter2.insert(0, const DropdownItemModel(id: '', name: 'None'));
      } else {
        Snackbars.somethingWentWrong();
      }
    } on DioException catch (e) {
      AppLogger.e(e);
      if (e.message == 'Expired Session') {
        EasyLoading.dismiss();
      } else {
        if (e.response?.statusCode == 400) {
          Snackbars.error(e.response!.data['data']);
        } else {
          Snackbars.somethingWentWrong();
        }
      }
    } on Exception catch (e) {
      AppLogger.e(e);
      Snackbars.somethingWentWrong();
    }
  }

// Future<void> _getCostCenter3ByCost1AndCost2(
//   String costCenter1,
//   String costCenter2,
// ) async {
//   try {
//     var response = await ApiProvider.generalFinance.getCostCenter3(
//       costCenter1,
//       costCenter2,
//     );
//
//     if (response.statusCode == 200) {
//       costCenter3 = response.data['data']
//           .map<DropdownItemModel>((e) => DropdownItemModel.fromJson(e))
//           .toList();
//       costCenter3.insert(0, DropdownItemModel(id: '', name: 'None'));
//     } else {
//       Snackbars.somethingWentWrong();
//     }
//   } on DioException catch (e) {
//     AppLogger.e(e);
//     if (e.message == 'Expired Session') {
//       EasyLoading.dismiss();
//     } else {
//       if (e.response?.statusCode == 400) {
//         Snackbars.error(e.response!.data['data']);
//       } else {
//         Snackbars.somethingWentWrong();
//       }
//     }
//   } on Exception catch (e) {
//     AppLogger.e(e);
//     Snackbars.somethingWentWrong();
//   }
// }
//
// Future<void> _getCostCenter4ByCost1AndCost2AndCost3(
//   String costCenter1,
//   String costCenter2,
//   String costCenter3,
// ) async {
//   try {
//     var response = await ApiProvider.generalFinance.getCostCenter4(
//       costCenter1: costCenter1,
//       costCenter2: costCenter2,
//       costCenter3: costCenter3,
//     );
//
//     if (response.statusCode == 200) {
//       costCenter4 = response.data['data']
//           .map<DropdownItemModel>((e) => DropdownItemModel.fromJson(e))
//           .toList();
//       costCenter4.insert(0, DropdownItemModel(id: '', name: 'None'));
//     } else {
//       Snackbars.somethingWentWrong();
//     }
//   } on DioException catch (e) {
//     AppLogger.e(e);
//     if (e.message == 'Expired Session') {
//       EasyLoading.dismiss();
//     } else {
//       if (e.response?.statusCode == 400) {
//         Snackbars.error(e.response!.data['data']);
//       } else {
//         Snackbars.somethingWentWrong();
//       }
//     }
//   } on Exception catch (e) {
//     AppLogger.e(e);
//     Snackbars.somethingWentWrong();
//   }
// }
}
