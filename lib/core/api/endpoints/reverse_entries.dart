part of 'endpoints.dart';

class _ReverseEntries {
  final String _apiBaseUrl;

  factory _ReverseEntries({required String apiBaseUrl}) {
    _instance ??= _ReverseEntries._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _ReverseEntries._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _ReverseEntries? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/ReverseEntries';

  String get searchReverseEntries => '$_controllerName/search';

  String get getReverseEntriesVouchers => '$_controllerName/get-vouchers';

  String get createReverseEntry => _controllerName;

  String get checkReverseVoucher => '$_controllerName/check-reverse-voucher';

  String get checkReceiptMade => '$_controllerName/check-receipt-made';

  String get checkPaymentMade => '$_controllerName/check-payment-made';

  String getReverseEntriesDropDownsData({
    required String financialYear,
  }) {
    return '$_controllerName/dropdowns?financialYear=$financialYear';
  }

  String printReverseEntries({required int reportType}) {
    return '$_controllerName/print/$reportType';
  }
}
