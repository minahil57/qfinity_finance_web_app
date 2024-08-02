part of 'api_provider.dart';

class _TaskCategory {
  factory _TaskCategory() {
    _instance ??= _TaskCategory._sharedInstance();
    return _instance!;
  }

  _TaskCategory._sharedInstance();

  static _TaskCategory? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.taskCategory.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.taskCategory.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.taskCategory.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.taskCategory.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.taskCategory.create,
      data: data,
    );
  }
}
