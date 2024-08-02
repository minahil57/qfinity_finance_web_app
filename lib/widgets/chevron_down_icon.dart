import 'package:qfinity/export.dart';

class ChevronDownIcon extends StatelessWidget {
  ChevronDownIcon({
    super.key,
    Color? color,
  }) : color = color ?? theme.colorScheme.onSurface;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      child: Icon(
        FontAwesomeIcons.chevronDown,
        size: 15,
        color: color,
      ),
    );
  }
}
