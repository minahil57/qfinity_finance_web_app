import 'package:qfinity/export.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: onPressed,
      bgColor: UIConstants.contentTheme.primary,
      text: 'Update',
      icon: Icons.update,
    );
  }
}
