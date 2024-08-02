part of 'api_provider.dart';

class _IcCategory {
  factory _IcCategory() {
    _instance ??= _IcCategory._sharedInstance();
    return _instance!;
  }

  _IcCategory._sharedInstance();

  static _IcCategory? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.icCategory.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.icCategory.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.icCategory.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.icCategory.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.icCategory.create,
      data: data,
    );
  }
}
