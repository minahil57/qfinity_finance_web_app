import 'package:qfinity/export.dart';

class CreatePettyCashVoucherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CreatePettyCashVoucherController());
  }
}
