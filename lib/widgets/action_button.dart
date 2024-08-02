import 'package:qfinity/export.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.bgColor,
    required this.text,
    required this.icon,
  });

  final void Function()? onPressed;
  final Color bgColor;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      elevation: 0,
      borderRadiusAll: AppStyle.buttonRadius.medium,
      backgroundColor: bgColor,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 70),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: Colors.white,
            ),
            MySpacing.width(5),
            MyText.bodySmall(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
