part of 'api_provider.dart';

class _ChequeDiscount {
  factory _ChequeDiscount() {
    _instance ??= _ChequeDiscount._sharedInstance();
    return _instance!;
  }

  _ChequeDiscount._sharedInstance();

  static _ChequeDiscount? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.chequeDiscount.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.chequeDiscount.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.chequeDiscount.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.chequeDiscount.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.chequeDiscount.create,
      data: data,
    );
  }

  Future<Response> dropdowns() async {
    return DioHelper.getData(
      endPoint: EndPoints.chequeDiscount.dropdowns(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }
}
