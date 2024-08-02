import 'package:qfinity/export.dart';

class PettyCashVoucherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PettyCashVoucherController());
  }
}
