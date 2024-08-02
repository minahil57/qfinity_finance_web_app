class VoucherCountModel {
  VoucherCountModel({
    this.voucherType,
    this.count,
  });

  final String? voucherType;
  final int? count;

  factory VoucherCountModel.fromJson(Map<String, dynamic> json) => VoucherCountModel(
        voucherType: json['voucherType'],
        count: json['count'],
      );
}
