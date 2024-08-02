part of 'endpoints.dart';

class _Currencies {
  final String _apiBaseUrl;

  factory _Currencies({required String apiBaseUrl}) {
    _instance ??= _Currencies._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Currencies._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Currencies? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/Currencies';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String isCodeEditable({required int id}) => '$_controllerName/is-editable/$id';
}
