import 'package:qfinity/export.dart';

class LabeledTextValueInContainer extends StatelessWidget {
  const LabeledTextValueInContainer({
    super.key,
    required this.label,
    required this.text,
    this.labelColor,
    this.textColor,
    this.containerColor,
    this.isMuted,
    this.fontWeight,
  });

  final String label;
  final String text;
  final Color? labelColor;
  final Color? textColor;
  final Color? containerColor;
  final bool? isMuted;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLabeledItem(
      label: MutedLabel(
        label: label,
        isMuted: isMuted,
        labelColor: labelColor,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: containerColor ?? Colors.grey[100],
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
