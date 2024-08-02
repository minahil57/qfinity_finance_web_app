part of 'api_provider.dart';

class _Banks {
  factory _Banks() {
    _instance ??= _Banks._sharedInstance();
    return _instance!;
  }

  _Banks._sharedInstance();

  static _Banks? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.banks.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.banks.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.banks.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.banks.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.banks.create,
      data: data,
    );
  }

  Future<Response> isDescriptionEditable({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.banks.isDescriptionEditable(
        id: id,
      ),
    );
  }
}
