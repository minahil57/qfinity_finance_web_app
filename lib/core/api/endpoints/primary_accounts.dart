part of 'endpoints.dart';

class _PrimaryAccounts {
  final String _apiBaseUrl;

  factory _PrimaryAccounts({required String apiBaseUrl}) {
    _instance ??= _PrimaryAccounts._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _PrimaryAccounts._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _PrimaryAccounts? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/PrimaryAccounts';

  String get listing => '$_controllerName/listing';

  String get accountTypes => '$_controllerName/account-types';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;
}
