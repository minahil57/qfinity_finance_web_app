import 'package:qfinity/export.dart';

class EditPettyCashVoucherModel {
  String? invoiceNo;
  DateTime? postingDate;
  String? currency;

  String? paidTo;
  String? refNo;
  String? accountCode;
  String? accountName;
  String? vatAccountCode;
  String? costCenter1;
  String? costCenter2;
  String? costCenter3;
  String? costCenter4;
  double? creditAmount;
  double? conRate;
  double? conAmount;
  String? narration;
  String? financialYear;

  int? taxCode;
  bool? taxInclusive;
  String? createdBy;
  DateTime? createdOn;
  List<EditPettyCashVoucherItemModel>? voucherItems;
  List<AttachmentModel>? voucherAttachments;
  String? postingId;
  String? voucherNo;
  String? voucherSerialNo;
  String? postingType;
  List<DeletedAttachmentModel>? deletedAttachments;

  EditPettyCashVoucherModel({
    this.invoiceNo,
    this.postingDate,
    this.currency,
    this.paidTo,
    this.refNo,
    this.accountCode,
    this.accountName,
    this.vatAccountCode,
    this.costCenter1,
    this.costCenter2,
    this.costCenter3,
    this.costCenter4,
    this.creditAmount,
    this.conRate,
    this.conAmount,
    this.taxCode,
    this.taxInclusive,
    this.narration,
    this.financialYear,
    this.createdBy,
    this.createdOn,
    this.voucherItems,
    this.voucherAttachments,
    this.postingId,
    this.voucherSerialNo,
    this.postingType,
    this.voucherNo,
    this.deletedAttachments,
  });

  Map<String, dynamic> toJson() {
    return {
      'invoiceNo': invoiceNo ?? '',
      'postingDate': postingDate?.toIso8601String() ?? '',
      'currency': currency ?? '',
      'paidTo': paidTo ?? '',
      'refNo': refNo ?? '',
      'accountCode': accountCode ?? '',
      'accountName': accountName ?? '',
      'vatAccountCode': vatAccountCode ?? '',
      'creditAmount': creditAmount,
      'conRate': conRate,
      'conAmount': conAmount,
      'narration': narration ?? '',
      'financialYear': financialYear ?? '',
      'taxCode': taxCode,
      'taxInclusive': taxInclusive,
      'costCenter1': costCenter1 ?? '',
      'costCenter2': costCenter2 ?? '',
      'costCenter3': costCenter3 ?? '',
      'costCenter4': costCenter4 ?? '',
      'createdBy': createdBy ?? '',
      'createdOn': createdOn?.toIso8601String() ?? '',
      'voucherItems': voucherItems?.map((item) => item.toJson()).toList(),
      'voucherAttachments': voucherAttachments?.map((attachment) => attachment.toJson()).toList(),
      'postingId': postingId ?? '',
      'voucherNo': voucherNo ?? '',
      'voucherSerialNo': voucherSerialNo ?? '',
      'postingType': postingType ?? '',
      'deletedAttachments': deletedAttachments?.map((del) => del.toJson()).toList(),
    };
  }
}
