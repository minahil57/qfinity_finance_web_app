import 'package:qfinity/export.dart';

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({
    super.key,
    required this.isShown,
    required this.onTap,
  });

  final bool isShown;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        isShown ? FontAwesomeIcons.lightEye : FontAwesomeIcons.lightEyeSlash,
        size: 16,
      ),
    );
  }
}
