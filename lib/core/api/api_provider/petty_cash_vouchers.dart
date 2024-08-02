part of 'api_provider.dart';

class _PettyCashVouchers {
  factory _PettyCashVouchers() {
    _instance ??= _PettyCashVouchers._sharedInstance();
    return _instance!;
  }

  _PettyCashVouchers._sharedInstance();

  static _PettyCashVouchers? _instance;

  Future<Response> getPettyCashVouchers({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.pettyCashVouchers.getPettyCashVouchers,
      data: data,
    );
  }

  Future<Response> getPettyCashDropDownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.pettyCashVouchers.getPettyCashDropDownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> printPettyCashVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.pettyCashVouchers.printPettyCashVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> createPettyCadhVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.pettyCashVouchers.createPettyCashVoucher,
      data: data,
    );
  }

  Future<Response> getPettyCashVoucherDetails({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.pettyCashVouchers.getPettyCashVoucherDetails,
      data: data,
    );
  }

  Future<Response> updatePettyCashVoucherDetails({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.pettyCashVouchers.updatePettyCashVoucherDetails,
      data: data,
    );
  }
}
