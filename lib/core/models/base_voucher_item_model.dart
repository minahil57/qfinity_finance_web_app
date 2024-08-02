class BaseVoucherItemModel {
  BaseVoucherItemModel({
    this.recordId,
    this.taxCode,
    this.taxName,
    this.amount,
    this.vat,
    this.total,
    this.narration,
    this.costCenter1,
    this.costCenter2,
    this.costCenter3,
    this.costCenter4,
  });

  int? recordId;
  int? taxCode;
  String? taxName;
  double? amount;
  double? vat;
  double? total;
  String? narration;
  String? costCenter1;
  String? costCenter2;
  String? costCenter3;
  String? costCenter4;
}
