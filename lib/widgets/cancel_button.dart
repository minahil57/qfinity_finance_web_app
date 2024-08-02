import 'package:qfinity/export.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: onPressed,
      bgColor: UIConstants.contentTheme.danger,
      text: 'Cancel',
      icon: Icons.cancel,
    );
  }
}
