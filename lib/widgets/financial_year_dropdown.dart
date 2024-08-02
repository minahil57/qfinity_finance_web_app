import 'package:qfinity/export.dart';

class FinancialYearDropdown extends StatelessWidget {
  const FinancialYearDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StarterController>(
      builder: (controller) {
        return ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? PopupMenuButton<DropdownItemModel>(
                itemBuilder: (BuildContext context) {
                  return controller.financialYears
                      .map(
                        (DropdownItemModel item) => PopupMenuItem<DropdownItemModel>(
                          value: item,
                          child: MyText.labelMedium(item.name),
                        ),
                      )
                      .toList();
                },
                offset: const Offset(0, 40),
                onSelected: controller.onSelectedFinancialYear,
                color: theme.cardTheme.color,
                child: MyContainer.bordered(
                  paddingAll: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: MyText.labelSmall(
                          controller.selectedFinancialYear.name,
                          color: theme.colorScheme.onSurface,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                        ),
                      ),
                      ChevronDownIcon(),
                    ],
                  ),
                ),
              )
            : Row(
                children: [
                  const MutedLabel(label: 'Financial Year'),
                  PopupMenuButton<DropdownItemModel>(
                    itemBuilder: (BuildContext context) {
                      return controller.financialYears
                          .map(
                            (DropdownItemModel item) => PopupMenuItem<DropdownItemModel>(
                              value: item,
                              child: MyText.labelMedium(item.name),
                            ),
                          )
                          .toList();
                    },
                    offset: const Offset(0, 40),
                    onSelected: controller.onSelectedFinancialYear,
                    color: theme.cardTheme.color,
                    child: MyContainer.bordered(
                      paddingAll: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MyText.labelMedium(
                            controller.selectedFinancialYear.name,
                            color: theme.colorScheme.onSurface,
                            overflow: TextOverflow.ellipsis,
                          ),
                          ChevronDownIcon(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
