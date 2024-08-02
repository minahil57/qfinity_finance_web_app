part of 'endpoints.dart';

class _GeneralFacility {
  final String _apiBaseUrl;

  factory _GeneralFacility({required String apiBaseUrl}) {
    _instance ??= _GeneralFacility._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _GeneralFacility._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _GeneralFacility? _instance;

  String get _controllerName => '$_apiBaseUrl/facility/GeneralFacility';

  String get jobTypes => '$_controllerName/job-types';
  String taskCategories({required String jobTypeId}) => '$_controllerName/task-categories/$jobTypeId';
  String checklistCategories({required String jobTypeId}) => '$_controllerName/checklist-categories/$jobTypeId';
  String checklistActivities({required String categoryId}) => '$_controllerName/checklist-activities/$categoryId';

  String activities({required String taskCategoryId}) => '$_controllerName/activities/$taskCategoryId';

  String get properties => '$_controllerName/properties';

  String units({required String propertyNo}) => '$_controllerName/units/$propertyNo';

  String get contractors => '$_controllerName/contractors';

  String get supervisors => '$_controllerName/supervisors';

  String get technicians => '$_controllerName/technicians';

  String get priorities => '$_controllerName/priorities';

  String get complaintModes => '$_controllerName/complaint-modes';

  String get maintenanceStatuses => '$_controllerName/maintenance-statuses';

  String get assets => '$_controllerName/assets';

  String get items => '$_controllerName/items';
}
