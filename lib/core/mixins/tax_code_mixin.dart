import 'package:qfinity/export.dart';

mixin TaxCodeMixin<T extends BaseVoucherItemModel> on BaseVoucherController<T> {
  List<TaxModel> taxes = [TaxModel.defaultTax()];
  TaxModel selectedTax = TaxModel.defaultTax();
  bool isTaxInclusive = false;

  void onSelectedTax(TaxModel? value) {
    selectedTax = value!;
    update();
  }

  void toggleTaxInclusiveCheckBox(bool? value) {
    isTaxInclusive = value ?? false;
    update();
  }

  void resetTaxCode() {
    selectedTax = TaxModel.defaultTax();
    isTaxInclusive = false;
  }

  void updateSelectedTaxCode(int taxCode) {
    selectedTax = taxes.firstWhere(
      (element) => element.recordId == taxCode,
      orElse: () => TaxModel.defaultTax(),
    );
  }

  void onApplyToRowsPressed() {
    if (selectedTax.recordId == 0) {
      Snackbars.warning('Please select a tax to apply to all rows.');
      return;
    }
    _applyTaxToAllRows();
  }

  void _applyTaxToAllRows() {
    for (final item in voucherItems) {
      if (item.taxCode == selectedTax.recordId) {
        continue;
      }

      item
        ..taxName = selectedTax.description
        ..taxCode = selectedTax.recordId;

      if (isTaxInclusive) {
        item
          ..total = item.amount
          ..amount = item.amount! / (1 + (selectedTax.rate / 100))
          ..vat = item.total! - item.amount!;
      } else {
        item
          ..amount = item.amount
          ..vat = item.amount! * (selectedTax.rate / 100)
          ..total = _calculateTotal(item.vat ?? 0, item.amount ?? 0);
      }
    }
    buildVoucherItemTableRows();
  }

  double _calculateTotal(double vat, double amount) {
    return vat + amount;
  }
}
