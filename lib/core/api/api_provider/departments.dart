part of 'api_provider.dart';

class _Departments {
  factory _Departments() {
    _instance ??= _Departments._sharedInstance();
    return _instance!;
  }

  _Departments._sharedInstance();

  static _Departments? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.departments.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.departments.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.departments.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.departments.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.departments.create,
      data: data,
    );
  }
}
