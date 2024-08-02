import 'package:qfinity/export.dart';

class UpdateCancelButtons extends StatelessWidget {
  const UpdateCancelButtons({
    super.key,
    this.onUpdatePressed,
    this.onCancelPressed,
  });

  final void Function()? onUpdatePressed;
  final void Function()? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UpdateButton(
          onPressed: onUpdatePressed,
        ),
        MySpacing.width(flexSpacing * .25),
        CancelButton(
          onPressed: onCancelPressed,
        ),
      ],
    );
  }
}
