import 'package:qfinity/export.dart';

class DropdownContainer extends StatelessWidget {
  const DropdownContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return MyContainer.bordered(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: MyText.labelSmall(
              text,
              color: theme.colorScheme.onSurface,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ChevronDownIcon(),
        ],
      ),
    );
  }
}
