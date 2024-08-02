part of 'endpoints.dart';

class _PaymentVouchers {
  final String _apiBaseUrl;

  factory _PaymentVouchers({required String apiBaseUrl}) {
    _instance ??= _PaymentVouchers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _PaymentVouchers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _PaymentVouchers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/PaymentVouchers';

  String getPaymentVoucherDropdownsData({
    required String financialYear,
  }) {
    return '$_controllerName/GetPaymentDropDownsData?financialYear=$financialYear';
  }

  String get getPaymentVouchers => '$_controllerName/GetPaymentVouchers';

  String get getPaymentVoucherDetails => '$_controllerName/GetPaymentVoucherDetails';

  String get createPaymentVoucher => '$_controllerName/CreatePaymentVoucher';

  String get updatePaymentVoucher => '$_controllerName/UpdatePaymentVoucher';

  String printPaymentVoucher({required int reportType}) {
    return '$_controllerName/PrintPaymentVoucher/$reportType';
  }

  String getPaymentVoucherCreditAccounts({
    required bool fetchAll,
  }) {
    return '$_controllerName/GetCreditAccounts/$fetchAll';
  }
}
