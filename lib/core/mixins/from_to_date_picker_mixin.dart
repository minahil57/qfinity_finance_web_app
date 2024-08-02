import 'package:qfinity/export.dart';

mixin FromToDateMixin on BaseController {
  // (Get.arguments as DateTime) is comming from the dashboard voucher count
  // section
  DateTime selectedFromDate = Get.arguments != null ? Get.arguments as DateTime : DateTimeHelper.last30Days;
  DateTime selectedToDate = DateTime.now();

  Future<void> pickFromDate() async {
    final DateTime? picked = await DateTimeHelper.pickDate(
      initialDate: selectedFromDate,
    );

    if (picked != null && picked != selectedFromDate) {
      selectedFromDate = picked;
      update();
    }
  }

  Future<void> pickToDate() async {
    final DateTime? picked = await DateTimeHelper.pickDate(
      initialDate: selectedToDate,
    );

    if (picked != null && picked != selectedToDate) {
      selectedToDate = picked;
      update();
    }
  }

  void resetFromToDates() {
    selectedFromDate = DateTimeHelper.last30Days;
    selectedToDate = DateTime.now();
  }
}
