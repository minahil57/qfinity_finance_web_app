part of 'api_provider.dart';

class _Currencies {
  factory _Currencies() {
    _instance ??= _Currencies._sharedInstance();
    return _instance!;
  }

  _Currencies._sharedInstance();

  static _Currencies? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.currencies.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.currencies.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.currencies.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.currencies.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.currencies.create,
      data: data,
    );
  }

  Future<Response> isCodeEditable({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.currencies.isCodeEditable(
        id: id,
      ),
    );
  }
}
