import 'package:qfinity/export.dart';

class ResetPasswordController extends BaseController {
  late final int userId;
  FormValidator basicValidator = FormValidator();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    userId = Get.arguments['userId'];
    basicValidator
      ..addField(
        'otp',
        required: true,
        label: 'OTP',
        validators: [OTPValidator()],
        controller: TextEditingController(),
      )
      ..addField(
        'password',
        label: 'Password',
        required: true,
        validators: [LengthValidator(min: 6, max: 50)],
        controller: TextEditingController(),
      )
      ..addField(
        'confirmPassword',
        required: true,
        label: 'Confirm password',
        validators: [LengthValidator(min: 6, max: 50)],
        controller: TextEditingController(),
      );
  }

  Future<void> onResetPassword() async {
    if (basicValidator.validateForm()) {
      if (basicValidator.getData()['password'] != basicValidator.getData()['confirmPassword']) {
        Snackbars.error('Passwords do not match.');
        return;
      }

      loading = true;
      update();
      var response = await AuthRepository.resetPassword({
        'userId': userId,
        'otp': basicValidator.getData()['otp'],
        'newPassword': basicValidator.getData()['password'],
      });
      if (response['error'] == null) {
        Snackbars.success(response['data']);
        await AuthRepository.removeRememberMe();
        Get.offAllNamed(Routes.login);
      } else {
        Snackbars.error(response['error']);
      }

      loading = false;
      update();
    } else {
      autovalidateMode = AutovalidateMode.always;
      update();
    }
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangeShowConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
    update();
  }

  @override
  void onClose() {
    basicValidator.disposeControllers();
    super.onClose();
  }
}
