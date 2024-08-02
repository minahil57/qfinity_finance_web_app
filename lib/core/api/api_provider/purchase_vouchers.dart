part of 'api_provider.dart';

class _PurchaseVouchers {
  factory _PurchaseVouchers() {
    _instance ??= _PurchaseVouchers._sharedInstance();
    return _instance!;
  }

  _PurchaseVouchers._sharedInstance();

  static _PurchaseVouchers? _instance;

  Future<Response> getPurchaseVouchers({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.purchaseVouchers.getPurchaseVouchers,
      data: data,
    );
  }

  Future<Response> getPurchaseDropDownsData() async {
    return DioHelper.getData(
      endPoint: EndPoints.purchaseVouchers.getPurchaseDropDownsData(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }

  Future<Response> getPurchaseVouchersSupplierDetails({
    required String supplierId,
    required String financialYear,
  }) {
    return DioHelper.getData(
      endPoint: EndPoints.purchaseVouchers.getPurchaseVouchersSupplierDetails(
        supplierId: supplierId,
        financialYear: financialYear,
      ),
    );
  }

  Future<Response> createPurchaseVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.purchaseVouchers.createPurchaseVoucher,
      data: data,
    );
  }

  Future<Response> updatePurchaseVoucher({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.purchaseVouchers.updatePurchaseVoucher,
      data: data,
    );
  }

  Future<Response> printPurchaseVoucher({
    required String voucherNo,
    required ExportedFileType fileType,
  }) {
    return DioHelper.postData(
      endPoint: EndPoints.purchaseVouchers.printPurchaseVoucher(reportType: fileType.index),
      data: {
        'voucherNo': voucherNo,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'preparedBy': AccountRepository.userName,
      },
    );
  }

  Future<Response> getPurchaseVoucherDetails({
    required String voucherNo,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.purchaseVouchers.getPurchaseVoucherDetails(voucherNo: voucherNo),
    );
  }
}
