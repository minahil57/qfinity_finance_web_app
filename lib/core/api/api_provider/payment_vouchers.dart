part of 'api_provider.dart';

class _PaymentVouchers {
  factory _PaymentVouchers() {
    _instance ??= _PaymentVouchers._sharedInstance();
    return _instance!;
  }

  _PaymentVouchers._sharedInstance();

  static _PaymentVouchers? _instance;

  Future<Response> getPaymentVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.paymentVouchers.getPaymentVouchers,
      data: data,
    );
  }

  Future<Response> getPaymentVoucherDropdownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.paymentVouchers.getPaymentVoucherDropdownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> getPaymentVoucherDetails({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.paymentVouchers.getPaymentVoucherDetails,
      data: data,
    );
  }

  Future<Response> createPaymentVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.paymentVouchers.createPaymentVoucher,
      data: data,
    );
  }

  Future<Response> updatePaymentVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.paymentVouchers.updatePaymentVoucher,
      data: data,
    );
  }

  Future<Response> printPaymentVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.paymentVouchers.printPaymentVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> getPaymentVoucherCreditAccounts({
    required bool fetchAll,
  }) {
    return DioHelper.getData(
      endPoint: EndPoints.paymentVouchers.getPaymentVoucherCreditAccounts(
        fetchAll: fetchAll,
      ),
    );
  }
}
