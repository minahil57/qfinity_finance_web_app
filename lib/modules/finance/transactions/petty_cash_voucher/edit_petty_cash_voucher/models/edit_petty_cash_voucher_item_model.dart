import 'package:qfinity/export.dart';

class EditPettyCashVoucherItemModel extends BaseVoucherItemModel {
  EditPettyCashVoucherItemModel({
    super.recordId,
    super.taxCode,
    super.taxName,
    super.amount,
    super.vat,
    super.total,
    super.narration,
    super.costCenter1,
    super.costCenter2,
    super.costCenter3,
    super.costCenter4,
    this.accountCode,
    this.accountName,
    this.amountCredit,
    this.conRate,
    this.conAmount,
  });

  String? accountCode;
  String? accountName;
  double? amountCredit;
  double? conRate;
  double? conAmount;

  Map<String, dynamic> toJson() => {
        'recordId': recordId,
        'accountCode': accountCode,
        'accountName': accountName,
        'taxCode': taxCode,
        'amountCredit': amountCredit,
        'amountDebit': amount,
        'vat': vat,
        'total': total,
        'conRate': conRate,
        'conAmount': conAmount,
        'narration': narration,
        'costCenter1': costCenter1,
        'costCenter2': costCenter2,
        'costCenter3': costCenter3,
        'costCenter4': costCenter4,
      };
}
