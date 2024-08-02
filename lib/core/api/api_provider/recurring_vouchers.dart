part of 'api_provider.dart';

class _RecurringVouchers {
  factory _RecurringVouchers() {
    _instance ??= _RecurringVouchers._sharedInstance();
    return _instance!;
  }

  _RecurringVouchers._sharedInstance();

  static _RecurringVouchers? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.recurringVouchers.listing,
      data: data,
    );
  }

  Future<Response> print({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.recurringVouchers.print(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> dropdowns() async {
    return DioHelper.getData(
      endPoint: EndPoints.recurringVouchers.dropdowns(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.recurringVouchers.create,
      data: data,
    );
  }

  Future<Response> update({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.recurringVouchers.update,
      data: data,
    );
  }

  Future<Response> details({
    required String voucherNo,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.recurringVouchers.details(voucherNo: voucherNo),
    );
  }
}
