part of 'endpoints.dart';

class _Accounts {
  final String _apiBaseUrl;

  factory _Accounts({required String apiBaseUrl}) {
    _instance ??= _Accounts._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Accounts._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Accounts? _instance;

  String get _controllerName => '$_apiBaseUrl/identity/Accounts';

  String get createCompanyUser => '$_controllerName/CreateCompanyUser';

  String get createCompanyAccount => '$_controllerName/CreateCompanyAccount';

  String get updateUserDetails => '$_controllerName/UpdateUserDetails';
}
