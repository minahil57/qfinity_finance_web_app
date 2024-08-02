part of 'endpoints.dart';

class _ProjectMaster {
  final String _apiBaseUrl;

  factory _ProjectMaster({required String apiBaseUrl}) {
    _instance ??= _ProjectMaster._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _ProjectMaster._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _ProjectMaster? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/ProjectMaster';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id, required String deletedBy}) => '$_controllerName/$id?deletedBy=$deletedBy';

  String get create => _controllerName;
}
