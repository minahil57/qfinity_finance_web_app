part of 'api_provider.dart';

class _JournalVouchers {
  factory _JournalVouchers() {
    _instance ??= _JournalVouchers._sharedInstance();
    return _instance!;
  }

  _JournalVouchers._sharedInstance();

  static _JournalVouchers? _instance;

  Future<Response> getJournalVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.journalVouchers.getJournalVouchers,
      data: data,
    );
  }

  Future<Response> getJournalVoucherDetails({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.journalVouchers.getJournalVoucherDetails,
      data: data,
    );
  }

  Future<Response> getJournalDropDownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.journalVouchers.getJournalDropDownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> createJournalVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.journalVouchers.createJournalVoucher,
      data: data,
    );
  }

  Future<Response> updateJournalVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.journalVouchers.updateJournalVoucher,
      data: data,
    );
  }

  Future<Response> getJournalVoucherSupplierDetails(
    String supplierName,
  ) {
    return DioHelper.getData(
      endPoint: EndPoints.journalVouchers.getJournalVoucherSupplierDetails(
        supplierName: supplierName,
      ),
    );
  }

  Future<Response> printJournalVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.journalVouchers.printJournalVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }
}
