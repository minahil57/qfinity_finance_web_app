part of 'endpoints.dart';

class _TaskCategory {
  final String _apiBaseUrl;

  factory _TaskCategory({required String apiBaseUrl}) {
    _instance ??= _TaskCategory._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _TaskCategory._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _TaskCategory? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/TaskCategory';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
