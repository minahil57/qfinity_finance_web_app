class PettyCashVoucherMainModel {
  int? recordId;
  String? postingId;
  String? voucherNo;
  int? voucherSerialNo;
  String? voucherType;
  DateTime? postingDate;
  String? postingType;
  String? refNo;
  DateTime? refDate;
  String? invoiceNo;
  DateTime? invoiceDate;
  String? accountCode;
  String? accountName;
  double? amountCredit;
  double? amountDebit;
  String? currency;
  double? conversionRate;
  double? convertedAmount;
  String? commonNarration;
  String? transactionMethod;
  String? chequeNo;
  DateTime? chequeDate;
  String? paidTo;
  String? costCenter1;
  String? costCenter2;
  String? costCenter3;
  String? costCenter4;
  String? financialYear;
  DateTime? transactionDate;
  String? postingLineAccountCode;
  double? balance;
  int? taxCode;

  PettyCashVoucherMainModel({
    this.recordId,
    this.postingId,
    this.voucherNo,
    this.voucherSerialNo,
    this.voucherType,
    this.postingDate,
    this.postingType,
    this.refNo,
    this.refDate,
    this.invoiceNo,
    this.invoiceDate,
    this.accountCode,
    this.accountName,
    this.amountCredit,
    this.amountDebit,
    this.convertedAmount,
    this.currency,
    this.transactionMethod,
    this.transactionDate,
    this.chequeNo,
    this.chequeDate,
    this.conversionRate,
    this.costCenter1,
    this.costCenter2,
    this.costCenter3,
    this.costCenter4,
    this.commonNarration,
    this.financialYear,
    this.paidTo,
    this.postingLineAccountCode,
    this.taxCode,
    this.balance,
  });

  factory PettyCashVoucherMainModel.fromJson(Map<String, dynamic> json) => PettyCashVoucherMainModel(
        recordId: json['record_Id'],
        postingId: json['postingID'],
        voucherNo: json['voucherNo'],
        voucherSerialNo: json['voucherSerialNo'],
        voucherType: json['voucherType'],
        postingDate: json['postingDate'] == null || json['postingDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['postingDate']),
        postingType: json['postingType'],
        refNo: json['refNo'],
        refDate: json['refDate'] == null || json['refDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['refDate']),
        invoiceNo: json['invoiceNo'],
        invoiceDate: json['invoiceDate'] == null || json['invoiceDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['invoiceDate']),
        accountCode: json['accountCode'],
        accountName: json['accountName'],
        amountCredit: json['amountCredit'],
        amountDebit: json['amountDebit'],
        convertedAmount: json['convertedAmount'],
        currency: json['currency'],
        transactionMethod: json['transactionMethod'],
        transactionDate: json['transactionDate'] == null || json['transactionDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['transactionDate']),
        chequeNo: json['chequeNo'],
        chequeDate: json['chequeDate'] == null || json['chequeDate'] == '1900-01-01T00:00:00'
            ? null
            : DateTime.parse(json['chequeDate']),
        conversionRate: json['conversionRate'],
        costCenter1: json['costCenter1'],
        costCenter2: json['costCenter2'],
        costCenter3: json['costCenter3'],
        costCenter4: json['costCenter4'],
        commonNarration: json['commonNarration'],
        financialYear: json['financialYear'],
        paidTo: json['paidTo'],
        postingLineAccountCode: json['postingLineAccountCode'],
        taxCode: json['taxCode'],
        balance: json['balance'],
      );
}
