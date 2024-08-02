part of 'api_provider.dart';

class _ContraVouchers {
  factory _ContraVouchers() {
    _instance ??= _ContraVouchers._sharedInstance();
    return _instance!;
  }

  _ContraVouchers._sharedInstance();

  static _ContraVouchers? _instance;

  Future<Response> getContraVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.contraVouchers.getContraVouchers,
      data: data,
    );
  }

  Future<Response> printContraVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.contraVouchers.printContraVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> getContraVoucherDropdownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.contraVouchers.getContraVoucherDropdownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> createContraVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.contraVouchers.createContraVoucher,
      data: data,
    );
  }

  Future<Response> updateContraVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.contraVouchers.updateContraVoucher,
      data: data,
    );
  }

  Future<Response> getContraVoucherDetails({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.contraVouchers.getContraVoucherDetails,
      data: data,
    );
  }
}
