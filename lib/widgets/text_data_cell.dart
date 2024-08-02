import 'package:qfinity/export.dart';

class TextDataCell extends StatelessWidget {
  const TextDataCell(
    this.text, {
    super.key,
    this.isSelectable = true,
  });

  final String text;
  final bool isSelectable;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    );

    if (isSelectable) {
      return Tooltip(
        message: text,
        waitDuration: const Duration(milliseconds: 200),
        child: SelectableText(
          text,
          style: style,
        ),
      );
    } else {
      return Tooltip(
        message: text,
        waitDuration: const Duration(milliseconds: 200),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: style,
        ),
      );
    }
  }
}
