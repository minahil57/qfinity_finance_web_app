import 'package:qfinity/export.dart';

// ignore: must_be_immutable
class TopBar extends StatelessWidget {
  TopBar({super.key});

  Function? languageHideFn;

  @override
  Widget build(BuildContext context) {
    return MyCard(
      shadow: MyShadow(position: MyShadowPosition.bottomRight, elevation: 0.5),
      height: 60,
      borderRadiusAll: 0,
      padding: MySpacing.x(24),
      color: UIConstants.topBarTheme.background.withAlpha(246),
      child: Row(
        children: [
          Row(
            children: [
              InkWell(
                splashColor: theme.colorScheme.onSurface,
                highlightColor: theme.colorScheme.onSurface,
                onTap: () {
                  ThemeCustomizer.toggleLeftBarCondensed();
                },
                child: Icon(
                  FontAwesomeIcons.lightBars,
                  color: UIConstants.topBarTheme.onBackground,
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const ResponsiveCompanyFinancialYearsDropdowns(),
                // InkWell(
                //   onTap: () {
                //     ThemeCustomizer.setTheme(
                //         ThemeCustomizer.instance.theme == ThemeMode.dark
                //             ? ThemeMode.light
                //             : ThemeMode.dark);
                //   },
                //   child: Icon(
                //     ThemeCustomizer.instance.theme == ThemeMode.dark
                //         ? FeatherIcons.sun
                //         : FeatherIcons.moon,
                //     size: 18,
                //     color: topBarTheme.onBackground,
                //   ),
                // ),
                // MySpacing.width(12),
                // CustomPopupMenu(
                //   backdrop: true,
                //   hideFn: (fn) => languageHideFn = fn,
                //   offsetX: -36,
                //   menu: Padding(
                //     padding: MySpacing.xy(8, 8),
                //     child: Center(
                //       child: ClipRRect(
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         borderRadius: BorderRadius.circular(2),
                //         child: Image.asset(
                //           'assets/lang/${ThemeCustomizer.instance.currentLanguage.locale.languageCode}.jpg',
                //           width: 24,
                //           height: 18,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //   ),
                //   menuBuilder: (_) => buildLanguageSelector(),
                // ),
                // MySpacing.width(6),
                CustomPopupMenu(
                  backdrop: true,
                  offsetX: -120,
                  menu: Padding(
                    padding: MySpacing.xy(8, 8),
                    child: const Center(
                      child: Icon(
                        FontAwesomeIcons.lightBell,
                        size: 18,
                      ),
                    ),
                  ),
                  menuBuilder: (_) => buildNotifications(),
                ),
                MySpacing.width(4),
                const AccountMenuDropdown(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLanguageSelector() {
    return MyContainer.bordered(
      padding: MySpacing.xy(8, 8),
      width: 125,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Language.languages
            .map(
              (language) => MyButton.text(
                padding: MySpacing.xy(8, 4),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                splashColor: UIConstants.contentTheme.onBackground.withAlpha(20),
                onPressed: () async {
                  languageHideFn?.call();
                  // Language.changeLanguage(language);
                },
                child: Row(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(2),
                      child: Image.asset(
                        'assets/lang/${language.locale.languageCode}.jpg',
                        width: 18,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MySpacing.width(8),
                    MyText.labelMedium(language.languageName),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildNotifications() {
    Widget buildNotification(String title, String description) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.labelLarge(title),
          MySpacing.height(4),
          MyText.bodySmall(description),
        ],
      );
    }

    return MyContainer.bordered(
      paddingAll: 0,
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(16, 12),
            child: const MyText.titleMedium('Notification', fontWeight: 600),
          ),
          MyDashedDivider(
            color: theme.dividerColor,
            dashSpace: 4,
            dashWidth: 6,
          ),
          Padding(
            padding: MySpacing.xy(16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNotification(
                  'Your order is received',
                  'Order #1232 is ready to deliver',
                ),
                MySpacing.height(12),
                buildNotification(
                  'Account Security ',
                  'Your account password changed 1 hour ago',
                ),
              ],
            ),
          ),
          MyDashedDivider(
            color: theme.dividerColor,
            dashSpace: 4,
            dashWidth: 6,
          ),
          Padding(
            padding: MySpacing.xy(16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton.text(
                  onPressed: () {},
                  splashColor: UIConstants.contentTheme.primary.withAlpha(28),
                  child: MyText.labelSmall(
                    'View All',
                    color: UIConstants.contentTheme.primary,
                  ),
                ),
                MyButton.text(
                  onPressed: () {},
                  splashColor: UIConstants.contentTheme.danger.withAlpha(28),
                  child: MyText.labelSmall(
                    'Clear',
                    color: UIConstants.contentTheme.danger,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
