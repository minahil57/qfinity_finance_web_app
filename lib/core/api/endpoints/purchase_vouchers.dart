part of 'endpoints.dart';

class _PurchaseVouchers {
  final String _apiBaseUrl;

  factory _PurchaseVouchers({required String apiBaseUrl}) {
    _instance ??= _PurchaseVouchers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _PurchaseVouchers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _PurchaseVouchers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/PurchaseVouchers';

  String get getPurchaseVouchers => '$_controllerName/listing';

  String getPurchaseDropDownsData({
    required String financialYear,
  }) {
    return '$_controllerName/GetPurchaseDropDownsData?financialYear=$financialYear';
  }

  String getPurchaseVouchersSupplierDetails({
    required String supplierId,
    required String financialYear,
  }) {
    return '$_controllerName/GetSupplierDetails'
        '?supplierId=$supplierId&financialYear=$financialYear';
  }

  String get createPurchaseVoucher => '$_controllerName/CreatePurchaseVoucher';

  String get updatePurchaseVoucher => '$_controllerName/UpdatePurchaseVoucher';

  String printPurchaseVoucher({required int reportType}) {
    return '$_controllerName/PrintPurchaseVoucher/$reportType';
  }

  String getPurchaseVoucherDetails({required String voucherNo}) {
    return '$_controllerName/getvoucherdetails/$voucherNo';
  }
}
