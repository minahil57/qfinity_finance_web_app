import 'package:qfinity/export.dart';

extension VoucherCountExt on List<VoucherCountModel> {
  int countOfOrZeroIfAbsent(VoucherType voucherType) {
    return firstWhereOrNull(
          (e) => e.voucherType == voucherType.apiName,
        )?.count ??
        0;
  }
}
