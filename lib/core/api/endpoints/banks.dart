part of 'endpoints.dart';

class _Banks {
  final String _apiBaseUrl;

  factory _Banks({required String apiBaseUrl}) {
    _instance ??= _Banks._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Banks._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Banks? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/Banks';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String isDescriptionEditable({required int id}) => '$_controllerName/is-editable/$id';
}
