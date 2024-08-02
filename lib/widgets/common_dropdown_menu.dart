import 'package:qfinity/export.dart';

class CommonDropdownMenu<T extends BaseDropdownItemModel> extends StatelessWidget {
  const CommonDropdownMenu({
    super.key,
    required this.items,
    required this.onSelected,
    required this.selectedItem,
  });

  final List<T> items;
  final Function(T) onSelected;
  final T selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return items.map((item) {
          return PopupMenuItem(
            value: item,
            height: 32,
            child: MyText.bodySmall(
              item.name,
              color: theme.colorScheme.onSurface,
              fontWeight: 600,
            ),
          );
        }).toList();
      },
      color: theme.cardTheme.color,
      child: MyContainer.bordered(
        padding: MySpacing.xy(12, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyText.labelMedium(
              selectedItem.name,
              color: theme.colorScheme.onSurface,
            ),
            ChevronDownIcon(),
          ],
        ),
      ),
    );
  }
}
