part of 'endpoints.dart';

class _BillwisePayments {
  final String _apiBaseUrl;

  factory _BillwisePayments({required String apiBaseUrl}) {
    _instance ??= _BillwisePayments._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _BillwisePayments._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _BillwisePayments? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/BillwisePayments';

  String get getBillwisePayments => '$_controllerName/GetBillwiseListing';

  String get createBillwisePayment => '$_controllerName/Create';

  String get updateBillwisePayment => '$_controllerName/Update';

  String getBillwisePaymentsDropDownsData({
    required String financialYear,
  }) {
    return '$_controllerName/GetBillwiseDropDownsData?financialYear=$financialYear';
  }

  String getBillwisePaymentsSupplierDetails({
    required String supplierId,
  }) {
    return '$_controllerName/GetSupplierDetails/$supplierId';
  }

  String getBillwisePaymentsInvoiceDetails({
    required String supplierId,
  }) {
    return '$_controllerName/GetInvoiceDetails/$supplierId';
  }

  String getBillwisePaymentsCreditAccounts({
    required String financialYear,
    required bool isAll,
  }) {
    return '$_controllerName/GetCreditAccounts?financialYear=$financialYear&isAll=$isAll';
  }

  String printBillwisePaymentVoucher({required int reportType}) {
    return '$_controllerName/PrintBillwiseVoucher/$reportType';
  }

  String getBillwisePaymentDetails({
    required String voucherNo,
  }) {
    return '$_controllerName/GetBillwiseDetails/$voucherNo';
  }
}
