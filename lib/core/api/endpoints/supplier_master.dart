part of 'endpoints.dart';

class _SupplierMaster {
  final String _apiBaseUrl;

  factory _SupplierMaster({required String apiBaseUrl}) {
    _instance ??= _SupplierMaster._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _SupplierMaster._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _SupplierMaster? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/suppliers';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String get delete => _controllerName;

  String dropdowns({required String financialYear}) => '$_controllerName/dropdowns?financialYear=$financialYear';
}
