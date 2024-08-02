import 'package:qfinity/export.dart';

class CommonSwitch extends StatelessWidget {
  const CommonSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.55,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: UIConstants.contentTheme.primary,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        inactiveThumbColor: Colors.grey,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}
