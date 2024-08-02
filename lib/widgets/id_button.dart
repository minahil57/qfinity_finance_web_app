import 'package:flutter/material.dart';

class IdButton extends StatelessWidget {
  const IdButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            );
          } else {
            return const TextStyle(
              fontWeight: FontWeight.w500,
            );
          }
        }),
      ),
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
