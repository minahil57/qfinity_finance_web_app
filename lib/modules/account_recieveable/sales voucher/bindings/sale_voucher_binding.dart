import 'package:qfinity/modules/account_recieveable/sales%20voucher/sale_voucher_controller.dart';

import '../../../../export.dart';

class SaleVoucherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SaleVoucherController());
  }
}
