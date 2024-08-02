part of 'endpoints.dart';

class _ManagePayments {
  final String _apiBaseUrl;

  factory _ManagePayments({required String apiBaseUrl}) {
    _instance ??= _ManagePayments._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _ManagePayments._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _ManagePayments? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/ManagePayments';

  String getManagePaymentsDropdownsData({
    required String financialYear,
  }) {
    return '$_controllerName/dropdowns?financialYear=$financialYear';
  }

  String get searchManagePayments => '$_controllerName/listing';

  String get getManagePaymentsItems => '$_controllerName/items';

  String get saveManagePaymentsItems => _controllerName;
}
