part of 'api_provider.dart';

class _TrialBalance {
  factory _TrialBalance() {
    _instance ??= _TrialBalance._sharedInstance();
    return _instance!;
  }

  _TrialBalance._sharedInstance();

  static _TrialBalance? _instance;

  Future<Response> getTrialBalanceFilterData() async {
    return DioHelper.getData(
      endPoint: EndPoints.trialBalance.getTrialBalanceFilterData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> printTrialBalance(
    Map<String, dynamic> data,
    ExportedFileType fileType,
  ) {
    return DioHelper.postData(
      endPoint: EndPoints.trialBalance.printTrialBalance(reportType: fileType.index),
      data: data,
    );
  }
}
