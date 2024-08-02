part of 'endpoints.dart';

class _GeneralFinance {
  final String _apiBaseUrl;

  factory _GeneralFinance({required String apiBaseUrl}) {
    _instance ??= _GeneralFinance._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _GeneralFinance._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _GeneralFinance? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/GeneralFinance';

  String get getCostCenter1 => '$_controllerName/GetCostCenter1';

  String getCostCenter2({required String costCenter1}) {
    return '$_controllerName/GetCostCenter2?cc1=$costCenter1';
  }

  String getCostCenter3({
    required String costCenter1,
    required String costCenter2,
  }) {
    return '$_controllerName/GetCostCenter3?cc1=$costCenter1&cc2=$costCenter2';
  }

  String getCostCenter4({
    required String costCenter1,
    required String costCenter2,
    required String costCenter3,
  }) {
    return '$_controllerName/GetCostCenter4?cc1=$costCenter1&cc2=$costCenter2&cc3=$costCenter3';
  }

  String get getPostingAttachments => '$_controllerName/GetPostingAttachments';

  String get getAccountBalance => '$_controllerName/GetAccountBalance';

  String get getDashboard => '$_controllerName/getdashboard';

  String get getFinanceSettings => '$_controllerName/getfinancesettings';
}
