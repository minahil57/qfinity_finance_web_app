import 'package:qfinity/export.dart';

abstract final class Snackbars {
  static void success(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void error(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void somethingWentWrong() {
    error('Something went wrong');
  }

  static void expiredSession() {
    error('Your session has expired, please login again');
  }

  static void warning(String message) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AdminTheme.theme.contentTheme.secondary,
      colorText: Colors.white,
      titleText: const SizedBox.shrink(),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  static void warningWithTitle(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AdminTheme.theme.contentTheme.secondary,
      colorText: Colors.white,
    );
  }
}
