import 'package:qfinity/export.dart';

class FilterActionButton extends StatelessWidget {
  const FilterActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.iconData,
    required this.backgroundColor,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData iconData;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      elevation: 1,
      padding: MySpacing.xy(20, 18),
      backgroundColor: backgroundColor,
      borderRadiusAll: AppStyle.buttonRadius.medium,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 15,
            color: UIConstants.contentTheme.light,
          ),
          MySpacing.width(8),
          MyText.bodySmall(
            text,
            color: UIConstants.contentTheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
