part of 'endpoints.dart';

class _Employees {
  final String _apiBaseUrl;

  factory _Employees({required String apiBaseUrl}) {
    _instance ??= _Employees._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Employees._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Employees? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/Employees';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({required String financialYear}) => '$_controllerName/dropdowns?financialYear=$financialYear';
}
