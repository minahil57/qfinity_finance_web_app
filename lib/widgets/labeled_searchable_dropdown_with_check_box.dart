import 'package:qfinity/export.dart';

class LabeledSearchableDropdownWithCheckBox<T extends BaseDropdownItemModel> extends StatelessWidget {
  const LabeledSearchableDropdownWithCheckBox({
    super.key,
    required this.label,
    required this.items,
    required this.selectedItem,
    this.onSelected,
    this.useIdForValue = false,
    this.showSearchBox = true,
    this.validator,
    this.hintText,
    this.disabled = false,
    required this.onCheckBoxChanged,
    required this.isCheckBoxChecked,
  });

  final String label;
  final List<T> items;
  final T? selectedItem;
  final void Function(T?)? onSelected;
  final bool useIdForValue;
  final bool showSearchBox;
  final String? Function(T?)? validator;
  final String? hintText;
  final bool disabled;
  final void Function(bool?) onCheckBoxChanged;
  final bool isCheckBoxChecked;

  @override
  @override
  Widget build(BuildContext context) {
    return ResponsiveLabeledItem(
      label: MyResponsive(
        builder: (_, __, type) {
          return SizedBox(
            width: type.isMobile || type.isTablet ? double.infinity : Get.size.width * 0.07,
            child: InkWell(
              onTap: () => onCheckBoxChanged(!isCheckBoxChecked),
              child: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      label,
                      maxLines: 1,
                      maxFontSize: 12,
                      minFontSize: 8,
                      style: TextStyle(
                        color: theme.colorScheme.onSurface.withAlpha(200),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  CommonCheckBox(
                    isChecked: isCheckBoxChecked,
                    onChanged: onCheckBoxChanged,
                  ),
                  const SizedBox(width: 2),
                ],
              ),
            ),
          );
        },
      ),
      child: DropdownSearch<T>(
        enabled: !disabled,
        items: items,
        validator: validator,
        popupProps: PopupProps.menu(
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
        ),
        filterFn: (item, filter) {
          return (useIdForValue ? item.id : item.name).toLowerCase().contains(filter.toLowerCase());
        },
        itemAsString: (item) => useIdForValue ? item.id : item.name,
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
            hintText: hintText,
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
        selectedItem: selectedItem,
      ),
    );
  }
}
