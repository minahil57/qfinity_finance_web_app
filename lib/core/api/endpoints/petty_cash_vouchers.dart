part of 'endpoints.dart';

class _PettyCashVouchers {
  final String _apiBaseUrl;

  factory _PettyCashVouchers({required String apiBaseUrl}) {
    _instance ??= _PettyCashVouchers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _PettyCashVouchers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _PettyCashVouchers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/PettyCashVouchers';

  String get getPettyCashVouchers => '$_controllerName/listing';

  String getPettyCashDropDownsData({
    required String financialYear,
  }) =>
      '$_controllerName/dropdowns?financialYear=$financialYear';

  String printPettyCashVoucher({required int reportType}) {
    return '$_controllerName/print/$reportType';
  }

  String get createPettyCashVoucher => _controllerName;

  String get getPettyCashVoucherDetails => '$_controllerName/details';

  String get updatePettyCashVoucherDetails => _controllerName;
}
