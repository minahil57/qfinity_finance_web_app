import 'package:qfinity/export.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: onPressed,
      bgColor: UIConstants.contentTheme.primary,
      text: 'Add',
      icon: Icons.add,
    );
  }
}
