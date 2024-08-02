part of 'endpoints.dart';

class _TrialBalance {
  final String _apiBaseUrl;

  factory _TrialBalance({required String apiBaseUrl}) {
    _instance ??= _TrialBalance._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _TrialBalance._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _TrialBalance? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/TrialBalance';

  String getTrialBalanceFilterData({
    required String financialYear,
  }) {
    return '$_controllerName/GetTransactionFilterData?financialYear=$financialYear';
  }

  String printTrialBalance({required int reportType}) {
    return '$_controllerName/PrintTrialbalance/$reportType';
  }
}
