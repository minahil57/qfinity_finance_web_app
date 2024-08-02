import 'package:qfinity/export.dart';

class EmailValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (!required) {
      if (value == null) {
        return null;
      } else if (value.isNotEmpty) {
        if (!StringUtils.isEmail(value)) {
          return 'Please enter a valid email address';
        }
      }
    } else if (value != null && value.isNotEmpty) {
      if (!StringUtils.isEmail(value)) {
        return 'Please enter a valid email address';
      }
    }
    return null;
  }
}

class LengthValidator implements FieldValidatorRule<String> {
  final bool short;
  final bool required;
  final int? min;
  final int? max;
  final int? exact;

  LengthValidator({
    this.short = false,
    this.required = true,
    this.min,
    this.max,
    this.exact,
  });

  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (value != null) {
      if (!required && value.isEmpty) {
        return null;
      }
      if (exact != null && value.length != exact!) {
        return short ? 'Need $exact characters' : 'Need exact $exact characters';
      }
      if (min != null && value.length < min!) {
        return short ? 'Need $min characters' : 'Longer than $min characters';
      }
      if (max != null && value.length > max!) {
        return short ? 'Only $max characters' : 'Lesser than $max characters';
      }
    }
    return null;
  }
}

class PhoneNumberValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (!required) {
      if (value == null) {
        return null;
      }
    } else if (value != null && value.isNotEmpty) {
      if (!StringUtils.isPhoneNumber(value)) {
        return 'Please enter a valid phone number';
      }
    }
    return null;
  }
}

// 6 digits OTP validator
class OTPValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (!required) {
      if (value == null) {
        return null;
      }
    } else if (value != null && value.isNotEmpty) {
      if (!StringUtils.isOTP(value)) {
        return 'Please enter a valid 6 digits OTP.';
      }
    }
    return null;
  }
}

// PositiveNumberValidator

class PositiveNumberValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (!required) {
      if (value == null) {
        return null;
      }
    } else if (value != null && value.isNotEmpty) {
      if (!StringUtils.isPositiveDecimalNumber(value)) {
        return 'Please enter a valid number';
      }
    }
    return null;
  }
}

class PositiveNumberWithTwoDigitsDecimalPointValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (!required) {
      if (value == null) {
        return null;
      }
    } else if (value != null && value.isNotEmpty) {
      if (!StringUtils.isPositiveNumberWithTwoDigitsDecimalPoint(value)) {
        return 'Please enter a valid number';
      }
    }
    return null;
  }
}

class PositiveNumberWithFourDigitsDecimalPointValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (!required) {
      if (value == null) {
        return null;
      }
    } else if (value != null && value.isNotEmpty) {
      if (!StringUtils.isPositiveNumberWithFourDigitsDecimalPoint(value)) {
        return 'Please enter a valid number';
      }
    }
    return null;
  }
}

class EmptyStringValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (required && (value == null || value.trim().isEmpty)) {
      return 'Field cannot be empty';
    }
    return null;
  }
}

class ThreeCharactersLengthValidator implements FieldValidatorRule<String> {
  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (value != null && value.isNotEmpty) {
      if (!StringUtils.isThreeCharactersLength(value)) {
        return 'Please enter 3 characters';
      }
    }
    return null;
  }
}

class MaxLengthValidator implements FieldValidatorRule<String> {
  final int maxLength;

  MaxLengthValidator(this.maxLength);

  @override
  String? validate(String? value, bool required, Map<String, dynamic> data) {
    if (value != null && value.isNotEmpty) {
      if (!StringUtils.isMoreThanCertainCharactersLength(value, maxLength)) {
        return 'Maximum $maxLength characters allowed';
      }
    }
    return null;
  }
}
