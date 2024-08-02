import 'package:qfinity/export.dart';

class ButtonWithLoadingOnAction extends StatelessWidget {
  const ButtonWithLoadingOnAction({
    super.key,
    required this.text,
    this.onPressed,
    required this.isLoading,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MyButton.rounded(
      onPressed: isLoading ? () {} : onPressed,
      elevation: 0,
      padding: MySpacing.xy(20, 16),
      backgroundColor: UIConstants.contentTheme.primary,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading)
            SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                color: theme.colorScheme.onPrimary,
                strokeWidth: 1.2,
              ),
            )
          else
            Container(),
          if (isLoading) MySpacing.width(16),
          MyText.bodySmall(
            text,
            color: UIConstants.contentTheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
