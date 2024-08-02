part of 'endpoints.dart';

class _CheckListActivity {
  final String _apiBaseUrl;

  factory _CheckListActivity({required String apiBaseUrl}) {
    _instance ??= _CheckListActivity._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _CheckListActivity._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _CheckListActivity? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/CheckListActivity';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
