import 'package:qfinity/export.dart';

class CustomSearchableDropDown extends StatelessWidget {
  final List<DropdownItemModel> items;
  final String? selectedItem;
  final Function(DropdownItemModel?) onChanged;

  const CustomSearchableDropDown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<String> itemStrings = items.map((item) => item.name).toList();

    return SizedBox(
      width: 180,
      child: DropdownSearch<String>(
        items: itemStrings,
        popupProps: PopupProps.menu(
          showSearchBox: true,
          itemBuilder: (context, item, isSelected) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            );
          },
        ),
        dropdownButtonProps: DropdownButtonProps(
          color: theme.colorScheme.onSurface,
          icon: const Icon(FontAwesomeIcons.chevronDown),
          iconSize: 15,
        ),
        dropdownDecoratorProps: const DropDownDecoratorProps(
          textAlignVertical: TextAlignVertical.center,
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            border: InputBorder.none,
          ),
          baseStyle: TextStyle(fontSize: 14),
        ),
        onChanged: (String? selectedString) {
          DropdownItemModel? selectedItem = items.firstWhere(
            (item) => item.name == selectedString,
          );
          onChanged(selectedItem);
        },
        selectedItem: selectedItem,
      ),
    );
  }
}
