part of 'endpoints.dart';

class _Qfinity {
  final String _apiBaseUrl;

  factory _Qfinity({required String apiBaseUrl}) {
    _instance ??= _Qfinity._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Qfinity._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Qfinity? _instance;

  String get _controllerName => '$_apiBaseUrl/general/Qfinity';

  String get getFinancialYears => '$_controllerName/GetFinancialYears';

  String get getCurrencies => '$_controllerName/GetCurrencies';

  String get getCountries => '$_controllerName/GetCountries';

  String getCities({required String countryName}) {
    return '$_controllerName/GetCities/$countryName';
  }
}
