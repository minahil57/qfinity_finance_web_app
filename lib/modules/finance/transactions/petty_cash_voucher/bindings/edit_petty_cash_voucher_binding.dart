import 'package:qfinity/export.dart';

class EditPettyCashVoucherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditPettyCashVoucherController());
  }
}
