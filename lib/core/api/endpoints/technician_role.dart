part of 'endpoints.dart';

class _TechnicianRole {
  final String _apiBaseUrl;

  factory _TechnicianRole({required String apiBaseUrl}) {
    _instance ??= _TechnicianRole._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _TechnicianRole._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _TechnicianRole? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/TechnicianRole';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
