import 'package:qfinity/export.dart';

mixin BasicListingFiltersMixin on BaseController, FromToDateMixin {
  List<VoucherModel> dropdownVouchers = [
    VoucherModel.allItem(),
  ];

  VoucherModel selectedVoucher = VoucherModel.allItem();

  void selectedVoucherChanged(VoucherModel? value) {
    selectedVoucher = value!;
    update();
  }

  void onSearchPressed();

  void onResetPressed();

  void resetBasicListingFilters() {
    selectedVoucher = VoucherModel.allItem();
  }
}
