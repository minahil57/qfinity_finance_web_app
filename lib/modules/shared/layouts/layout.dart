import 'package:qfinity/export.dart';

class Layout extends StatelessWidget {
  final Widget? child;

  final LayoutController controller = LayoutController();
  final topBarTheme = AdminTheme.theme.topBarTheme;
  final contentTheme = AdminTheme.theme.contentTheme;

  Layout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? mobileScreen() : largeScreen();
      },
    );
  }

  Widget mobileScreen() {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        actions: [
          MySpacing.width(8),
          CustomPopupMenu(
            backdrop: true,
            offsetX: -180,
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
          MySpacing.width(8),
          const AccountMenuDropdown(),
          MySpacing.width(20),
        ],
      ), // endDrawer: RightBar(),
      drawer: const LeftBar(),
      body: SingleChildScrollView(
        key: controller.scrollKey,
        child: child,
      ),
    );
  }

  Widget largeScreen() {
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: const RightBar(),
      body: Row(
        children: [
          LeftBar(isCondensed: ThemeCustomizer.instance.leftBarCondensed),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    padding: MySpacing.fromLTRB(0, 58 + flexSpacing, 0, flexSpacing),
                    key: controller.scrollKey,
                    child: child,
                  ),
                ),
                Positioned(top: 0, left: 0, right: 0, child: TopBar()),
              ],
            ),
          ),
        ],
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
                  splashColor: contentTheme.primary.withAlpha(28),
                  child: MyText.labelSmall(
                    'View All',
                    color: contentTheme.primary,
                  ),
                ),
                MyButton.text(
                  onPressed: () {},
                  splashColor: contentTheme.danger.withAlpha(28),
                  child: MyText.labelSmall(
                    'Clear',
                    color: contentTheme.danger,
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
