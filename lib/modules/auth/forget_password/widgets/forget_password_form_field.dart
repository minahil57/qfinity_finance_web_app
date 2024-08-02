import 'package:qfinity/export.dart';

class ForgetPasswordFormField extends StatelessWidget {
  const ForgetPasswordFormField({
    super.key,
    this.validator,
    this.controller,
    required this.icon,
    required this.title,
    required this.label,
    required this.keyboardType,
    this.loading = false,
    this.onFieldSubmitted,
  });

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData icon;
  final String title;
  final String label;
  final TextInputType keyboardType;
  final bool loading;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(title),
        MySpacing.height(8),
        TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          readOnly: loading,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: MyTextStyle.bodySmall(xMuted: true),
            border: UIConstants.outlineInputBorder,
            prefixIcon: Icon(
              icon,
              size: 18,
            ),
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
