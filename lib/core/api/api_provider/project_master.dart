part of 'api_provider.dart';

class _ProjectMaster {
  factory _ProjectMaster() {
    _instance ??= _ProjectMaster._sharedInstance();
    return _instance!;
  }

  _ProjectMaster._sharedInstance();

  static _ProjectMaster? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.projectMaster.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.projectMaster.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.projectMaster.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
    required String deletedBy,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.projectMaster.delete(
        id: id,
        deletedBy: deletedBy,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.projectMaster.create,
      data: data,
    );
  }
}
