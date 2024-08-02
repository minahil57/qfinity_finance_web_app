import 'base_dropdown_item_model.dart';

class CurrencyModel extends BaseDropdownItemModel {
  const CurrencyModel({
    required super.id,
    required super.name,
    required this.conversionRate,
  });

  final double conversionRate;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        id: json['id'],
        name: json['name'],
        conversionRate: json['conversionRate'],
      );

  factory CurrencyModel.defaultCurrency() => const CurrencyModel(
        id: 'AED',
        name: 'UNITED ARAB EMIRATES DIRHAMS',
        conversionRate: 1,
      );
}
