import 'package:qfinity/export.dart';

abstract final class LocalStorage {
  static const String email = 'email';
  static const String password = 'password';
  static const String rememberMeChecked = 'rememberMeChecked';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String _loggedInUserKey = 'user';
  static const String _themeCustomizerKey = 'theme_customizer';
  static const String _languageKey = 'lang_code';
  static const String _loginModelKey = 'login_model';
  static const String _companyModelKey = 'company_model';

  static SharedPreferences? _preferencesInstance;

  static SharedPreferences get _preferences {
    if (_preferencesInstance == null) {
      throw 'Call LocalStorage.init() to initialize local storage';
    }
    return _preferencesInstance!;
  }

  static Future<void> init() async {
    _preferencesInstance = await SharedPreferences.getInstance();
    await initData();
  }

  static Future<void> initData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AuthRepository.isLoggedIn = preferences.getBool(_loggedInUserKey) ?? false;
    ThemeCustomizer.fromJSON(preferences.getString(_themeCustomizerKey));
  }

  static Future<bool> saveData(String key, String data) async {
    return _preferences.setString(key, data);
  }

  static String? getData(String data) {
    return _preferences.getString(data);
  }

  static Future<bool> removeData(String data) async {
    return _preferences.remove(data);
  }

  static Future<bool> setLoggedInUser(bool loggedIn) async {
    return _preferences.setBool(_loggedInUserKey, loggedIn);
  }

  static Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return _preferences.setBool(key, value);
  }

  static Future<bool> setCustomizer(ThemeCustomizer themeCustomizer) {
    return _preferences.setString(
      _themeCustomizerKey,
      themeCustomizer.toJSON(),
    );
  }

  static Future<bool> setLanguage(Language language) {
    return _preferences.setString(_languageKey, language.locale.languageCode);
  }

  static String? getLanguage() {
    return _preferences.getString(_languageKey);
  }

  static Future<bool> removeLoggedInUser() async {
    return _preferences.remove(_loggedInUserKey);
  }

  static Future<bool> setLoginModel(LoginModel loginModel) async {
    return _preferences.setString(_loginModelKey, jsonEncode(loginModel.toJson()));
  }

  static LoginModel? getLoginModel() {
    var loginModel = _preferences.getString(_loginModelKey);
    if (loginModel != null) {
      return LoginModel.fromJson(jsonDecode(loginModel));
    }
    return null;
  }

  static bool? getBool({required String key}) {
    return _preferences.getBool(key);
  }

  static Future<bool> removeLoginModel() async {
    return _preferences.remove(_loginModelKey);
  }

  static Future<bool> setUserCompany(UserCompany companyModel) async {
    return _preferences.setString(_companyModelKey, jsonEncode(companyModel.toJson()));
  }

  static UserCompany? getUserCompany() {
    var companyModel = _preferences.getString(_companyModelKey);
    if (companyModel != null) {
      return UserCompany.fromJson(jsonDecode(companyModel));
    }
    return null;
  }

  static Future<bool> removeUserCompany() async {
    return _preferences.remove(_companyModelKey);
  }
}
