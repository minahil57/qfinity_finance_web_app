part of 'endpoints.dart';

class _RecurringVouchers {
  final String _apiBaseUrl;

  factory _RecurringVouchers({required String apiBaseUrl}) {
    _instance ??= _RecurringVouchers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _RecurringVouchers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _RecurringVouchers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/RecurringVouchers';

  String get listing => '$_controllerName/listing';

  String print({required int reportType}) {
    return '$_controllerName/print/$reportType';
  }

  String dropdowns({
    required String financialYear,
  }) {
    return '$_controllerName/dropdowns?financialYear=$financialYear';
  }

  String details({
    required String voucherNo,
  }) {
    return '$_controllerName/$voucherNo';
  }

  String get create => _controllerName;

  String get update => _controllerName;
}
