import 'package:qfinity/export.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.children,
  });

  final List<bool> isSelected;
  final void Function(int)? onPressed;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      splashColor: theme.colorScheme.primary.withAlpha(48),
      color: theme.colorScheme.onSurface,
      selectedBorderColor: theme.colorScheme.primary.withAlpha(48),
      borderRadius: BorderRadius.all(
        Radius.circular(
          AppStyle.containerRadius.small,
        ),
      ),
      isSelected: isSelected,
      onPressed: onPressed,
      children: children,
    );
  }
}
