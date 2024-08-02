import 'package:qfinity/export.dart';

class NarrationBuilder<T extends NarrationMixin> extends StatelessWidget {
  const NarrationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return LabeledTextArea(
          label: 'Narration',
          hintText: 'Enter Narration',
          textController: controller.narrationTextEditingController,
          onChanged: controller.onNarrationChanged,
          focusNode: controller.narrationFocusNode,
        );
      },
    );
  }
}
