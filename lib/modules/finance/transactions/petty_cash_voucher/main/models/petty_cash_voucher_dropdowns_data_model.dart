import 'package:qfinity/export.dart';

class PettyCashVoucherDropdownsDataModel {
  final List<DropdownItemModel> costCenter1;
  final List<DropdownItemModel> costCenter2;
  final List<DropdownItemModel> costCenter3;
  final List<DropdownItemModel> costCenter4;
  final List<TaxModel> taxes;
  final List<DropdownItemModel> accounts;
  final List<DropdownItemModel> cashAccounts;
  final List<CurrencyModel> currencies;
  final List<VoucherModel> vouchers;

  PettyCashVoucherDropdownsDataModel({
    required this.costCenter1,
    required this.costCenter2,
    required this.costCenter3,
    required this.costCenter4,
    required this.cashAccounts,
    required this.taxes,
    required this.accounts,
    required this.currencies,
    required this.vouchers,
  });

  factory PettyCashVoucherDropdownsDataModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      PettyCashVoucherDropdownsDataModel(
        costCenter1: List<DropdownItemModel>.from(
          json['cc1'].map((x) => DropdownItemModel.fromJson(x)),
        ),
        costCenter2: List<DropdownItemModel>.from(
          json['cc2'].map((x) => DropdownItemModel.fromJson(x)),
        ),
        costCenter3: List<DropdownItemModel>.from(
          json['cc3'].map((x) => DropdownItemModel.fromJson(x)),
        ),
        costCenter4: List<DropdownItemModel>.from(
          json['cc4'].map((x) => DropdownItemModel.fromJson(x)),
        ),
        cashAccounts: List<DropdownItemModel>.from(
          json['cashAccounts'].map((x) => DropdownItemModel.fromJson(x)),
        ),
        taxes: List<TaxModel>.from(
          json['taxes'].map((x) => TaxModel.fromJson(x)),
        ),
        accounts: List<DropdownItemModel>.from(
          json['accounts'].map((x) => DropdownItemModel.fromJson(x)),
        ),
        currencies: List<CurrencyModel>.from(
          json['currencies'].map((x) => CurrencyModel.fromJson(x)),
        ),
        vouchers: List<VoucherModel>.from(
          json['vouchers'].map((x) => VoucherModel.fromJson(x)),
        ),
      );
}
