part of 'endpoints.dart';

class _Auth {
  final String _apiBaseUrl;

  factory _Auth({required String apiBaseUrl}) {
    _instance ??= _Auth._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Auth._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Auth? _instance;

  String get _controllerName => '$_apiBaseUrl/identity/Auth';

  String get login => '$_controllerName/GetToken';

  String get logout => '$_controllerName/RevokeUserToken';

  String get logoutFromAllDevices => '$_controllerName/RevokeAllUserTokens';

  String get changePassword => '$_controllerName/ChangePassword';

  String get refreshAccessToken => '$_controllerName/RefreshAccessToken';

  String get forgetPassword => '$_controllerName/ForgetPassword';

  String get resetPassword => '$_controllerName/ResetPassword';

  String getUserRights({required String companyNo}) {
    return '$_controllerName/GetUserRights/$companyNo';
  }
}
