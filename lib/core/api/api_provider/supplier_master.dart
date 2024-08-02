part of 'api_provider.dart';

class _SupplierMaster {
  factory _SupplierMaster() {
    _instance ??= _SupplierMaster._sharedInstance();
    return _instance!;
  }

  _SupplierMaster._sharedInstance();

  static _SupplierMaster? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.supplierMaster.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.supplierMaster.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.supplierMaster.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.supplierMaster.delete,
      data: data,
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.supplierMaster.create,
      data: data,
    );
  }

  Future<Response> dropdowns() async {
    return DioHelper.getData(
      endPoint: EndPoints.supplierMaster.dropdowns(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }
}
