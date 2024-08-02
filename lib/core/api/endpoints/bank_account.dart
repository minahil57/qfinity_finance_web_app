part of 'endpoints.dart';

class _BankAccount {
  final String _apiBaseUrl;

  factory _BankAccount({required String apiBaseUrl}) {
    _instance ??= _BankAccount._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _BankAccount._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _BankAccount? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/bankdetails';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({required String financialYear}) => '$_controllerName/dropdowns?financialYear=$financialYear';
}
