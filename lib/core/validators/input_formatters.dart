import 'package:qfinity/export.dart';

abstract final class InputFormatters {
  static List<TextInputFormatter> get positiveDecimalNumber {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,}')),
    ];
  }

  static List<TextInputFormatter> get positiveNumberWithTwoDigitsDicimalPoint {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
    ];
  }

  static List<TextInputFormatter> get positiveNumberWithFourDigitsDicimalPoint {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
    ];
  }

  static List<TextInputFormatter> get positiveNumberFromZeroToHundredInclusiveWithTwoDigitsDicimalPoint {
    return [
      FilteringTextInputFormatter.allow(
        RegExp(r'^\d{0,2}(\.\d{0,2})?$|^100(\.0{0,2})?$'),
      ),
    ];
  }

  static List<TextInputFormatter> get positiveNumberFromZeroToHundredInclusiveWithFourDigitsDicimalPoint {
    return [
      FilteringTextInputFormatter.allow(
        RegExp(r'^\d{0,2}(\.\d{0,4})?$|^100(\.0{0,4})?$'),
      ),
    ];
  }

  static List<TextInputFormatter> get threeCharactersLength {
    return [
      LengthLimitingTextInputFormatter(3),
    ];
  }
}
