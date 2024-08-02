part of 'api_provider.dart';

class _PrimaryAccounts {
  factory _PrimaryAccounts() {
    _instance ??= _PrimaryAccounts._sharedInstance();
    return _instance!;
  }

  _PrimaryAccounts._sharedInstance();

  static _PrimaryAccounts? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.primaryAccounts.listing,
      data: data,
    );
  }

  Future<Response> accountTypes() async {
    return DioHelper.getData(
      endPoint: EndPoints.primaryAccounts.accountTypes,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.primaryAccounts.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.primaryAccounts.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.primaryAccounts.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.primaryAccounts.create,
      data: data,
    );
  }
}
