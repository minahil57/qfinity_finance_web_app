part of 'api_provider.dart';

class _ManagePayments {
  factory _ManagePayments() {
    _instance ??= _ManagePayments._sharedInstance();
    return _instance!;
  }

  _ManagePayments._sharedInstance();

  static _ManagePayments? _instance;

  Future<Response> getManagePaymentsDropdownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.managePayments.getManagePaymentsDropdownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> searchManagePayment({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.managePayments.searchManagePayments,
      data: data,
    );
  }

  Future<Response> getManagePaymentsItems({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.managePayments.getManagePaymentsItems,
      data: data,
    );
  }

  Future<Response> saveManagePayments({
    required List<Map<String, dynamic>> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.managePayments.saveManagePaymentsItems,
      data: data,
    );
  }
}
