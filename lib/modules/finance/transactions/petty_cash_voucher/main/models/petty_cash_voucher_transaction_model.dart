class PettyCashVoucherTransactionModel {
  int? recordId;
  String? acCode;
  String? acName;
  double? debit;
  int? taxCode;
  double? vAT;
  double? total;
  String? narration;
  String? costCenter1;
  String? costCenter2;
  String? costCenter3;
  String? costCenter4;
  String? costCenter5;
  String? costCenter6;
  String? voucherNo;
  String? postingId;

  PettyCashVoucherTransactionModel({
    this.recordId,
    this.acCode,
    this.acName,
    this.debit,
    this.taxCode,
    this.vAT,
    this.total,
    this.narration,
    this.costCenter1,
    this.costCenter2,
    this.costCenter3,
    this.costCenter4,
    this.costCenter5,
    this.costCenter6,
    this.voucherNo,
    this.postingId,
  });

  factory PettyCashVoucherTransactionModel.fromJson(Map<String, dynamic> json) {
    return PettyCashVoucherTransactionModel(
      recordId: json['recordId'],
      voucherNo: json['voucherNo'],
      postingId: json['postingID'],
      acCode: json['acCode'],
      acName: json['acName'],
      debit: json['debit'],
      taxCode: json['taxCode'],
      vAT: json['vAT'],
      total: json['total'],
      narration: json['narration'],
      costCenter1: json['costCenter1'],
      costCenter2: json['costCenter2'],
      costCenter3: json['costCenter3'],
      costCenter4: json['costCenter4'],
      costCenter5: json['costCenter5'],
      costCenter6: json['costCenter6'],
    );
  }
}
