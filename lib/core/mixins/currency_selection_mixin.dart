import 'package:qfinity/export.dart';

mixin CurrencySelectionMixin on BaseController {
  final conRateTextEditingController = TextEditingController(text: '1.0000');
  final fxAmountTextEditingController = TextEditingController(text: '0.00');
  final amountTextEditingController = TextEditingController(text: '0.00');

  List<CurrencyModel> currencies = [];
  CurrencyModel selectedCurrency = CurrencyModel.defaultCurrency();

  void onSelectedCurrency(CurrencyModel? value) {
    selectedCurrency = value!;
    _updateConversionRate(value.conversionRate.toStringAsFixed(4));
    fxAmountTextEditingController.text = '0.00';
    amountTextEditingController.text = '0.00';
    update();
  }

  void onConversionRateChanged(String value) {
    double conRate = double.tryParse(value) ?? 0;
    _updateBaseCurrencyAmount(conRate: conRate);
    update();
  }

  void onFxAmoutChanged(String value) {
    double amount = double.tryParse(value) ?? 0;
    _updateBaseCurrencyAmount(amount: amount);
    update();
  }

  void onAmountChanged(String value) {
    double amount = double.tryParse(value) ?? 0;
    _updateFxAmount(amount: amount);
    update();
  }

  void resetCurrencyConversion() {
    conRateTextEditingController.text = '1.0000';
    fxAmountTextEditingController.text = '0.00';
    amountTextEditingController.text = '0.00';
    selectedCurrency = CurrencyModel.defaultCurrency();
  }

  bool isAmountZero() {
    double amount = double.tryParse(amountTextEditingController.text) ?? 0;
    return amount == 0;
  }

  void _updateConversionRate(String value) {
    conRateTextEditingController.text = value;
  }

  void _updateBaseCurrencyAmount({double? conRate, double? amount}) {
    conRate ??= double.tryParse(conRateTextEditingController.text) ?? 0;
    amount ??= double.tryParse(fxAmountTextEditingController.text) ?? 0;
    amountTextEditingController.text = (conRate * amount).toStringAsFixed(2);
  }

  void _updateFxAmount({required double amount}) {
    fxAmountTextEditingController.text =
        (amount / (double.tryParse(conRateTextEditingController.text) ?? 0)).toStringAsFixed(2);
  }

  void disposeCurrencySelectionMixinResources() {
    conRateTextEditingController.dispose();
    fxAmountTextEditingController.dispose();
    amountTextEditingController.dispose();
  }
}
