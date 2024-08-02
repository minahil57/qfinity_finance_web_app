part of 'endpoints.dart';

class _GeneralLedgers {
  final String _apiBaseUrl;

  factory _GeneralLedgers({required String apiBaseUrl}) {
    _instance ??= _GeneralLedgers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _GeneralLedgers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _GeneralLedgers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/GeneralLedgers';

  String getGeneralLedgersFilterData({
    required String financialYear,
  }) {
    return '$_controllerName/GetTransactionFilterData?financialYear=$financialYear';
  }

  String printGeneralLedger({required int reportType}) {
    return '$_controllerName/PrintGeneralLedger/$reportType';
  }
}
