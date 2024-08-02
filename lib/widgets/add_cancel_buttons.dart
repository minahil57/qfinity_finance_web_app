import 'package:qfinity/export.dart';

class AddCancelButtons extends StatelessWidget {
  const AddCancelButtons({
    super.key,
    this.onAddPressed,
    this.onCancelPressed,
  });

  final void Function()? onAddPressed;
  final void Function()? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddButton(
          onPressed: onAddPressed,
        ),
        MySpacing.width(flexSpacing * .25),
        CancelButton(
          onPressed: onCancelPressed,
        ),
      ],
    );
  }
}
