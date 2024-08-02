import 'package:qfinity/export.dart';

class MainActionButtons extends StatelessWidget {
  const MainActionButtons({
    super.key,
    required this.onAddPressed,
    required this.onEditPressed,
    required this.onDeletePressed,
    this.onDetailsPressed,
    this.showDetailsButton = false,
  });

  final VoidCallback? onAddPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onDetailsPressed;
  final bool showDetailsButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: flexSpacing * .2, left: flexSpacing, right: flexSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (showDetailsButton) ...[
            ActionButton(
              text: 'Details',
              onPressed: onDetailsPressed,
              icon: FontAwesomeIcons.lightMemoCircleInfo,
              bgColor: UIConstants.contentTheme.dark,
            ),
            const SizedBox(width: 3),
          ],
          ActionButton(
            text: 'Delete',
            onPressed: onDeletePressed,
            icon: FontAwesomeIcons.lightTrashCan,
            bgColor: UIConstants.contentTheme.danger,
          ),
          const SizedBox(width: 3),
          ActionButton(
            text: 'Edit',
            onPressed: onEditPressed,
            icon: FontAwesomeIcons.lightPencil,
            bgColor: UIConstants.contentTheme.secondary,
          ),
          const SizedBox(width: 3),
          ActionButton(
            text: 'Add',
            onPressed: onAddPressed,
            icon: FontAwesomeIcons.lightPlus,
            bgColor: UIConstants.contentTheme.primary,
          ),
        ],
      ),
    );
  }
}
