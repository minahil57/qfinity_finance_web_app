part of 'api_provider.dart';

class _GeneralLedgers {
  factory _GeneralLedgers() {
    _instance ??= _GeneralLedgers._sharedInstance();
    return _instance!;
  }

  _GeneralLedgers._sharedInstance();

  static _GeneralLedgers? _instance;

  Future<Response> getGeneralLedgersFilterData() async {
    return DioHelper.getData(
      endPoint: EndPoints.generalLedgers.getGeneralLedgersFilterData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> printGeneralLedger(
    Map<String, dynamic> data,
    ExportedFileType fileType,
  ) {
    return DioHelper.postData(
      endPoint: EndPoints.generalLedgers.printGeneralLedger(reportType: fileType.index),
      data: data,
    );
  }
}
