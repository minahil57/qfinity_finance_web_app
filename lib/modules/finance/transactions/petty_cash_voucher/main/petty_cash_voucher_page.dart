import 'package:qfinity/export.dart';

class PettyCashVoucherPage extends StatelessWidget {
  const PettyCashVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<PettyCashVoucherController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainFormTitle(title: 'Petty Cash Voucher'),
              MySpacing.height(flexSpacing),
              MyResponsive(
                builder: (_, __, type) {
                  return type.isMobile || type.isTablet
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  scrollControlDisabledMaxHeightRatio: 0.7,
                                  builder: (context) => SingleChildScrollView(
                                    padding: MySpacing.y(flexSpacing),
                                    child: const BasicListingFiltersBuilder<PettyCashVoucherController>(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                FontAwesomeIcons.lightFilter,
                                size: 20,
                              ),
                            ),
                          ],
                        )
                      : const BasicListingFiltersBuilder<PettyCashVoucherController>();
                },
              ),
              MySpacing.height(flexSpacing * .8), // Adjust as needed
              const PettyCashVoucherDataTable(),
            ],
          );
        },
      ),
    );
  }
}
