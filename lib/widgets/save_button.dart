import 'package:qfinity/export.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: onPressed,
      bgColor: UIConstants.contentTheme.primary,
      text: 'Save',
      icon: Icons.save,
    );
  }
}
