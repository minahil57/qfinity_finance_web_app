import 'package:qfinity/export.dart';

class EditProfileController extends GetxController {
  final FormValidator basicValidator = FormValidator();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool loading = false;

  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  /// Image.file(imageFile) doesn't work on web
  /// so we need to convert it to Uint8List
  /// and use Image.memory(imageBytes) instead.
  ///
  /// Alternatively, we can use Image.network(pickedFile.path) on web
  /// and Image.file(imageFile) on other platforms.
  Uint8List imageBytes = Uint8List(0);

  LoginModel loginModel = AccountRepository.getLoginModel;

  @override
  void onInit() {
    super.onInit();
    basicValidator
      ..addField(
        'fullName',
        required: true,
        label: 'Full Name',
        validators: [LengthValidator(min: 3, max: 80)],
        controller: TextEditingController(text: loginModel.fullName ?? ''),
      )
      ..addField(
        'email',
        required: true,
        label: 'Email',
        validators: [EmailValidator()],
        controller: TextEditingController(text: loginModel.email ?? ''),
      )
      ..addField(
        'contactNo',
        required: true,
        label: 'Contact Number',
        validators: [PhoneNumberValidator()],
        controller: TextEditingController(text: loginModel.contactNo ?? ''),
      );
  }

  Future<void> pickImage() async {
    imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    imageBytes = await imageFile!.readAsBytes();
    debugPrint('imageFile!.path --------------------->>> ${imageFile!.path}');
    update();
  }

  Future<void> onSave() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      try {
        String? profileImage;
        if (imageFile != null) {
          profileImage = await _uploadProfileImage();
        }
        var response = await AccountRepository.updateUserDetails(
          {
            'id': loginModel.id,
            'profileImage': profileImage ?? loginModel.profileImage?.split('/').last ?? '',
            ...basicValidator.getData(),
          },
        );
        if (response != null) {
          loginModel = response;
          await AuthRepository.refreshLoginData(response);
          Get.find<StarterController>().getLoginModel();
          Snackbars.success('Profile updated successfully');
          loading = false;
          update();
        } else {
          Snackbars.error('Something went wrong');
        }
      } on Exception {
        Snackbars.error('Something went wrong');
      }

      loading = false;
      update();
    } else {
      autovalidateMode = AutovalidateMode.always;
      update();
    }
  }

  Future<String?> _uploadProfileImage() async {
    var response = await AccountRepository.uploadToUserProfile(
      files: [imageFile!],
    );
    if (response.isNotEmpty) {
      return response[0];
    } else {
      return null;
    }
  }

  @override
  void onClose() {
    basicValidator.disposeControllers();
    super.onClose();
  }
}
