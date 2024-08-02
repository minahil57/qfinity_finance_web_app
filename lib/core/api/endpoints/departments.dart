part of 'endpoints.dart';

class _Departments {
  final String _apiBaseUrl;

  factory _Departments({required String apiBaseUrl}) {
    _instance ??= _Departments._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Departments._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Departments? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/Departments';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
