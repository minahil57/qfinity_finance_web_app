import 'package:qfinity/export.dart';

class ForgetPasswordController extends BaseController {
  FormValidator basicValidator = FormValidator();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool showPassword = false;
  bool loading = false;

  List<bool> selectedOtpMethod = [true, false, false];

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField(
      'email',
      required: true,
      label: 'Email',
      validators: [EmailValidator()],
      controller: TextEditingController(),
    );
  }

  Future<void> onForgetPassword() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var response = await AuthRepository.forgetPassword({
        'email': basicValidator.getData()['email'],
        'contactNo': basicValidator.getData()['phoneNumber'] ?? basicValidator.getData()['whatsappNumber'],
        'sendByEmail': selectedOtpMethod[0],
        'sendBySMS': selectedOtpMethod[1],
        'sendByWhatsapp': selectedOtpMethod[2],
      });
      if (response['error'] == null) {
        Snackbars.success(
          'OTP was sent to you successfully\nPlease check your inbox.',
        );

        Get.toNamed(
          Routes.resetPassword,
          arguments: {'userId': response['data']},
        );
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

  void goToLogIn() {
    Get.back();
  }

  void onSelectOtpMethod(int index) {
    selectedOtpMethod = [false, false, false];
    selectedOtpMethod[index] = true;
    basicValidator = FormValidator();
    if (index == 0) {
      basicValidator
        ..removeAllFields()
        ..addField(
          'email',
          required: true,
          label: 'Email',
          validators: [EmailValidator()],
          controller: TextEditingController(),
        );
    } else if (index == 1) {
      basicValidator
        ..removeAllFields()
        ..addField(
          'phoneNumber',
          label: 'Phone Number',
          required: true,
          validators: [PhoneNumberValidator()],
          controller: TextEditingController(),
        );
    } else if (index == 2) {
      basicValidator
        ..removeAllFields()
        ..addField(
          'whatsappNumber',
          label: 'Whatsapp Number',
          required: true,
          validators: [PhoneNumberValidator()],
          controller: TextEditingController(),
        );
    }
    update();
  }

  @override
  void onClose() {
    basicValidator.disposeControllers();
    super.onClose();
  }
}
