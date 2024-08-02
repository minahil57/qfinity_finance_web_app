import 'package:qfinity/export.dart';

class AddNewRowButton extends StatelessWidget {
  const AddNewRowButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: onPressed,
      bgColor: UIConstants.contentTheme.success,
      text: 'Add New Row',
      icon: Icons.add,
    );
  }
}
