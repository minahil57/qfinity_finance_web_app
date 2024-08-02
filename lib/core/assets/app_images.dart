import 'package:qfinity/export.dart';

class AppImages {
  static String qfinityLogo = 'assets/images/Qfinity_Logo.png';
  static String qfinityFullLogo = 'assets/images/Qfinity_Full_Logo.png';
  static String greyAvatar = 'assets/images/grey_avatar.jpg';
  static String dashboard = 'assets/images/dashboard.jpg';
  static String login = 'assets/images/login.jpg';
  static String forgetPassword = 'assets/images/forget_password.jpg';
  static String resetPassword = 'assets/images/reset_password.jpg';
  static String createAccount = 'assets/images/create_account.jpg';

  static List<String> avatars = List.generate(
    12,
    (index) => 'assets/images/avatar/avatar-${index + 1}.jpg',
  );

  static String randomImage(List<String> images) {
    return images[Random().nextInt(images.length)];
  }
}
