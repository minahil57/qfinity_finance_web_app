import 'package:qfinity/export.dart';

class AccountRepository {
  static Future<LoginModel?> updateUserDetails(
    Map<String, dynamic> data,
  ) async {
    try {
      var response = await ApiProvider.accounts.updateUserDetails(data: data);

      if (response.statusCode == 200 && response.data['status'] == true) {
        var loginModel = LoginModel.fromJson(response.data['data']);
        await LocalStorage.setLoginModel(loginModel);
        return loginModel;
      } else if (response.statusCode == 400) {
        return null;
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  static Future<List<String>> uploadToUserProfile({
    required List<XFile> files,
  }) async {
    return ApiProvider.uploads.uploadToUserProfile(files: files);
  }

  static LoginModel get getLoginModel {
    var loginModel = LocalStorage.getLoginModel();
    return loginModel!;
  }

  static String? get userName {
    return getLoginModel.userName;
  }
}
