import 'package:qfinity/export.dart';

class AccountMenuDropdown extends StatefulWidget {
  const AccountMenuDropdown({super.key});

  @override
  State<AccountMenuDropdown> createState() => _AccountMenuDropdownState();
}

class _AccountMenuDropdownState extends State<AccountMenuDropdown> {
  Function? accountHideFn;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      hideFn: (fn) {
        accountHideFn = fn;
      },
      backdrop: true,
      offsetX: -60,
      offsetY: 8,
      menu: Padding(
        padding: MySpacing.xy(8, 8),
        child: GetBuilder<StarterController>(
          builder: (controller) {
            return Row(
              children: [
                ProfileImageWrapper(
                  height: 28,
                  width: 28,
                  child: CachedProfileImage(
                    imageUrl: controller.loginModel!.profileImage ?? '',
                  ),
                ),
                MySpacing.width(8),
                MyText.labelLarge(controller.loginModel!.firstName ?? ''),
              ],
            );
          },
        ),
      ),
      menuBuilder: (_) {
        return MyContainer.bordered(
          paddingAll: 0,
          width: 170,
          child: Column(
            children: [
              Padding(
                padding: MySpacing.xy(8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountMenuDropdownButton(
                      buttonText: 'My Profile',
                      icon: FontAwesomeIcons.lightUser,
                      onPressed: () {
                        setState(() {
                          accountHideFn?.call();
                        });
                        Get.toNamed(Routes.myProfile);
                      },
                    ),
                    MySpacing.height(4),
                    AccountMenuDropdownButton(
                      buttonText: 'Settings',
                      icon: FontAwesomeIcons.lightGear,
                      onPressed: () {
                        setState(() {
                          accountHideFn?.call();
                        });
                        Get.toNamed(Routes.settings);
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: MySpacing.xy(8, 8),
                child: AccountMenuDropdownButton(
                  buttonText: 'Log out',
                  icon: FontAwesomeIcons.lightRightFromBracket,
                  onPressed: () async {
                    setState(() {
                      accountHideFn?.call();
                    });
                    await AuthRepository.logout();
                  },
                  splashColor: UIConstants.contentTheme.danger.withAlpha(28),
                  contentColor: UIConstants.contentTheme.danger,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AccountMenuDropdownButton extends StatelessWidget {
  AccountMenuDropdownButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.icon,
    Color? splashColor,
    Color? contentColor,
  })  : splashColor = splashColor ?? theme.colorScheme.onSurface.withAlpha(20),
        contentColor = contentColor ?? UIConstants.contentTheme.onBackground;

  final String buttonText;
  final VoidCallback onPressed;
  final Color? splashColor;
  final Color? contentColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
      borderRadiusAll: AppStyle.buttonRadius.medium,
      padding: MySpacing.xy(8, 4),
      splashColor: splashColor,
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          Icon(
            icon,
            size: 14,
            color: contentColor,
          ),
          MySpacing.width(8),
          MyText.labelSmall(
            buttonText,
            fontWeight: 600,
            color: contentColor,
          ),
        ],
      ),
    );
  }
}
