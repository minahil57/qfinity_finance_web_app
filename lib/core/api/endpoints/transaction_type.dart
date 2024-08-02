part of 'endpoints.dart';

class _TransactionType {
  final String _apiBaseUrl;

  factory _TransactionType({required String apiBaseUrl}) {
    _instance ??= _TransactionType._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _TransactionType._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _TransactionType? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/transactiontypes';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({required String financialYear}) => '$_controllerName/dropdowns?financialYear=$financialYear';
}
