part of 'endpoints.dart';

class _CostCenter4 {
  final String _apiBaseUrl;

  factory _CostCenter4({required String apiBaseUrl}) {
    _instance ??= _CostCenter4._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _CostCenter4._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _CostCenter4? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/CostCenter4';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({required String financialYear}) => '$_controllerName/dropdowns?financialYear=$financialYear';
}
