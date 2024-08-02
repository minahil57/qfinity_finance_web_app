part of 'endpoints.dart';

class _ContraVouchers {
  final String _apiBaseUrl;

  factory _ContraVouchers({required String apiBaseUrl}) {
    _instance ??= _ContraVouchers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _ContraVouchers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _ContraVouchers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/ContraVouchers';

  String get getContraVouchers => '$_controllerName/listing';

  String printContraVoucher({required int reportType}) {
    return '$_controllerName/print/$reportType';
  }

  String getContraVoucherDropdownsData({
    required String financialYear,
  }) {
    return '$_controllerName/dropdowns?financialYear=$financialYear';
  }

  String get createContraVoucher => _controllerName;

  String get getContraVoucherDetails => '$_controllerName/details';

  String get updateContraVoucher => _controllerName;
}
