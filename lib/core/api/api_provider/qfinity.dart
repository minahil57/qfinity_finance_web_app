part of 'api_provider.dart';

class _Qfinity {
  factory _Qfinity() {
    _instance ??= _Qfinity._sharedInstance();
    return _instance!;
  }

  _Qfinity._sharedInstance();

  static _Qfinity? _instance;

  Future<Response> getFinancialYears() {
    return DioHelper.getData(
      endPoint: EndPoints.qfinity.getFinancialYears,
    );
  }

  Future<Response> getCurrencies() {
    return DioHelper.getData(
      endPoint: EndPoints.qfinity.getCurrencies,
    );
  }

  Future<Response> getCountries() {
    return DioHelper.getData(
      endPoint: EndPoints.qfinity.getCountries,
    );
  }

  Future<Response> getCities({required String countryName}) {
    return DioHelper.getData(
      endPoint: EndPoints.qfinity.getCities(countryName: countryName),
    );
  }
}
