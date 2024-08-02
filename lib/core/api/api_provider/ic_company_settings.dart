part of 'api_provider.dart';

class _IcCompanySettings {
  factory _IcCompanySettings() {
    _instance ??= _IcCompanySettings._sharedInstance();
    return _instance!;
  }

  _IcCompanySettings._sharedInstance();

  static _IcCompanySettings? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.icCompanySettings.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.icCompanySettings.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.icCompanySettings.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.icCompanySettings.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.icCompanySettings.create,
      data: data,
    );
  }

  Future<Response> dropdowns({
    required String dbName,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.icCompanySettings.dropdowns(
        dbName: dbName,
      ),
    );
  }

  Future<Response> companyAccounts({
    required String dbName,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.icCompanySettings.companyAccounts(
        dbName: dbName,
      ),
    );
  }
}
