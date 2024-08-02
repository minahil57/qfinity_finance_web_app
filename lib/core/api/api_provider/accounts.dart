part of 'api_provider.dart';

class _Accounts {
  factory _Accounts() {
    _instance ??= _Accounts._sharedInstance();
    return _instance!;
  }

  _Accounts._sharedInstance();

  static _Accounts? _instance;

  Future<Response> createCompanyAccount({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.accounts.createCompanyAccount,
      data: data,
    );
  }

  Future<Response> updateUserDetails({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.accounts.updateUserDetails,
      data: data,
    );
  }
}
