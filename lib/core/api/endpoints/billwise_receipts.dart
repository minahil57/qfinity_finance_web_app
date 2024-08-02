part of 'endpoints.dart';

class _BillwiseReceipts {
  final String _apiBaseUrl;

  factory _BillwiseReceipts({required String apiBaseUrl}) {
    _instance ??= _BillwiseReceipts._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _BillwiseReceipts._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _BillwiseReceipts? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/BillwiseReceipts';

  String get getBillwiseReceipts => '$_controllerName/GetBillwiseListing';

  String get createBillwiseReceipt => '$_controllerName/Create';

  String get updateBillwiseReceipt => '$_controllerName/Update';

  String getBillwiseReceiptsDropDownsData({
    required String financialYear,
  }) {
    return '$_controllerName/GetBillwiseDropDownsData?financialYear=$financialYear';
  }

  String getBillwiseReceiptsCustomerDetails({
    required String customerId,
  }) {
    return '$_controllerName/GetCustomerDetails/$customerId';
  }

  String getBillwiseReceiptsDebitAccounts({
    required String financialYear,
    required bool isAll,
  }) {
    return '$_controllerName/GetDebitAccounts?financialYear=$financialYear&isAll=$isAll';
  }

  String getBillwiseReceiptsInvoiceDetails({
    required String accountCode,
  }) {
    return '$_controllerName/GetInvoiceDetails/$accountCode';
  }

  String printBillwiseReceiptVoucher({required int reportType}) {
    return '$_controllerName/PrintBillwiseReceipt/$reportType';
  }

  String printBillwiseCustomerReceipt({required int reportType}) {
    return '$_controllerName/PrintCustomerReceipt/$reportType';
  }

  String getBillwiseReceiptDetails({
    required String voucherNo,
  }) {
    return '$_controllerName/GetBillwiseDetails/$voucherNo';
  }
}
