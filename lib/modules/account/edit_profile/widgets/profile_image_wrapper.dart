import 'package:qfinity/export.dart';

class ProfileImageWrapper extends StatelessWidget {
  const ProfileImageWrapper({
    super.key,
    required this.child,
    this.height = 150,
    this.width = 150,
  });

  final Widget child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MyContainer.rounded(
      height: height,
      width: width,
      paddingAll: 0,
      child: child,
    );
  }
}
