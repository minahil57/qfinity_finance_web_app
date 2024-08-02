import 'package:qfinity/export.dart';

class LabeledCheckBox extends StatelessWidget {
  const LabeledCheckBox({
    super.key,
    required this.isChecked,
    required this.label,
    required this.onChanged,
  });

  final void Function(bool?) onChanged;
  final bool isChecked;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isChecked),
      child: Row(
        children: [
          CommonCheckBox(
            isChecked: isChecked,
            onChanged: onChanged,
          ),
          MySpacing.width(12),
          MyText.bodyMedium(
            label,
          ),
        ],
      ),
    );
  }
}
