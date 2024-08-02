import 'package:qfinity/export.dart';

class CreateCompanyAccountController extends BaseController {
  FormValidator basicValidator = FormValidator();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool showPassword = false;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    basicValidator
      ..addField(
        'fullName',
        required: true,
        label: 'Full Name',
        validators: [LengthValidator(min: 3, max: 80)],
        controller: TextEditingController(),
      )
      ..addField(
        'companyName',
        required: true,
        label: 'Company Name',
        validators: [LengthValidator(min: 3, max: 80)],
        controller: TextEditingController(),
      )
      ..addField(
        'contactNo',
        required: true,
        label: 'Contact Number',
        validators: [PhoneNumberValidator()],
        controller: TextEditingController(),
      )
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
        validators: [LengthValidator(min: 6, max: 50)],
        controller: TextEditingController(),
      );
  }

  Future<void> onCreateCompanyAccount() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var response = await AuthRepository.createCompanyAccount(basicValidator.getData());
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

  void goToLogin() {
    Get.offNamed(Routes.login);
  }

  @override
  void onClose() {
    basicValidator.disposeControllers();
    super.onClose();
  }
}
