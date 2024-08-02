part of 'endpoints.dart';

class _IcCategory {
  final String _apiBaseUrl;

  factory _IcCategory({required String apiBaseUrl}) {
    _instance ??= _IcCategory._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _IcCategory._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _IcCategory? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/intercompanycategory';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
