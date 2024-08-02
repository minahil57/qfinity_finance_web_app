import 'package:qfinity/export.dart';

class CompanySelectionDropdown extends StatelessWidget {
  const CompanySelectionDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StarterController>(
      builder: (controller) {
        return MyResponsive(
          builder: (_, __, type) {
            return PopupMenuButton<UserCompany>(
              itemBuilder: (BuildContext context) {
                return controller.userCompanies
                    .map(
                      (UserCompany company) => PopupMenuItem<UserCompany>(
                        value: company,
                        child: MyText.labelMedium(company.companyName!),
                      ),
                    )
                    .toList();
              },
              offset: const Offset(0, 40),
              onSelected: controller.onSelectedCompany,
              color: theme.cardTheme.color,
              child: MyContainer.bordered(
                paddingAll: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText.labelMedium(
                      controller.selectedUserCompany?.companyName ?? 'Select Company',
                      color: theme.colorScheme.onSurface,
                    ),
                    ChevronDownIcon(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
