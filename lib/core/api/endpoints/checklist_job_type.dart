part of 'endpoints.dart';

class _CheckListJobType {
  final String _apiBaseUrl;

  factory _CheckListJobType({required String apiBaseUrl}) {
    _instance ??= _CheckListJobType._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _CheckListJobType._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _CheckListJobType? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/CheckListJobType';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
