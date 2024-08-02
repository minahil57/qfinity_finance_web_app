part of 'api_provider.dart';

class _BillwiseReceipts {
  factory _BillwiseReceipts() {
    _instance ??= _BillwiseReceipts._sharedInstance();
    return _instance!;
  }

  _BillwiseReceipts._sharedInstance();

  static _BillwiseReceipts? _instance;

  Future<Response> getBillwiseReceipts({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.billwiseReceipts.getBillwiseReceipts,
      data: data,
    );
  }

  Future<Response> getBillwiseReceiptsDropDownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.billwiseReceipts.getBillwiseReceiptsDropDownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> getBillwiseReceiptsCustomerDetails({
    required String customerId,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwiseReceipts.getBillwiseReceiptsCustomerDetails(customerId: customerId),
    );
  }

  Future<Response> getBillwiseReceiptsDebitAccounts({
    required bool isAll,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwiseReceipts.getBillwiseReceiptsDebitAccounts(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
        isAll: isAll,
      ),
    );
  }

  Future<Response> getBillwiseReceiptsInvoiceDetails({
    required String accountCode,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwiseReceipts.getBillwiseReceiptsInvoiceDetails(accountCode: accountCode),
    );
  }

  Future<Response> printBillwiseReceiptVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.billwiseReceipts.printBillwiseReceiptVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> printBillwiseCustomerReceipt({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.billwiseReceipts.printBillwiseCustomerReceipt(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> createBillwiseReceipt({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.billwiseReceipts.createBillwiseReceipt,
      data: data,
    );
  }

  Future<Response> getBillwiseReceiptDetails({
    required String voucherNo,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.billwiseReceipts.getBillwiseReceiptDetails(voucherNo: voucherNo),
    );
  }

  Future<Response> updateBillwiseReceipt({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.billwiseReceipts.updateBillwiseReceipt,
      data: data,
    );
  }
}
