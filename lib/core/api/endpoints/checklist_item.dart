part of 'endpoints.dart';

class _CheckListItem {
  final String _apiBaseUrl;

  factory _CheckListItem({required String apiBaseUrl}) {
    _instance ??= _CheckListItem._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _CheckListItem._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _CheckListItem? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/CheckListItem';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
