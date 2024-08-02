import 'package:qfinity/export.dart';

class VoucherModel extends BaseDropdownItemModel {
  const VoucherModel({
    required this.voucherNo,
    required this.voucherSerialNo,
  }) : super(
          id: voucherSerialNo,
          name: voucherNo,
        );

  final String voucherSerialNo;
  final String voucherNo;

  // from json
  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        voucherNo: json['voucherNo'],
        voucherSerialNo: json['voucherSerialNo'].toString(),
      );

  factory VoucherModel.allItem() => const VoucherModel(
        voucherNo: 'All',
        voucherSerialNo: 'All',
      );
}
