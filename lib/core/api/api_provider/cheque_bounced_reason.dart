part of 'api_provider.dart';

class _ChequeBouncedReason {
  factory _ChequeBouncedReason() {
    _instance ??= _ChequeBouncedReason._sharedInstance();
    return _instance!;
  }

  _ChequeBouncedReason._sharedInstance();

  static _ChequeBouncedReason? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.chequeBouncedReason.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.chequeBouncedReason.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.chequeBouncedReason.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.chequeBouncedReason.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.chequeBouncedReason.create,
      data: data,
    );
  }
}
