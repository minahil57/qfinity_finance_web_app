part of 'endpoints.dart';

class _TaxMaster {
  final String _apiBaseUrl;

  factory _TaxMaster({required String apiBaseUrl}) {
    _instance ??= _TaxMaster._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _TaxMaster._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _TaxMaster? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/taxes';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({required String financialYear}) => '$_controllerName/dropdowns?financialYear=$financialYear';
}
