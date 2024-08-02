import 'package:qfinity/export.dart';

abstract class BaseVoucherController<T extends BaseVoucherItemModel> extends BaseController {
  List<T> voucherItems = [];

  List<String> get voucherItemColumns;

  List<DataRow> voucherItemRows = [];

  void buildVoucherItemTableRows();

  void onAddNewRowPressed();

  Future<void> saveVoucher();

  bool getValidations();

  Map<String, dynamic> buildVoucherData();

  List<T> buildVoucherItemsBeforeSend();
}
