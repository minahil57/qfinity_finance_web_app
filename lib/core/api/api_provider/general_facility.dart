part of 'api_provider.dart';

class _GeneralFacility {
  factory _GeneralFacility() {
    _instance ??= _GeneralFacility._sharedInstance();
    return _instance!;
  }

  _GeneralFacility._sharedInstance();

  static _GeneralFacility? _instance;

  Future<Response> jobTypes() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.jobTypes,
    );
  }

  Future<Response> taskCategories({
    required String jobTypeId,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.taskCategories(jobTypeId: jobTypeId),
    );
  }

  Future<Response> checklistCategories({
    required String jobTypeId,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.checklistCategories(jobTypeId: jobTypeId),
    );
  }

  Future<Response> checklistActivities({
    required String categoryId,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.checklistActivities(categoryId: categoryId),
    );
  }

  Future<Response> activities({
    required String taskCategoryId,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.activities(taskCategoryId: taskCategoryId),
    );
  }

  Future<Response> units({
    required String propertyNo,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.units(propertyNo: propertyNo),
    );
  }

  Future<Response> properties() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.properties,
    );
  }

  Future<Response> contractors() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.contractors,
    );
  }

  Future<Response> supervisors() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.supervisors,
    );
  }

  Future<Response> technicians() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.technicians,
    );
  }

  Future<Response> priorities() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.priorities,
    );
  }

  Future<Response> complaintModes() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.complaintModes,
    );
  }

  Future<Response> maintenanceStatuses() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.maintenanceStatuses,
    );
  }

  Future<Response> assets() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.assets,
    );
  }

  Future<Response> items() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalFacility.items,
    );
  }
}
