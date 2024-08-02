part of 'api_provider.dart';

class _SaleVouchers {
  factory _SaleVouchers() {
    _instance ??= _SaleVouchers._sharedInstance();
    return _instance!;
  }

  _SaleVouchers._sharedInstance();

  static _SaleVouchers? _instance;

  Future<Response> getSaleVouchers({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.saleVouchers.getSaleVouchers,
      data: data,
    );
  }

  Future<Response> getSaleDropDownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.saleVouchers.getSaleDropDownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> getSaleVouchersCustomerDetails({
    required String customerId,
    required String financialYear,
  }) {
    return DioHelper.getData(
      endPoint: EndPoints.saleVouchers.getSaleVouchersCustomerDetails(
        customerId: customerId,
        financialYear: financialYear,
      ),
    );
  }

  Future<Response> createSaleVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.saleVouchers.createSaleVoucher,
      data: data,
    );
  }

  Future<Response> updateSaleVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.saleVouchers.updateSaleVoucher,
      data: data,
    );
  }

  Future<Response> printSaleVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.saleVouchers.printSaleVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> getSaleVoucherDetails({
    required String voucherNo,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.saleVouchers.getSaleVoucherDetails(voucherNo: voucherNo),
    );
  }
}
