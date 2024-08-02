import 'package:qfinity/export.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.title,
    required this.label,
    required this.controller,
    required this.validator,
    required this.loading,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.marginBottom = 20,
  });

  final String title;
  final String label;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool loading;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(
          title,
        ),
        MySpacing.height(4),
        TextFormField(
          validator: validator,
          controller: controller,
          readOnly: loading,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: MyTextStyle.bodySmall(xMuted: true),
            border: UIConstants.outlineInputBorder,
            prefixIcon: Icon(
              prefixIcon,
              size: 18,
            ),
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: suffixIcon,
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
        MySpacing.height(marginBottom),
      ],
    );
  }
}
