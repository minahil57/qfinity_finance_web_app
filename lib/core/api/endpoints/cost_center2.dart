part of 'endpoints.dart';

class _CostCenter2 {
  final String _apiBaseUrl;

  factory _CostCenter2({required String apiBaseUrl}) {
    _instance ??= _CostCenter2._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _CostCenter2._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _CostCenter2? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/CostCenter2';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
