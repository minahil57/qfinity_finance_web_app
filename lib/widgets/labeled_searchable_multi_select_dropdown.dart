import 'package:qfinity/export.dart';

class LabeledSearchableMultiSelectDropdown<T extends BaseDropdownItemModel> extends StatelessWidget {
  const LabeledSearchableMultiSelectDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.selectedItems,
    this.onSelected,
    this.useIdForValue = false,
    this.showSearchBox = true,
    this.validator,
    this.hintText,
    this.disabled = false,
  });

  final String label;
  final List<T> items;
  final List<T> selectedItems;
  final void Function(List<T>)? onSelected;
  final bool useIdForValue;
  final bool showSearchBox;
  final String? Function(List<T>?)? validator;
  final String? hintText;
  final bool disabled;

  @override
  @override
  Widget build(BuildContext context) {
    return ResponsiveLabeledItem(
      label: MutedLabel(label: label),
      child: DropdownSearch<T>.multiSelection(
        enabled: !disabled,
        items: items,
        validator: validator,
        popupProps: PopupPropsMultiSelection.menu(
          validationWidgetBuilder: (context, selectedItems) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OkButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
          showSearchBox: showSearchBox,
          searchDelay: Duration.zero,
          searchFieldProps: TextFieldProps(
            style: TextStyle(
              fontSize: 12,
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
            autofocus: true,
            cursorHeight: 12,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              constraints: const BoxConstraints(
                maxHeight: 28,
              ),
              border: UIConstants.formFieldBorder,
              enabledBorder: UIConstants.formFieldBorder,
              focusedBorder: UIConstants.formFieldBorder,
              filled: true,
              fillColor: theme.cardTheme.color,
              isDense: true,
            ),
          ),
          itemBuilder: (context, item, isSelected) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
              child: MyText.labelSmall(useIdForValue ? item.id : item.name),
            );
          },
          selectionWidget: (context, item, isSelected) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CommonCheckBox(isChecked: isSelected, onChanged: (val) {}),
            );
          },
          onItemAdded: (items, item) {
            onSelected!(items);
          },
          onItemRemoved: (items, item) {
            onSelected!(items);
          },
        ),
        filterFn: (item, filter) {
          return (useIdForValue ? item.id : item.name).toLowerCase().contains(filter.toLowerCase());
        },
        itemAsString: (item) => useIdForValue ? item.id : item.name,
        dropdownBuilder: (context, selectedItems) {
          if (selectedItems.isEmpty) {
            return Text(
              hintText ?? '--Select--',
              style: TextStyle(
                fontSize: 11,
                color: theme.colorScheme.onSurface.withOpacity(.8),
              ),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 2,
              children: selectedItems.map((item) {
                return SizedBox(
                  height: 28,
                  child: Center(
                    child: Chip(
                      padding: EdgeInsets.zero,
                      backgroundColor: MainAppTheme.primaryColor,
                      label: Text(
                        useIdForValue ? item.id : item.name,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      deleteIconColor: Colors.white,
                      deleteIcon: const Icon(
                        FontAwesomeIcons.xmarkLarge,
                        size: 10,
                      ),
                      deleteButtonTooltipMessage: 'Remove',
                      onDeleted: () {
                        selectedItems.remove(item);
                        onSelected!(selectedItems);
                      },
                      deleteIconBoxConstraints: const BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
        dropdownButtonProps: DropdownButtonProps(
          color: theme.colorScheme.onSurface,
          icon: const Icon(FontAwesomeIcons.chevronDown),
          iconSize: 13,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          constraints: const BoxConstraints(
            minWidth: 28,
            minHeight: 28,
          ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlignVertical: TextAlignVertical.center,
          dropdownSearchDecoration: InputDecoration(
            hintText: hintText ?? '--Select--',
            suffixIconConstraints: const BoxConstraints(
              minWidth: 28,
              minHeight: 28,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 28,
              minHeight: 28,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            border: UIConstants.formFieldBorder,
            enabledBorder: UIConstants.formFieldBorder,
            focusedBorder: UIConstants.formFieldBorder,
            filled: true,
            fillColor: disabled ? Colors.grey[100] : theme.cardTheme.color,
            isDense: true,
          ),
          baseStyle: TextStyle(
            fontSize: 11,
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        onChanged: onSelected,
        selectedItems: selectedItems,
      ),
    );
  }
}
