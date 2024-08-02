import 'package:qfinity/export.dart';

class SaveCancelButtons extends StatelessWidget {
  const SaveCancelButtons({
    super.key,
    this.onSavePressed,
    this.onCancelPressed,
  });

  final void Function()? onSavePressed;
  final void Function()? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SaveButton(
          onPressed: onSavePressed,
        ),
        MySpacing.width(flexSpacing * .25),
        CancelButton(
          onPressed: onCancelPressed,
        ),
      ],
    );
  }
}
