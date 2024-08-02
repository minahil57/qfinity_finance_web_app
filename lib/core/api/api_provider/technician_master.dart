part of 'api_provider.dart';

class _TechnicianMaster {
  factory _TechnicianMaster() {
    _instance ??= _TechnicianMaster._sharedInstance();
    return _instance!;
  }

  _TechnicianMaster._sharedInstance();

  static _TechnicianMaster? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.technicianMaster.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.technicianMaster.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.technicianMaster.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.technicianMaster.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.technicianMaster.create,
      data: data,
    );
  }

  Future<Response> dropdowns() async {
    return DioHelper.getData(
      endPoint: EndPoints.technicianMaster.dropdowns(
        baseDb: Get.find<StarterController>().selectedUserCompany!.baseDb!,
        companyNo: Get.find<StarterController>().selectedUserCompany!.companyNo!,
      ),
    );
  }
}
