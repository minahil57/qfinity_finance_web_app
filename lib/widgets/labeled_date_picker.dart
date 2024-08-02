import 'package:qfinity/export.dart';

class LabeledDatePicker extends StatelessWidget {
  const LabeledDatePicker({
    super.key,
    required this.label,
    required this.onTap,
    required this.selectedDate,
  });

  final String label;
  final VoidCallback onTap;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLabeledItem(
      label: MutedLabel(label: label),
      child: MyContainer.bordered(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.lightCalendar,
              color: theme.colorScheme.secondary,
              size: 15,
            ),
            MySpacing.width(6),
            MyText.bodySmall(
              DateTimeHelper.dateFormatter.format(selectedDate),
              fontWeight: 600,
              color: theme.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
