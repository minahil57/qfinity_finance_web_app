import 'package:qfinity/export.dart';

class ChangePasswordController extends BaseController {
  FormValidator basicValidator = FormValidator();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    basicValidator
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

  Future<void> onChangePassword() async {
    if (basicValidator.validateForm()) {
      if (basicValidator.getData()['password'] != basicValidator.getData()['confirmPassword']) {
        Snackbars.error('Passwords do not match.');
        return;
      }

      loading = true;
      update();
      var response = await AuthRepository.changePassword({
        'newPassword': basicValidator.getData()['password'],
      });
      if (response['error'] == null) {
        basicValidator.getController('password')!.text = '';
        basicValidator.getController('confirmPassword')!.text = '';

        Snackbars.success(response['data']);
        await AuthRepository.removeRememberMe();
        Get.offAllNamed(Routes.login);
      } else {
        Snackbars.error(response['error']);
      }

      loading = false;
      update();
    }
    {
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
