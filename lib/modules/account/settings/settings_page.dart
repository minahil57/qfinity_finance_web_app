import 'package:qfinity/export.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerPageLayout(
      pageTitle: 'Settings',
      child: Column(
        children: [
          MyCard(
            onTap: () => Get.toNamed(Routes.changePassword),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.lightLock,
                  size: 16,
                ),
                MySpacing.width(18),
                const Expanded(
                  child: MyText.labelLarge(
                    'Change Password',
                  ),
                ),
                const Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
