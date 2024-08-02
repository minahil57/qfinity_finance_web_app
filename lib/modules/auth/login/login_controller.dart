import 'package:qfinity/export.dart';

class LoginController extends BaseController {
  FormValidator basicValidator = FormValidator();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool showPassword = false;
  bool loading = false;
  bool isChecked = false;

  @override
  void onInit() {
    super.onInit();
    basicValidator
      ..addField(
        'email',
        required: true,
        label: 'Email',
        validators: [EmailValidator()],
        controller: TextEditingController(),
      )
      ..addField(
        'password',
        required: true,
        label: 'Password',
        validators: [LengthValidator(min: 6, max: 50)],
        controller: TextEditingController(),
      );

    _getRememberMe();
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangeCheckBox(bool? value) {
    isChecked = value ?? isChecked;
    update();
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var response = await AuthRepository.loginUser(basicValidator.getData());
      if (response == null) {
        await _setRememberMe();
        Get.offAllNamed(Routes.dashboard);
      } else {
        Snackbars.error(response);
      }
      loading = false;
      update();
    } else {
      autovalidateMode = AutovalidateMode.always;
      update();
    }
  }

  void goToForgotPassword() {
    Get.toNamed(Routes.forgetPassword);
  }

  void goToRegister() {
    Get.offNamed(Routes.createCompanyAccount);
  }

  Future<void> _setRememberMe() async {
    await AuthRepository.setRememberMe(
      email: basicValidator.getController('email')!.text,
      password: basicValidator.getController('password')!.text,
      isChecked: isChecked,
    );
  }

  void _getRememberMe() {
    var (email, password, rememberMeChecked) = AuthRepository.getRememberMe();
    if (rememberMeChecked && email != null && password != null) {
      basicValidator.getController('email')!.text = email;
      basicValidator.getController('password')!.text = password;
      isChecked = true;
    }
  }

  @override
  void onClose() {
    basicValidator.disposeControllers();
    super.onClose();
  }
}
