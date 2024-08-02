part of 'endpoints.dart';

class _TechnicianMaster {
  final String _apiBaseUrl;

  factory _TechnicianMaster({required String apiBaseUrl}) {
    _instance ??= _TechnicianMaster._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _TechnicianMaster._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _TechnicianMaster? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/TechnicianMaster';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({
    required String baseDb,
    required String companyNo,
  }) =>
      '$_controllerName/dropdowns?baseDb=$baseDb&companyNo=$companyNo';
}
