part of 'endpoints.dart';

class _ChequeDiscount {
  final String _apiBaseUrl;

  factory _ChequeDiscount({required String apiBaseUrl}) {
    _instance ??= _ChequeDiscount._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _ChequeDiscount._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _ChequeDiscount? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/chequediscounts';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({required String financialYear}) => '$_controllerName?financialYear=$financialYear';
}
