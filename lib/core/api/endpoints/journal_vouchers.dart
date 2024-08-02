part of 'endpoints.dart';

class _JournalVouchers {
  final String _apiBaseUrl;

  factory _JournalVouchers({required String apiBaseUrl}) {
    _instance ??= _JournalVouchers._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _JournalVouchers._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _JournalVouchers? _instance;

  String get _controllerName => '$_apiBaseUrl/finanace/JournalVouchers';

  String getJournalDropDownsData({
    required String financialYear,
  }) {
    return '$_controllerName/GetJournalDropDownsData?financialYear=$financialYear';
  }

  String getJournalVoucherSupplierDetails({
    required String supplierName,
  }) {
    return '$_controllerName/GetSupplierDetails/$supplierName';
  }

  String get getJournalVouchers => '$_controllerName/GetJournalVouchers';

  String get getJournalVoucherDetails => '$_controllerName/getJournalVoucherDetails';

  String get createJournalVoucher => '$_controllerName/CreateJournalVoucher';

  String get updateJournalVoucher => '$_controllerName/UpdateJournalVoucher';

  String printJournalVoucher({required int reportType}) {
    return '$_controllerName/PrintJournalVoucher/$reportType';
  }
}
