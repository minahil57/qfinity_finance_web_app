part of 'api_provider.dart';

class _TransactionType {
  factory _TransactionType() {
    _instance ??= _TransactionType._sharedInstance();
    return _instance!;
  }

  _TransactionType._sharedInstance();

  static _TransactionType? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.transactionType.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.transactionType.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.transactionType.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.transactionType.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.transactionType.create,
      data: data,
    );
  }

  Future<Response> dropdowns() async {
    return DioHelper.getData(
      endPoint: EndPoints.transactionType.dropdowns(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }
}
