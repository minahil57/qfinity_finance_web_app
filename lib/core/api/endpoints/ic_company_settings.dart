part of 'endpoints.dart';

class _IcCompanySettings {
  final String _apiBaseUrl;

  factory _IcCompanySettings({required String apiBaseUrl}) {
    _instance ??= _IcCompanySettings._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _IcCompanySettings._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _IcCompanySettings? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/intercompanyaccountmappings';

  String get listing => '$_controllerName/listing';

  String details({required int id}) => '$_controllerName/$id';

  String update({required int id}) => '$_controllerName/$id';

  String delete({required int id}) => '$_controllerName/$id';

  String get create => _controllerName;

  String dropdowns({required String dbName}) => '$_controllerName/dropdowns?dbName=$dbName';

  String companyAccounts({required String dbName}) => '$_controllerName/company-accounts/$dbName';
}
