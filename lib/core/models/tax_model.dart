import 'package:qfinity/export.dart';

class TaxModel extends BaseDropdownItemModel {
  TaxModel({
    required this.recordId,
    required this.description,
    required this.rate,
    required this.salesTaxRate,
    required this.vatAcCode,
    required this.stAcCode,
    required this.fromDate,
  }) : super(id: recordId.toString(), name: description);

  final int recordId;
  final String description;
  final double rate;
  final double salesTaxRate;
  final String vatAcCode;
  final String stAcCode;
  final DateTime fromDate;

  factory TaxModel.fromJson(Map<String, dynamic> json) => TaxModel(
        recordId: json['recordId'],
        description: json['description'],
        rate: json['rate'],
        salesTaxRate: json['salesTaxRate'],
        vatAcCode: json['vATAcCode'],
        stAcCode: json['sTAcCode'],
        fromDate: DateTime.parse(json['fromDate']),
      );

  factory TaxModel.defaultTax() => TaxModel(
        recordId: 0,
        description: 'None',
        vatAcCode: '',
        rate: 0,
        stAcCode: '',
        salesTaxRate: 0,
        fromDate: DateTime.now(),
      );
}
