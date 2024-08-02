import 'package:qfinity/export.dart';

class OkButton extends StatelessWidget {
  const OkButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      elevation: 0,
      borderRadiusAll: AppStyle.buttonRadius.medium,
      backgroundColor: UIConstants.contentTheme.primary,
      child: const MyText.bodySmall(
        'Ok',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
