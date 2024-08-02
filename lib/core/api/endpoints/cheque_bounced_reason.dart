part of 'endpoints.dart';

class _ChequeBouncedReason {
  final String _apiBaseUrl;

  factory _ChequeBouncedReason({required String apiBaseUrl}) {
    _instance ??= _ChequeBouncedReason._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _ChequeBouncedReason._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _ChequeBouncedReason? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/chequebouncereasons';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
