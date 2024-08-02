import 'package:qfinity/export.dart';

class CommonCheckBox extends StatelessWidget {
  const CommonCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.isIdle = false,
  });

  final void Function(bool?) onChanged;
  final bool isChecked;
  final bool isIdle;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Checkbox(
        onChanged: onChanged,
        value: isChecked,
        activeColor: Theme.of(context).primaryColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: UIConstants.getCompactDensity,
        hoverColor: isIdle ? Colors.transparent : null,
        mouseCursor: isIdle ? MouseCursor.defer : null,
        overlayColor: isIdle ? WidgetStateProperty.all(Colors.transparent) : null,
        side: isIdle
            ? BorderSide(
                color: Colors.grey.shade500,
                width: 2,
              )
            : null,
      ),
    );
  }
}
