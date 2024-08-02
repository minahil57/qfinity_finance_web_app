import 'package:qfinity/export.dart';

class PettyCashVoucherController extends BaseController with FromToDateMixin, BasicListingFiltersMixin, ExportMixin {
  PettyCashVoucherDropdownsDataModel? pettyCashVoucherDropdownsData;
  final List<String> columns = [
    'Approved',
    'Voucher No',
    'Posting Type',
    'Posting Date',
    'Account Code',
    'Account Name',
    'Ref No',
    'Amount Credit',
    'Amount Debit',
    'Transaction Method',
    'Transaction Date',
    'Created By',
    'Created On',
    'Project',
    'Unit',
    'Department',
    'Division',
    'Actions',
  ];
  DataTableSource data = PettyCashVoucherData([]);
  List<PettyCashVoucherModel>? pettyCashVouchers;

  PettyCashVoucherDetailsModel? pettyCashVoucherDetailsModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    _initData();
  }

  Future<void> onPrintItemIconPressed(PettyCashVoucherModel item) async {
    fileUrl = null;
    voucherNo = item.voucherNo;
    await export(fileType: ExportedFileType.pdf);
  }

  Future<void> onEditItemIconPressed(PettyCashVoucherModel item) async {
    var filters = {
      'voucherNo': item.voucherNo,
      'financialYear': Get.find<StarterController>().selectedFinancialYearId,
      'postingId': item.postingId,
    };

    await _getPettyCashVoucherDetail(filters);

    Get.toNamed(Routes.editPettyCashVoucher);
  }

  @override
  Future<void> export({required ExportedFileType fileType}) async {
    if (fileUrl != null) {
      EasyLoading.show(
        status: 'Exporting...',
        maskType: EasyLoadingMaskType.black,
      );
    } else {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
      );
    }
    try {
      var response = await ApiProvider.pettyCashVouchers.printPettyCashVoucher(
        voucherNo: voucherNo!,
        fileType: fileType,
      );

      if (response.statusCode == 200) {
        if (fileUrl != null) {
          await UrlService.goToUrl(response.data['data']);
        } else {
          fileUrl = response.data['data'];
          Get.to(
            () => const PrintPage<PettyCashVoucherController>(
              title: 'Petty Cash Voucher',
            ),
          );
        }
        EasyLoading.dismiss();
      } else {
        Snackbars.error(response.data['data']);
      }
    } on DioException catch (e) {
      AppLogger.e(e);
      if (e.message == 'Expired Session') {
        return;
      } else {
        if (e.response?.statusCode == 400) {
          Snackbars.error(e.response!.data['data']);
        } else {
          Snackbars.somethingWentWrong();
        }
      }
    } on Exception catch (e) {
      AppLogger.e(e);
      Snackbars.somethingWentWrong();
    }
  }

  @override
  void onResetPressed() {
    _resetFilters();
  }

  @override
  void onSearchPressed() {
    getPettyCashVouchers();
  }

  Future<void> _initData() async {
    await Future.wait([
      getPettyCashVouchers(),
      getPettyCashVoucherDropdownsData(),
    ]);
  }

  void _resetFilters() {
    resetFromToDates();
    resetBasicListingFilters();
  }

  Future<void> getPettyCashVoucherDropdownsData() async {
    try {
      var response = await ApiProvider.pettyCashVouchers.getPettyCashDropDownsData();

      if (response.statusCode == 200) {
        pettyCashVoucherDropdownsData = PettyCashVoucherDropdownsDataModel.fromJson(
          response.data['data'],
        );
        dropdownVouchers.addAll(pettyCashVoucherDropdownsData!.vouchers);

        update();
      } else {
        Snackbars.somethingWentWrong();
      }
    } on DioException catch (e) {
      AppLogger.e(e);
      if (e.message == 'Expired Session') {
        EasyLoading.dismiss();
        update();
        return;
      } else {
        if (e.response?.statusCode == 400) {
          Snackbars.error(e.response!.data['data']);
        } else {
          Snackbars.somethingWentWrong();
        }
      }
    } on Exception catch (e) {
      AppLogger.e(e);
      Snackbars.somethingWentWrong();
    }
  }

  Future<void> getPettyCashVouchers() async {
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    data = PettyCashVoucherData([]);
    update();

    try {
      var filters = _getSelectedFiltersToFetchData();
      var response = await ApiProvider.pettyCashVouchers.getPettyCashVouchers(data: filters);

      if (response.statusCode == 200) {
        pettyCashVouchers = response.data['data']
            .map<PettyCashVoucherModel>(
              (e) => PettyCashVoucherModel.fromJson(e),
            )
            .toList();
        data = PettyCashVoucherData(pettyCashVouchers!);

        if (pettyCashVouchers == null || pettyCashVouchers!.isEmpty) {
          Snackbars.warningWithTitle(
            'No data',
            'There are no data to show, please select some filters and try again',
          );
        }

        update();
      } else {
        Snackbars.somethingWentWrong();
      }
    } on DioException catch (e) {
      AppLogger.e(e);
      if (e.message == 'Expired Session') {
        EasyLoading.dismiss();
        return;
      } else {
        if (e.response?.statusCode == 400) {
          Snackbars.error(e.response!.data['data']);
        } else {
          Snackbars.somethingWentWrong();
        }
      }
    } on Exception catch (e) {
      AppLogger.e(e);
      Snackbars.somethingWentWrong();
    }

    EasyLoading.dismiss();
  }

  Map<String, dynamic> _getSelectedFiltersToFetchData() {
    final String financialYear = Get.find<StarterController>().selectedFinancialYearId;

    return {
      'take': 0,
      'skip': 0,
      'sortColumn': 'postingDate DESC, voucherNo',
      'sortDirection': Sorting.desc.index,
      'fromDate': selectedFromDate.startOfDay,
      'toDate': selectedToDate.endOfDay,
      'financialYear': financialYear == '' ? 'FY ${DateTime.now().year}' : financialYear,
      'voucherNo': selectedVoucher.voucherNo == 'All' ? '' : selectedVoucher.voucherNo,
    };
  }

  Future<void> _getPettyCashVoucherDetail(
    Map<String, dynamic> filters,
  ) async {
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    update();

    try {
      var response = await ApiProvider.pettyCashVouchers.getPettyCashVoucherDetails(data: filters);

      if (response.statusCode == 200) {
        pettyCashVoucherDetailsModel = PettyCashVoucherDetailsModel.fromJson(response.data);

        update();
      } else {
        Snackbars.somethingWentWrong();
      }
    } on DioException catch (e) {
      AppLogger.e(e);
      if (e.message == 'Expired Session') {
        EasyLoading.dismiss();
        update();
        return;
      } else {
        if (e.response?.statusCode == 400) {
          Snackbars.error(e.response!.data['data']);
        } else {
          Snackbars.somethingWentWrong();
        }
      }
    } on Exception catch (e) {
      AppLogger.e(e);
      Snackbars.somethingWentWrong();
    }
    EasyLoading.dismiss();

    update();
  }

  @override
  void onClose() {
    data.dispose();
    super.onClose();
  }
}
