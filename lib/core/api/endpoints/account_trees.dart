part of 'endpoints.dart';

class _AccountTrees {
  final String _apiBaseUrl;

  factory _AccountTrees({required String apiBaseUrl}) {
    _instance ??= _AccountTrees._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _AccountTrees._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _AccountTrees? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/AccountTrees';

  String get getAccountsTree => '$_controllerName/GetAccountTree';

  String get getAccounts => '$_controllerName/GetAccounts';

  String get getAccountTypes => '$_controllerName/GetAccountTypes';

  String get getAccountCashFlowCategories => '$_controllerName/GetAccountCashFlowCategories';

  String get getPrimaryAccounts => '$_controllerName/GetPrimaryAccounts';

  String get createAccount => '$_controllerName/CreateAccount';

  String get updateAccount => '$_controllerName/UpdateAccount';

  String get deleteAccount => '$_controllerName/DeleteAccount';

  String get deactivateAccount => '$_controllerName/DeactivateAccount';

  String getSubAccountGroups({required String primaryAccountCode}) {
    return '$_controllerName/GetSubAccountGroups/$primaryAccountCode';
  }

  String generateAccountCode({required String subAccountCode}) {
    return '$_controllerName/GenerateAccountCode/$subAccountCode';
  }

  String searchAccountsToEdit({required String searchQuery}) {
    return '$_controllerName/SearchAccountsToEdit/$searchQuery';
  }

  String getAccountDetails({required String accountCode}) {
    return '$_controllerName/GetAccountDetails/$accountCode';
  }

  String printChartOfAccounts({required int reportType}) {
    return '$_controllerName/PrintChartOfAccounts/$reportType';
  }
}
