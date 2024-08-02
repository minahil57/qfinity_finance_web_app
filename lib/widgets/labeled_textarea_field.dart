import 'package:qfinity/export.dart';

class LabeledTextArea extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController textController;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const LabeledTextArea({
    super.key,
    required this.label,
    required this.hintText,
    required this.textController,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(label),
        MySpacing.height(8),
        TextFormField(
          controller: textController,
          maxLines: 4,
          // Set the number of lines as per your requirement
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: onChanged,
          focusNode: focusNode,
        ),
      ],
    );
  }
}
