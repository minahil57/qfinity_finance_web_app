import 'package:qfinity/export.dart';

class MainFormHeader extends StatelessWidget {
  const MainFormHeader({
    super.key,
    required this.title,
    required this.onAddPressed,
    required this.onEditPressed,
    required this.onDeletePressed,
    this.onDetailsPressed,
    this.showDetailsButton = false,
  });

  final String title;
  final VoidCallback? onAddPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onDetailsPressed;
  final bool showDetailsButton;

  @override
  Widget build(BuildContext context) {
    final ItemsAlignment itemsAlignment = SizeUtils.mainHeaderAlignment;

    final titleWidget = MainFormTitle(title: title);
    final butonsWidget = MainActionButtons(
      onAddPressed: onAddPressed,
      onEditPressed: onEditPressed,
      onDeletePressed: onDeletePressed,
      onDetailsPressed: onDetailsPressed,
      showDetailsButton: showDetailsButton,
    );

    if (itemsAlignment == ItemsAlignment.row) {
      return Row(
        children: [
          titleWidget,
          const Spacer(),
          butonsWidget,
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget,
          SizedBox(height: flexSpacing),
          butonsWidget,
        ],
      );
    }
  }
}
