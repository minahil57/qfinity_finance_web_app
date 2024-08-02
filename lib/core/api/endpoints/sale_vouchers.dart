part of 'endpoints.dart';

class _SaleVouchers {
  final String _apiBaseUrl;

  factory _SaleVouchers({required String apiBaseUrl}) {
    _instance ??= _SaleVouchers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _SaleVouchers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _SaleVouchers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/SaleVouchers';

  String get getSaleVouchers => '$_controllerName/listing';

  String getSaleDropDownsData({
    required String financialYear,
  }) {
    return '$_controllerName/GetSaleDropDownsData?financialYear=$financialYear';
  }

  String getSaleVouchersCustomerDetails({
    required String customerId,
    required String financialYear,
  }) {
    return '$_controllerName/GetCustomerDetails'
        '?customerId=$customerId&financialYear=$financialYear';
  }

  String get createSaleVoucher => '$_controllerName/CreateSaleVoucher';

  String get updateSaleVoucher => '$_controllerName/updatesalevoucher';

  String printSaleVoucher({required int reportType}) {
    return '$_controllerName/PrintSaleVoucher/$reportType';
  }

  String getSaleVoucherDetails({required String voucherNo}) {
    return '$_controllerName/getvoucherdetails/$voucherNo';
  }
}
