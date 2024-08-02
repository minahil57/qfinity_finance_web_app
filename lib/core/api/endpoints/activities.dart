part of 'endpoints.dart';

class _Activities {
  final String _apiBaseUrl;

  factory _Activities({required String apiBaseUrl}) {
    _instance ??= _Activities._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Activities._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Activities? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/Activities';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
