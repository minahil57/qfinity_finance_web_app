part of 'api_provider.dart';

class _AccountTrees {
  factory _AccountTrees() {
    _instance ??= _AccountTrees._sharedInstance();
    return _instance!;
  }

  _AccountTrees._sharedInstance();

  static _AccountTrees? _instance;

  Future<Response> getAccountsTree(Map<String, dynamic> data) async {
    return DioHelper.postData(
      endPoint: EndPoints.accountTrees.getAccountsTree,
      data: data,
    );
  }

  Future<Response> getAccounts() async {
    return DioHelper.getData(endPoint: EndPoints.accountTrees.getAccounts);
  }

  Future<Response> getAccountTypes() async {
    return DioHelper.getData(endPoint: EndPoints.accountTrees.getAccountTypes);
  }

  Future<Response> getAccountCashFlowCategories() async {
    return DioHelper.getData(
      endPoint: EndPoints.accountTrees.getAccountCashFlowCategories,
    );
  }

  Future<Response> getPrimaryAccounts() async {
    return DioHelper.getData(
      endPoint: EndPoints.accountTrees.getPrimaryAccounts,
    );
  }

  Future<Response> getSubAccountGroups(
    String primaryAccountCode,
  ) {
    return DioHelper.getData(
      endPoint: EndPoints.accountTrees.getSubAccountGroups(
        primaryAccountCode: primaryAccountCode,
      ),
    );
  }

  Future<Response> generateAccountCode(
    String subAccountCode,
  ) {
    return DioHelper.getData(
      endPoint: EndPoints.accountTrees.generateAccountCode(
        subAccountCode: subAccountCode,
      ),
    );
  }

  Future<Response> createAccount({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.accountTrees.createAccount,
      data: data,
    );
  }

  Future<Response> updateAccount({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.accountTrees.updateAccount,
      data: data,
    );
  }

  Future<Response> deleteAccount({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.accountTrees.deleteAccount,
      data: data,
    );
  }

  Future<Response> deactivateAccount({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.accountTrees.deactivateAccount,
      data: data,
    );
  }

  Future<Response> printChartOfAccounts(
    Map<String, dynamic> data,
    ExportedFileType fileType,
  ) {
    return DioHelper.postData(
      endPoint: EndPoints.accountTrees.printChartOfAccounts(reportType: fileType.index),
      data: data,
    );
  }

  Future<Response> getAccountTreeDetails(
    String accountCode,
  ) {
    return DioHelper.getData(
      endPoint: EndPoints.accountTrees.getAccountDetails(
        accountCode: accountCode,
      ),
    );
  }
}
