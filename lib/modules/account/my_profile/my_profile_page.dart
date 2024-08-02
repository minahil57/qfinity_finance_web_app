import 'package:qfinity/export.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerPageLayout(
      pageTitle: 'My Profile',
      child: Stack(
        children: [
          // edit icon at the top right corner
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: MySpacing.xy(8, 8),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.lightPenToSquare,
                  size: 18,
                  color: UIConstants.contentTheme.primary,
                ),
                onPressed: () => Get.toNamed(Routes.editProfile),
              ),
            ),
          ),
          Column(
            children: [
              GetBuilder<StarterController>(
                builder: (controller) {
                  return Column(
                    children: [
                      ProfileImageWrapper(
                        child: CachedProfileImage(
                          imageUrl: controller.loginModel!.profileImage ?? '',
                        ),
                      ),
                      MySpacing.height(12),
                      MyText.labelLarge(controller.loginModel!.fullName ?? ''),
                      MySpacing.height(4),
                      MyText.labelSmall(
                        controller.loginModel!.email ?? '',
                        color: theme.hintColor,
                      ),
                    ],
                  );
                },
              ),
              MySpacing.height(40),
              // change password
              MyCard(
                onTap: () => Get.toNamed(Routes.editProfile),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.lightPenToSquare,
                      size: 16,
                    ),
                    MySpacing.width(18),
                    const Expanded(
                      child: MyText.labelLarge(
                        'Edit Profile',
                      ),
                    ),
                    const Icon(
                      FontAwesomeIcons.chevronRight,
                      size: 16,
                    ),
                  ],
                ),
              ),
              MySpacing.height(16),
              MyCard(
                onTap: () async {
                  await AuthRepository.logoutAllDevices();
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.lightRightFromBracket,
                      size: 16,
                      color: UIConstants.contentTheme.danger,
                    ),
                    MySpacing.width(18),
                    Expanded(
                      child: MyText.labelLarge(
                        'Logout of all devices',
                        color: UIConstants.contentTheme.danger,
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      size: 16,
                      color: UIConstants.contentTheme.danger,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
