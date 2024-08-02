import 'package:qfinity/export.dart';

class LabeledTwoValueRadioGroup<T> extends StatelessWidget {
  const LabeledTwoValueRadioGroup({
    super.key,
    required this.label,
    required this.radioOneLabel,
    required this.radioTwoLabel,
    required this.groupValue,
    required this.radioOneValue,
    required this.radioTwoValue,
    this.onChanged,
  });

  final String label;
  final String radioOneLabel;
  final String radioTwoLabel;
  final T? groupValue;
  final T radioOneValue;
  final T radioTwoValue;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLabeledItem(
      label: MutedLabel(label: label),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onChanged!(radioOneValue),
            child: Row(
              children: [
                Radio<T>(
                  value: radioOneValue,
                  groupValue: groupValue,
                  onChanged: (value) => onChanged!(value),
                ),
                Text(radioOneLabel),
              ],
            ),
          ),
          MySpacing.width(flexSpacing),
          GestureDetector(
            onTap: () => onChanged!(radioTwoValue),
            child: Row(
              children: [
                Radio<T>(
                  value: radioTwoValue,
                  groupValue: groupValue,
                  onChanged: (value) => onChanged!(value),
                ),
                Text(radioTwoLabel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
