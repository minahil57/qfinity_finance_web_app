import 'package:qfinity/export.dart';

class FormValidator {
  Map<String, dynamic> errors = {};
  Map<String, dynamic> remainingError = {};
  GlobalKey<FormState> formKey = GlobalKey();
  bool consumeError = true;

  final Map<String, dynamic> _validators = {};
  final Map<String, TextEditingController> _controllers = {};

  void addField<T>(
    String name, {
    bool required = false,
    List<FieldValidatorRule<T>> validators = const [],
    String? label,
    TextEditingController? controller,
  }) {
    _validators[name] = _createValidation<T>(
      name,
      required: required,
      validators: validators,
      label: label,
    );
    if (controller != null) {
      _controllers[name] = controller;
    }
  }

  FieldValidator<T>? getValidation<T>(String name) =>
      _validators[name] != null ? _validators[name] as FieldValidator<T> : null;

  TextEditingController? getController(String name) => _controllers[name];

  FieldValidator<T> _createValidation<T>(
    String name, {
    bool required = false,
    List<FieldValidatorRule<T>> validators = const [],
    String? label,
  }) {
    return (T? value) {
      label ??= name.capitalize;
      String? error = getError(name);
      if (error != null) {
        return error;
      }

      if (required && (value == null || (value.toString().isEmpty))) {
        return '$label is required';
      }
      for (final FieldValidatorRule validator in validators) {
        String? validationError = validator.validate(value, required, getData());
        if (validationError != null) {
          return validationError;
        }
      }
      return null;
    };
  }

  String? getError(String name) {
    if (errors.containsKey(name)) {
      dynamic error = errors[name];

      if (error is List && error.isNotEmpty) {
        String errorText = error[0].toString();
        if (consumeError) {
          remainingError.remove(name);
        }
        return errorText;
      } else {
        String errorText = error.toString();
        if (consumeError) {
          remainingError.remove(name);
        }
        return errorText;
      }
    }
    return null;
  }

  bool validateForm({bool clear = false, bool consumeError = true}) {
    if (clear) {
      errors.clear();
      remainingError.clear();
    }
    this.consumeError = consumeError;

    return formKey.currentState?.validate() ?? false;
  }

  Map<String, dynamic> getData() {
    final Map<String, dynamic> map = {};
    for (final key in _controllers.keys) {
      if (_controllers[key]?.text != null) {
        map[key] = _controllers[key]!.text;
      }
    }

    return map;
  }

  void removeAllFields() {
    _validators.clear();
    _controllers.clear();
    errors.clear();
  }

  void disposeControllers() {
    _controllers.forEach((key, value) {
      value.dispose();
    });
  }
}
