part of 'endpoints.dart';

class _CheckListCategory {
  final String _apiBaseUrl;

  factory _CheckListCategory({required String apiBaseUrl}) {
    _instance ??= _CheckListCategory._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _CheckListCategory._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _CheckListCategory? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/CheckListCategory';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
