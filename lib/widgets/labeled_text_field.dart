import 'package:qfinity/export.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.inputFormatters,
    this.onChanged,
    this.maxLines,
    this.validator,
    this.focusNode,
  });

  final String label;
  final String hintText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final int? maxLines;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLabeledItem(
      label: MutedLabel(label: label),
      child: FilterTextField(
        textController: textController,
        keyboardType: keyboardType,
        hintText: hintText,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        maxLines: maxLines,
        validator: validator,
        focusNode: focusNode,
      ),
    );
  }
}

class FilterTextField extends StatelessWidget {
  const FilterTextField({
    super.key,
    required this.textController,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.readOnly = false,
    this.inputFormatters,
    this.onChanged,
    this.maxLines,
    this.validator,
    this.focusNode,
  });

  final TextEditingController textController;
  final TextInputType keyboardType;
  final String hintText;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final int? maxLines;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: MyTextStyle.bodySmall(),
      keyboardType: keyboardType,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MyTextStyle.bodySmall(xMuted: true),
        contentPadding: const EdgeInsets.all(8),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: UIConstants.formFieldBorder,
        enabledBorder: UIConstants.formFieldBorder,
        focusedBorder: UIConstants.formFieldBorder,
        filled: true,
        fillColor: readOnly ? Colors.grey[100] : theme.cardTheme.color,
        isDense: true,
      ),
      onChanged: onChanged,
      maxLines: maxLines,
      validator: validator,
      focusNode: focusNode,
    );
  }
}
