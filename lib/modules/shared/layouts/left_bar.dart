import 'package:qfinity/export.dart';

class LeftBar extends StatefulWidget {
  final bool isCondensed;

  const LeftBar({super.key, this.isCondensed = false});

  @override
  State<LeftBar> createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> {
  final ThemeCustomizer customizer = ThemeCustomizer.instance;

  bool isCondensed = false;

  final _finance = GlobalKey<CustomPopupMenuState>();
  final _financeTransactions = GlobalKey<CustomPopupMenuState>();
  final _ar = GlobalKey<CustomPopupMenuState>();
  final _salesVoucher = GlobalKey<CustomPopupMenuState>();

  @override
  Widget build(BuildContext context) {
    isCondensed = widget.isCondensed;
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(position: MyShadowPosition.centerRight, elevation: 0.2),
      child: SafeArea(
        child: AnimatedContainer(
          color: UIConstants.leftBarTheme.background,
          width: isCondensed ? 70 : 350,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: InkWell(
                  onTap: () {
                    if (Get.currentRoute != Routes.dashboard) {
                      Get.offAllNamed(Routes.dashboard);
                    }
                  },
                  child: Row(
                    children: [
                      MySpacing.width(flexSpacing),
                      Image.asset(
                        AppImages.qfinityLogo,
                        height: widget.isCondensed ? 24 : 32,
                        color: UIConstants.contentTheme.primary,
                      ),
                      if (!widget.isCondensed) ...[
                        Flexible(
                          child: MySpacing.width(16),
                        ),
                        Flexible(
                          child: MyText.labelLarge(
                            'Qfinity',
                            style: GoogleFonts.raleway(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: UIConstants.contentTheme.primary,
                              letterSpacing: 1,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ResponsiveBreakpoints.of(context)
                          .smallerThan(DESKTOP))
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: MySpacing.xy(16, 10),
                                child: const CompanySelectionDropdown(),
                              ),
                              Padding(
                                padding: MySpacing.xy(16, 0),
                                child: const FinancialYearDropdown(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      NavigationItem(
                        iconData: FontAwesomeIcons.lightObjectsColumn,
                        title: 'Dashboard',
                        isCondensed: isCondensed,
                        route: Routes.dashboard,
                      ),
                      MenuWidget(
                        title: 'Account Recieveable',
                        popupMenuKey: _ar,
                        isCondensed: isCondensed,
                        iconData: FontAwesomeIcons.apartment,
                        children: [
                          MenuItem(
                            title: 'Sales Voucher',
                            isCondensed: isCondensed,
                            route: Routes.saleVoucher,
                            parentMenuKeys: [
                              _ar,
                              _salesVoucher,
                            ],
                          ),
                        ],
                      ),
                      MenuWidget(
                        popupMenuKey: _finance,
                        iconData: FontAwesomeIcons.lightMoneyCheckDollar,
                        isCondensed: isCondensed,
                        title: 'Finance',
                        children: [
                          MenuWidget(
                            popupMenuKey: _financeTransactions,
                            isCondensed: isCondensed,
                            title: 'Transactions',
                            children: [
                              MenuItem(
                                parentMenuKeys: [
                                  _finance,
                                  _financeTransactions,
                                ],
                                title: 'Petty Cash Voucher',
                                isCondensed: isCondensed,
                                route: Routes.pettyCashVoucher,
                              ),
                              MenuItem(
                                parentMenuKeys: [
                                  _finance,
                                  _financeTransactions,
                                ],
                                title: 'Sale Voucher',
                                isCondensed: isCondensed,
                                route: Routes.saleVoucher,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget labelWidget(String label) {
    return isCondensed
        ? MySpacing.empty()
        : Container(
            padding: MySpacing.xy(24, 8),
            child: MyText.labelSmall(
              label.toUpperCase(),
              color: UIConstants.leftBarTheme.labelColor,
              muted: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontWeight: 700,
            ),
          );
  }
}

class MenuDivider extends StatelessWidget {
  const MenuDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: UIConstants.leftBarTheme.dividerColor,
      thickness: .15,
      indent: 16,
      endIndent: 16,
    );
  }
}
