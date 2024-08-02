import 'package:qfinity/export.dart';

class CustomToggleButtonItem extends StatelessWidget {
  const CustomToggleButtonItem({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySpacing.x(12),
      child: Row(
        children: [
          Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 18,
          ),
          MySpacing.width(8),
          MyText.labelMedium(
            label,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
