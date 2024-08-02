import 'package:qfinity/export.dart';

class GreyAvatar extends StatelessWidget {
  const GreyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.greyAvatar,
      fit: BoxFit.cover,
    );
  }
}
