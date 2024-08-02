part of 'endpoints.dart';

class _TransactionListing {
  final String _apiBaseUrl;

  factory _TransactionListing({required String apiBaseUrl}) {
    _instance ??= _TransactionListing._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _TransactionListing._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _TransactionListing? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/TransactionListingAndApprovals';

  String getTransactionFilterData({
    required String financialYear,
  }) {
    return '$_controllerName/GetTransactionFilterData?financialYear=$financialYear';
  }

  String get getTransactions => '$_controllerName/GetTransactions';

  String get approveTransactionItems => '$_controllerName/ApproveTransactionItems';

  String printTransactions({required int reportType}) {
    return '$_controllerName/PrintTransactions/$reportType';
  }

  String printLeaseReceiptVoucher({required int reportType}) {
    return '$_controllerName/PrintLeaseReceiptVoucher/$reportType';
  }

  String get getTransactionListingAndApprovalsPostingAttachments => '$_controllerName/GetPostingAttachments';
}
