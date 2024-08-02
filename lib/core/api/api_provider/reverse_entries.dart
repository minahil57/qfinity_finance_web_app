part of 'api_provider.dart';

class _ReverseEntries {
  factory _ReverseEntries() {
    _instance ??= _ReverseEntries._sharedInstance();
    return _instance!;
  }

  _ReverseEntries._sharedInstance();

  static _ReverseEntries? _instance;

  Future<Response> searchReverseEntries({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.reverseEntries.searchReverseEntries,
      data: data,
    );
  }

  Future<Response> getReverseEntriesDropDownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.reverseEntries.getReverseEntriesDropDownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> printReverseEntries({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.reverseEntries.printReverseEntries(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> getReverseEntriesVouchers({
    required String voucherType,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.reverseEntries.getReverseEntriesVouchers,
      data: {
        'voucherType': voucherType,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
      },
    );
  }

  Future<Response> checkReverseVoucher({
    required String voucherNo,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.reverseEntries.checkReverseVoucher,
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
      },
    );
  }

  Future<Response> checkReceiptMade({
    required String voucherNo,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.reverseEntries.checkReceiptMade,
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
      },
    );
  }

  Future<Response> checkPaymentMade({
    required String voucherNo,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.reverseEntries.checkPaymentMade,
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
      },
    );
  }

  Future<Response> createReverseEntry({
    required List<Map<String, dynamic>> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.reverseEntries.createReverseEntry,
      data: data,
    );
  }
}
