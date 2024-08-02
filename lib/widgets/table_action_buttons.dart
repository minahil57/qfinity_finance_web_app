import 'package:qfinity/export.dart';

class TableActionButtons extends StatelessWidget {
  const TableActionButtons({
    super.key,
    required this.onSavePressed,
    required this.onCancelPressed,
  });

  final VoidCallback? onSavePressed;
  final VoidCallback? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TableActionButton(
          text: 'Save',
          backgroundColor: UIConstants.contentTheme.primary,
          onPressed: onSavePressed,
        ),
        const SizedBox(width: 8),
        TableActionButton(
          text: 'Cancel',
          backgroundColor: UIConstants.contentTheme.secondary,
          onPressed: onCancelPressed,
        ),
      ],
    );
  }
}
