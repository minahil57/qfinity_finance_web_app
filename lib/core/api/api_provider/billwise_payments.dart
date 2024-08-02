part of 'api_provider.dart';

class _BillwisePayments {
  factory _BillwisePayments() {
    _instance ??= _BillwisePayments._sharedInstance();
    return _instance!;
  }

  _BillwisePayments._sharedInstance();

  static _BillwisePayments? _instance;

  Future<Response> getBillwisePayments({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.billwisePayments.getBillwisePayments,
      data: data,
    );
  }

  Future<Response> getBillwisePaymentsDropDownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.billwisePayments.getBillwisePaymentsDropDownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> getBillwisePaymentsSupplierDetails({
    required String supplierId,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwisePayments.getBillwisePaymentsSupplierDetails(supplierId: supplierId),
    );
  }

  Future<Response> getBillwisePaymentsInvoiceDetails({
    required String supplierId,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwisePayments.getBillwisePaymentsInvoiceDetails(supplierId: supplierId),
    );
  }

  Future<Response> getBillwisePaymentsCreditAccounts({
    required bool isAll,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwisePayments.getBillwisePaymentsCreditAccounts(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
        isAll: isAll,
      ),
    );
  }

  Future<Response> createBillwisePayment({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.billwisePayments.createBillwisePayment,
      data: data,
    );
  }

  Future<Response> printBillwisePaymentVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.billwisePayments.printBillwisePaymentVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> getBillwisePaymentDetails({
    required String voucherNo,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwisePayments.getBillwisePaymentDetails(voucherNo: voucherNo),
    );
  }

  Future<Response> updateBillwisePayment({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.billwisePayments.updateBillwisePayment,
      data: data,
    );
  }
}
