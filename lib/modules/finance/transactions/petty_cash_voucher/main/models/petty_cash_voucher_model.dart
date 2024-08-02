class PettyCashVoucherModel {
  String? voucherNo;
  String? postingId;
  int? voucherSerialNo;
  String? postingType;
  int? postingMonth;
  String? refNo;
  DateTime? refDate;
  String? accountCode;
  String? accountName;
  double? amountCredit;
  double? amountDebit;
  String? transactionMethod;
  DateTime? transactionDate;
  DateTime? postingDate;
  String? createdBy;
  DateTime? createdOn;
  String? costCenter1;
  String? costCenter2;
  String? costCenter3;
  String? costCenter4;
  String? voucherType;
  bool? isApproved;

  PettyCashVoucherModel({
    this.voucherNo,
    this.postingId,
    this.voucherSerialNo,
    this.postingType,
    this.postingMonth,
    this.refNo,
    this.refDate,
    this.accountCode,
    this.accountName,
    this.amountCredit,
    this.amountDebit,
    this.transactionMethod,
    this.transactionDate,
    this.postingDate,
    this.createdBy,
    this.createdOn,
    this.costCenter1,
    this.costCenter2,
    this.costCenter3,
    this.costCenter4,
    this.voucherType,
    this.isApproved,
  });

  factory PettyCashVoucherModel.fromJson(Map<String, dynamic> json) => PettyCashVoucherModel(
        voucherNo: json['voucherNo'],
        postingId: json['postingId'],
        voucherSerialNo: json['voucherSerialNo'],
        postingType: json['postingType'],
        postingMonth: json['postingMonth'],
        refNo: json['refNo'],
        refDate: json['refDate'] == null || json['refDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['refDate']),
        accountCode: json['accountCode'],
        accountName: json['accountName'],
        amountCredit: json['amountCredit'],
        amountDebit: json['amountDebit'],
        transactionMethod: json['transactionMethod'],
        transactionDate: json['transactionDate'] == null || json['transactionDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['transactionDate']),
        postingDate: json['postingDate'] == null || json['postingDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['postingDate']),
        createdBy: json['createdBy'],
        createdOn: json['createdOn'] == null || json['createdOn'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['createdOn']),
        costCenter1: json['costCenter1'],
        costCenter2: json['costCenter2'],
        costCenter3: json['costCenter3'],
        costCenter4: json['costCenter4'],
        voucherType: json['voucherType'],
        isApproved: json['isApproved'],
      );
}
