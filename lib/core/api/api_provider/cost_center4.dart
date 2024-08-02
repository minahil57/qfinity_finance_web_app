part of 'api_provider.dart';

class _CostCenter4 {
  factory _CostCenter4() {
    _instance ??= _CostCenter4._sharedInstance();
    return _instance!;
  }

  _CostCenter4._sharedInstance();

  static _CostCenter4? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.costCenter4.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.costCenter4.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.costCenter4.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.costCenter4.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.costCenter4.create,
      data: data,
    );
  }

  Future<Response> dropdowns() async {
    return DioHelper.getData(
      endPoint: EndPoints.costCenter4.dropdowns(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }
}
