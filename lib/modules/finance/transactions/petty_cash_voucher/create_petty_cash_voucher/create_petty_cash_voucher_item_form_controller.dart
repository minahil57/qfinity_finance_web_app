import 'package:qfinity/export.dart';

class CreatePettyCashVoucherItemFormController extends BaseController with CostCentersMixin {
  FormValidator basicValidator = FormValidator();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final FocusNode creditFocusNode = FocusNode();
  final createPettyCashVoucherController = Get.find<CreatePettyCashVoucherController>();
  List<TaxModel> taxes = [
    TaxModel.defaultTax(),
  ];
  List<DropdownItemModel> accounts = [];
  DropdownItemModel? selectedAccount;
  double total = 0;
  late final bool showCostCenters;
  late TaxModel selectedTax;
  late bool isTaxInclusive;
  double? oldCreditValue;

  @override
  String cc1Label = 'Project';

  @override
  String cc2Label = 'Unit';

  @override
  String cc3Label = 'Department';

  @override
  String cc4Label = 'Division';

  @override
  void onInit() {
    super.onInit();
    basicValidator
      ..addField(
        'debit',
        required: true,
        label: 'Debit',
        validators: [PositiveNumberWithTwoDigitsDecimalPointValidator()],
        controller: TextEditingController(),
      )
      ..addField(
        'vat',
        label: 'VAT',
        controller: TextEditingController(),
      )
      ..addField(
        'narration',
        label: 'Narration',
        controller: TextEditingController(),
      );
    _initData();

    creditFocusNode.addListener(() {
      if (!creditFocusNode.hasFocus) {
        _calcCreditVatTotal();
      }
    });
  }

  void onTaxSelected(TaxModel? tax) {
    selectedTax = tax!;
    _calcCreditVatTotal(onTaxChanged: true);
    update();
  }

  void onAccountSelected(DropdownItemModel? account) {
    selectedAccount = account;
    update();
  }

  void addOrUpdatePettyCashVoucherItem() {
    if (basicValidator.validateForm()) {
      final model = CreatePettyCashVoucherItemModel(
        accountCode: selectedAccount?.id ?? '',
        accountName: selectedAccount?.name ?? '',
        taxCode: selectedTax.recordId,
        amount: double.tryParse(
              basicValidator.getController('debit')!.text,
            ) ??
            0,
        vat: double.tryParse(
              basicValidator.getController('vat')!.text,
            ) ??
            0,
        total: total,
        taxName: selectedTax.name,
        narration: basicValidator.getController('narration')!.text,
        costCenter1: selectedCostCenter1.id,
        costCenter2: selectedCostCenter2.id,
        costCenter3: selectedCostCenter3.id,
        costCenter4: selectedCostCenter4.id,
      );

      if (createPettyCashVoucherController.toBeEditedItem != null) {
        int itemIndex = createPettyCashVoucherController.voucherItems.indexOf(
          createPettyCashVoucherController.toBeEditedItem!,
        );
        createPettyCashVoucherController.voucherItems[itemIndex] = model;
      } else {
        createPettyCashVoucherController.voucherItems.add(model);
      }

      createPettyCashVoucherController.buildVoucherItemTableRows();
      Get.back();
    } else {
      autovalidateMode = AutovalidateMode.always;
      update();
    }
  }

  void onVatChanged(String value) {
    double debit = double.tryParse(basicValidator.getController('debit')!.text) ?? 0;
    double vat = double.tryParse(value) ?? 0;
    total = debit + vat;
    update();
  }

  void _initData() {
    AppLogger.d('CreatePettyCashVoucherItemFormController._initData');
    costCenter1.addAll(
      createPettyCashVoucherController.dropdownsData!.costCenter1,
    );
    costCenter2.addAll(
      createPettyCashVoucherController.dropdownsData!.costCenter2,
    );
    costCenter3.addAll(
      createPettyCashVoucherController.dropdownsData!.costCenter3,
    );
    costCenter4.addAll(
      createPettyCashVoucherController.dropdownsData!.costCenter4,
    );
    accounts.addAll(
      createPettyCashVoucherController.accounts,
    );
    taxes.addAll(
      createPettyCashVoucherController.dropdownsData!.taxes,
    );
    showCostCenters = !createPettyCashVoucherController.copyCostCenters;
    selectedTax = createPettyCashVoucherController.selectedTax;
    isTaxInclusive = createPettyCashVoucherController.isTaxInclusive;
    basicValidator.getController('narration')!.text =
        createPettyCashVoucherController.narrationTextEditingController.text;

    if (createPettyCashVoucherController.voucherItems.isNotEmpty) {
      selectedAccount = DropdownItemModel(
        id: createPettyCashVoucherController.voucherItems.last.accountCode!,
        name: createPettyCashVoucherController.voucherItems.last.accountName!,
      );
      selectedTax = taxes.firstWhere(
        (e) => e.recordId == createPettyCashVoucherController.voucherItems.last.taxCode,
      );

      if (createPettyCashVoucherController.voucherItems.last.narration != null &&
          createPettyCashVoucherController.voucherItems.last.narration!.isNotEmpty) {
        basicValidator.getController('narration')!.text = createPettyCashVoucherController.voucherItems.last.narration!;
      }

      selectedCostCenter1 = costCenter1.firstWhere(
        (e) => e.id == createPettyCashVoucherController.voucherItems.last.costCenter1,
      );
      selectedCostCenter2 = costCenter2.firstWhere(
        (e) => e.id == createPettyCashVoucherController.voucherItems.last.costCenter2,
      );
      selectedCostCenter3 = costCenter3.firstWhere(
        (e) => e.id == createPettyCashVoucherController.voucherItems.last.costCenter3,
      );
      selectedCostCenter4 = costCenter4.firstWhere(
        (e) => e.id == createPettyCashVoucherController.voucherItems.last.costCenter4,
      );
    }

    if (createPettyCashVoucherController.toBeEditedItem != null) {
      final item = createPettyCashVoucherController.toBeEditedItem!;
      basicValidator.getController('debit')!.text = item.amount!.toStringAsFixed(2);
      basicValidator.getController('vat')!.text = item.vat!.toStringAsFixed(2);
      selectedAccount = DropdownItemModel(
        id: item.accountCode!,
        name: item.accountName!,
      );
      selectedTax = taxes.firstWhere((e) => e.recordId == item.taxCode);
      total = item.total!;
      oldCreditValue = item.amount;
      selectedCostCenter1 = costCenter1.firstWhere((e) => e.id == item.costCenter1);
      selectedCostCenter2 = costCenter2.firstWhere((e) => e.id == item.costCenter2);
      selectedCostCenter3 = costCenter3.firstWhere((e) => e.id == item.costCenter3);
      selectedCostCenter4 = costCenter4.firstWhere((e) => e.id == item.costCenter4);
      basicValidator.getController('narration')!.text = item.narration!;
    }
  }

  void _calcCreditVatTotal({bool onTaxChanged = false}) {
    double credit = double.tryParse(basicValidator.getController('debit')!.text) ?? 0;

    if (oldCreditValue == credit && !onTaxChanged) {
      return;
    }
    double newCredit;
    if (isTaxInclusive) {
      newCredit = _calcCreditVatTotalWithTaxInclusive(credit);
    } else {
      newCredit = _calcCreditVatTotalWithoutTaxInclusive(credit);
    }

    oldCreditValue = newCredit;
    update();
  }

  double _calcCreditVatTotalWithTaxInclusive(double credit) {
    total = credit;
    basicValidator.getController('debit')!.text = _calcCreditWithTaxInclusive(credit).toStringAsFixed(2);
    basicValidator.getController('vat')!.text = _calcVatWithTaxInclusive(total, credit).toStringAsFixed(2);
    return double.tryParse(basicValidator.getController('debit')!.text) ?? 0;
  }

  double _calcCreditVatTotalWithoutTaxInclusive(double credit) {
    basicValidator.getController('vat')!.text = _calcVatWithoutTaxInclusive(credit).toStringAsFixed(2);
    total = credit + (double.tryParse(basicValidator.getController('vat')!.text) ?? 0);

    return double.tryParse(basicValidator.getController('debit')!.text) ?? 0;
  }

  double _calcVatWithoutTaxInclusive(double credit) {
    return credit * (selectedTax.rate / 100);
  }

  double _calcCreditWithTaxInclusive(double credit) {
    return credit / (1 + (selectedTax.rate / 100));
  }

  double _calcVatWithTaxInclusive(double total, double credit) {
    return total - _calcCreditWithTaxInclusive(credit);
  }

  @override
  void onClose() {
    basicValidator.disposeControllers();
    creditFocusNode.dispose();
    super.onClose();
  }
}
