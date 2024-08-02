part of 'api_provider.dart';

class _CostCenter2 {
  factory _CostCenter2() {
    _instance ??= _CostCenter2._sharedInstance();
    return _instance!;
  }

  _CostCenter2._sharedInstance();

  static _CostCenter2? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.costCenter2.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.costCenter2.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.costCenter2.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.costCenter2.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.costCenter2.create,
      data: data,
    );
  }
}
