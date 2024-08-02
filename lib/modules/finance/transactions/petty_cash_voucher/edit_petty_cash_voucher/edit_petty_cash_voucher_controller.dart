import 'package:qfinity/export.dart';

class EditPettyCashVoucherController extends BaseVoucherController<EditPettyCashVoucherItemModel>
    with
        CostCentersMixin,
        AttachmentMixin,
        ExportMixin,
        CurrencySelectionMixin,
        TaxCodeMixin<EditPettyCashVoucherItemModel>,
        NarrationMixin<EditPettyCashVoucherItemModel> {
  final invoiceNoTextEditingController = TextEditingController();
  final paidToTextEditingController = TextEditingController();
  final refNoTextEditingController = TextEditingController();
  final voucherNoTextEditingController = TextEditingController();

  List<DropdownItemModel> cashAccounts = [];
  List<DropdownItemModel> accounts = [];

  DropdownItemModel? selectedAccount;
  DateTime voucherDate = DateTime.now();

  List<DeletedAttachmentModel>? deletedAttachments = [];
  List<PettyCashVoucherTransactionModel> transactions = [];

  @override
  String cc1Label = 'Project';

  @override
  String cc2Label = 'Unit';

  @override
  String cc3Label = 'Department';

  @override
  String cc4Label = 'Division';

  @override
  List<String> get voucherItemColumns => [
        'Account Code',
        'Account Name',
        'Debit',
        'Tax',
        'VAT',
        'Total',
        'Narration',
        if (!copyCostCenters) ...[
          'Project',
          'Unit',
          'Department',
          'Division',
        ],
        'Actions',
      ];

  double balance = 0;

  late PettyCashVoucherDropdownsDataModel? dropdownsData;
  EditPettyCashVoucherItemModel? toBeEditedItem;

  @override
  Future<void> onInit() async {
    super.onInit();
    AppLogger.d('EditPettyCashVoucher._initData');
    _getPettyCashVoucherDropDownData();
    _initUpdateData();
  }

  void _initUpdateData() {
    final pettyCashVoucherController = Get.find<PettyCashVoucherController>();
    final PettyCashVoucherDetailsModel? pettyCashVoucherDetailsModel =
        pettyCashVoucherController.pettyCashVoucherDetailsModel;

    selectedAccount = accounts.firstWhereOrNull(
      (e) => e.id == pettyCashVoucherDetailsModel?.main?.accountCode,
    );

    invoiceNoTextEditingController.text = pettyCashVoucherDetailsModel?.main?.invoiceNo ?? '';
    paidToTextEditingController.text = pettyCashVoucherDetailsModel?.main?.paidTo ?? '';
    refNoTextEditingController.text = pettyCashVoucherDetailsModel?.main?.refNo ?? '';

    voucherNoTextEditingController.text = pettyCashVoucherDetailsModel?.main?.voucherNo ?? '';
    selectedAccount = accounts.firstWhereOrNull(
      (e) => e.id == pettyCashVoucherDetailsModel?.main?.accountCode,
    );

    voucherDate = pettyCashVoucherDetailsModel?.main?.postingDate ?? DateTime.now();
    selectedCurrency = currencies.firstWhereOrNull(
          (e) => e.id == pettyCashVoucherDetailsModel?.main?.currency,
        ) ??
        CurrencyModel.defaultCurrency();

    conRateTextEditingController.text =
        pettyCashVoucherDetailsModel?.main?.conversionRate?.toStringAsFixed(4) ?? '1.0000';
    fxAmountTextEditingController.text =
        pettyCashVoucherDetailsModel?.main?.convertedAmount?.toStringAsFixed(2) ?? '0.00';
    amountTextEditingController.text = pettyCashVoucherDetailsModel?.main?.amountCredit?.toStringAsFixed(2) ?? '0.00';

    selectedTax = taxes.firstWhereOrNull(
          (e) => e.recordId == pettyCashVoucherDetailsModel?.main?.taxCode,
        ) ??
        TaxModel.defaultTax();

    selectedCostCenter1 = costCenter1.firstWhereOrNull(
          (e) => e.id == pettyCashVoucherDetailsModel?.main?.costCenter1,
        ) ??
        const DropdownItemModel(id: '', name: 'None');

    selectedCostCenter2 = costCenter2.firstWhereOrNull(
          (e) => e.id == pettyCashVoucherDetailsModel?.main?.costCenter2,
        ) ??
        const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter3 = costCenter3.firstWhereOrNull(
          (e) => e.id == pettyCashVoucherDetailsModel?.main?.costCenter3,
        ) ??
        const DropdownItemModel(id: '', name: 'None');
    selectedCostCenter4 = costCenter4.firstWhereOrNull(
          (e) => e.id == pettyCashVoucherDetailsModel?.main?.costCenter4,
        ) ??
        const DropdownItemModel(id: '', name: 'None');
    narrationTextEditingController.text = pettyCashVoucherDetailsModel?.main?.commonNarration ?? '';

    balance = pettyCashVoucherDetailsModel?.main?.balance ?? 0;
    attachments = pettyCashVoucherDetailsModel?.attachments ?? [];

    transactions = pettyCashVoucherDetailsModel?.transactions ?? [];
    voucherItems = transactions
        .map(
          (e) => EditPettyCashVoucherItemModel(
            accountCode: e.acCode,
            accountName: e.acName,
            taxName: taxes
                .firstWhere(
                  (acc) => acc.recordId == e.taxCode,
                  orElse: () => TaxModel.defaultTax(),
                )
                .description,
            taxCode: e.taxCode,
            vat: e.vAT,
            total: e.total,
            amount: e.debit,
            narration: e.narration,
            costCenter1: e.costCenter1,
            costCenter2: e.costCenter2,
            costCenter3: e.costCenter3,
            costCenter4: e.costCenter4,
          ),
        )
        .toList();

    buildVoucherItemTableRows();
  }

  Future<void> pickVoucherDate() async {
    final DateTime? picked = await DateTimeHelper.pickDate(
      initialDate: voucherDate,
      lastDate: DateTimeHelper.endDateOfTheCurrentYear,
    );

    if (picked != null && picked != voucherDate) {
      voucherDate = picked;
      update();
    }
  }

  void onSelectedAccount(DropdownItemModel? value) {
    selectedAccount = value;
    _getAccountBalance(selectedAccount!.id);
    update();
  }

  @override
  void onAddNewRowPressed() {
    toBeEditedItem = null;
    _openModalForm();
  }

  void _onEditItemIconPressed(EditPettyCashVoucherItemModel item) {
    toBeEditedItem = item;
    _openModalForm();
  }

  void _openModalForm() {
    Modals.formModal(
      form: const EditPettyCashVoucherItemForm(),
    );
  }

  @override
  Future<void> saveVoucher() async {
    if (getValidations()) {
      try {
        EasyLoading.show(
          status: 'Update Petty Cash Voucher...',
          maskType: EasyLoadingMaskType.black,
        );
        await uploadImages();
        var response = await ApiProvider.pettyCashVouchers.updatePettyCashVoucherDetails(
          data: buildVoucherData(),
        );

        if (response.statusCode == 200) {
          voucherNo = response.data['data']['voucherNo'];
          Snackbars.success(
            response.data['data']['voucherNo'] + ' updated successfully.',
          );
          export(fileType: ExportedFileType.pdf);
          Get.find<PettyCashVoucherController>().getPettyCashVouchers();
          resetVoucher();
          EasyLoading.dismiss();
        } else {
          Snackbars.error(response.data['data']);
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
  }

  void resetVoucher() {
    resetCostCenters();
    resetCurrencyConversion();
    resetTaxCode();
    resetNarration();
    voucherDate = DateTime.now();
    voucherItems = [];
    voucherItemRows = [];
    attachments = [];
    refNoTextEditingController.clear();
    invoiceNoTextEditingController.clear();
    paidToTextEditingController.clear();
    amountTextEditingController.clear();
    selectedAccount = null;
    selectedCurrency = CurrencyModel.defaultCurrency();
    selectedTax = TaxModel.defaultTax();
    fileUrl = null;
    balance = 0;
    buildVoucherItemTableRows();
    update();
  }

  @override
  bool getValidations() {
    final String financialYear = Get.find<StarterController>().selectedFinancialYearName;

    bool isVoucherDateInFinancialYear = DateTimeHelper.isGivenDateInFinancialYear(
      givenDate: voucherDate,
      financialYear: financialYear,
    );

    if (!isVoucherDateInFinancialYear) {
      Snackbars.warning(
        'Voucher date should be between the Financial Period!',
      );
      return false;
    } else if (selectedAccount == null) {
      Snackbars.warning(
        'Please select credit account!',
      );
      return false;
    } else if (isAmountZero()) {
      Snackbars.warning(
        'Please enter a valid credit amount!',
      );
      return false;
    } else if (voucherItems.isEmpty) {
      Snackbars.warning(
        'You should add at least one record!',
      );
      return false;
    } else if ((double.tryParse(amountTextEditingController.text) ?? 0) != _calcSumTotal()) {
      Snackbars.warning(
        'Credit/Debit amounts do not match.',
      );
      return false;
    }

    return true;
  }

  @override
  void buildVoucherItemTableRows() {
    voucherItemRows = [];

    for (final row in voucherItems) {
      voucherItemRows.add(
        _buildVoucherItemTableSingleMainRow(item: row),
      );
    }

    voucherItemRows.add(
      _buildVoucherItemTableTotalRow(),
    );
    update();
  }

  @override
  void toggleCopyCostCentersCheckBox(bool? value) {
    copyCostCenters = value ?? false;
    buildVoucherItemTableRows();
    update();
  }

  DataRow _buildVoucherItemTableSingleMainRow({
    required EditPettyCashVoucherItemModel item,
  }) {
    return DataRow(
      cells: [
        ...[
          item.accountCode ?? '',
          item.accountName ?? '',
          if (item.amount != null) Formatter.formatToMoney(item.amount!) else '',
          item.taxName ?? '',
          if (item.vat != null) Formatter.formatToMoney(item.vat!) else '',
          if (item.total != null) Formatter.formatToMoney(item.total!) else '',
          if (item.narration == null || item.narration == '')
            narrationTextEditingController.text.orZero
          else
            item.narration!,
          if (!copyCostCenters) ...[
            if (item.costCenter1!.isNotEmpty) item.costCenter1! else 'None',
            if (item.costCenter2!.isNotEmpty) item.costCenter2! else 'None',
            if (item.costCenter3!.isNotEmpty) item.costCenter3! else 'None',
            if (item.costCenter4!.isNotEmpty) item.costCenter4! else 'None',
          ],
        ].map((e) => DataCell(TextDataCell(e))),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                color: UIConstants.contentTheme.primary,
                onPressed: () {
                  _onEditItemIconPressed(item);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: UIConstants.contentTheme.danger,
                onPressed: () {
                  _deleteVoucherItem(item);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  AmountVatTotalModel _calculateTotalRow() {
    return AmountVatTotalModel(
      amount: _calcSumDebit(),
      vat: _calcSumVat(),
      total: _calcSumTotal(),
    );
  }

  double _calcSumDebit() {
    return voucherItems.map((item) => item.amount ?? 0).fold(0, (a, b) => a + b);
  }

  double _calcSumVat() {
    return voucherItems.map((item) => item.vat ?? 0).fold(0, (a, b) => a + b);
  }

  double _calcSumTotal() {
    return voucherItems.map((item) => item.total ?? 0).fold(0, (a, b) => a + b);
  }

  DataRow _buildVoucherItemTableTotalRow() {
    var total = _calculateTotalRow();

    return DataRow(
      cells: [
        const DataCell(
          Text(
            'Total',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell.empty,
        DataCell(
          Text(
            Formatter.formatToMoney(total.amount),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell.empty,
        DataCell(
          Text(
            Formatter.formatToMoney(total.vat),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            Formatter.formatToMoney(total.total),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell.empty,
        if (!copyCostCenters) ...[
          DataCell.empty,
          DataCell.empty,
          DataCell.empty,
          DataCell.empty,
        ],
        DataCell.empty,
      ],
    );
  }

  void _deleteVoucherItem(EditPettyCashVoucherItemModel item) {
    voucherItems.remove(item);
    update();
    buildVoucherItemTableRows();
  }

  Future<void> _getPettyCashVoucherDropDownData() async {
    final pettyCashVoucherController = Get.find<PettyCashVoucherController>();

    dropdownsData = pettyCashVoucherController.pettyCashVoucherDropdownsData;

    if (dropdownsData == null) {
      await pettyCashVoucherController.getPettyCashVoucherDropdownsData();
      dropdownsData = Get.find<PettyCashVoucherController>().pettyCashVoucherDropdownsData;
    }

    costCenter1.addAll(dropdownsData!.costCenter1);
    costCenter2.addAll(dropdownsData!.costCenter2);
    costCenter3.addAll(dropdownsData!.costCenter3);
    costCenter4.addAll(dropdownsData!.costCenter4);
    taxes.addAll(dropdownsData!.taxes);
    cashAccounts.addAll(dropdownsData!.cashAccounts);
    accounts.addAll(dropdownsData!.accounts);
    currencies.addAll(dropdownsData!.currencies);

    update();
  }

  @override
  Map<String, dynamic> buildVoucherData() {
    final String financialYear = Get.find<StarterController>().selectedFinancialYearId;
    var userName = AccountRepository.userName;

    final pettyCashVoucherController = Get.find<PettyCashVoucherController>();
    final PettyCashVoucherDetailsModel? pettyCashVoucherDetailsModel =
        pettyCashVoucherController.pettyCashVoucherDetailsModel;

    EditPettyCashVoucherModel voucherModel = EditPettyCashVoucherModel(
      postingDate: voucherDate,
      currency: selectedCurrency.id,
      invoiceNo: invoiceNoTextEditingController.text.orZero,
      paidTo: paidToTextEditingController.text.orZero,
      refNo: refNoTextEditingController.text.orZero,
      narration: narrationTextEditingController.text.orZero,
      financialYear: financialYear,
      createdBy: userName,
      taxInclusive: isTaxInclusive,
      creditAmount: double.parse(amountTextEditingController.text),
      conRate: double.parse(conRateTextEditingController.text),
      conAmount: double.parse(
        fxAmountTextEditingController.text.orZero,
      ),
      createdOn: DateTime.now(),
      taxCode: selectedTax.recordId,
      vatAccountCode: selectedTax.vatAcCode,
      accountCode: selectedAccount!.id,
      accountName: selectedAccount!.name,
      costCenter1: selectedCostCenter1.id,
      costCenter2: selectedCostCenter2.id,
      costCenter3: selectedCostCenter3.id,
      costCenter4: selectedCostCenter4.id,
      voucherItems: buildVoucherItemsBeforeSend(),
      voucherAttachments: attachments,
      postingId: pettyCashVoucherDetailsModel!.main!.postingId,
      voucherNo: pettyCashVoucherDetailsModel.main!.voucherNo,
      postingType: pettyCashVoucherDetailsModel.main!.postingType,
      voucherSerialNo: pettyCashVoucherDetailsModel.main!.voucherSerialNo.toString(),
      deletedAttachments: deletedAttachments,
    );

    return voucherModel.toJson();
  }

  @override
  List<EditPettyCashVoucherItemModel> buildVoucherItemsBeforeSend() {
    List<EditPettyCashVoucherItemModel> items = [];
    for (final item in voucherItems) {
      items.add(
        EditPettyCashVoucherItemModel(
          recordId: voucherItems.indexOf(item) + 1,
          accountCode: item.accountCode,
          accountName: item.accountName,
          taxCode: taxes
              .firstWhere(
                (acc) => acc.description == item.taxName,
                orElse: () => TaxModel.defaultTax(),
              )
              .recordId,
          vat: item.vat,
          total: item.total,
          amount: item.amount,
          conRate: double.parse(conRateTextEditingController.text),
          conAmount: (item.amount ?? 0) * double.parse(conRateTextEditingController.text),
          narration: item.narration ?? '',
          taxName: item.taxName,
          costCenter1: copyCostCenters ? selectedCostCenter1.id : item.costCenter1,
          costCenter2: copyCostCenters ? selectedCostCenter2.id : item.costCenter2,
          costCenter3: copyCostCenters ? selectedCostCenter3.id : item.costCenter3,
          costCenter4: copyCostCenters ? selectedCostCenter4.id : item.costCenter4,
          amountCredit: 0,
        ),
      );
    }
    return items;
  }

  Future<void> _getAccountBalance(String accountCode) async {
    try {
      var response = await ApiProvider.generalFinance.getAccountBalance(accountCode: accountCode);

      if (response.statusCode == 200) {
        balance = response.data['data']['balance'];
        update();
      } else {
        Snackbars.somethingWentWrong();
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
            () => const PrintPage<EditPettyCashVoucherController>(
              title: 'Petty Cash Voucher',
              popLevel: 2,
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
  void onClose() {
    invoiceNoTextEditingController.dispose();
    refNoTextEditingController.dispose();
    paidToTextEditingController.dispose();
    voucherNoTextEditingController.dispose();
    disposeCurrencySelectionMixinResources();
    disposeNarrationMixinResources();
    disposeAttachmentMixinResources();
    super.onClose();
  }
}
