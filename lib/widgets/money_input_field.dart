import 'package:qfinity/export.dart';

class MoneyInputField extends StatelessWidget {
  const MoneyInputField({
    super.key,
    required this.controller,
    this.hint,
    this.onChanged,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String? hint;
  final void Function(String)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint ?? '0',
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: InputFormatters.positiveNumberWithTwoDigitsDicimalPoint,
      onChanged: onChanged,
      readOnly: readOnly,
    );
  }
}
