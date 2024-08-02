import 'package:qfinity/export.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<ResetPasswordController>(
        init: ResetPasswordController(),
        builder: (controller) {
          return Padding(
            padding: MySpacing.all(16),
            child: MyFlex(
              contentPadding: false,
              children: [
                MyFlexItem(
                  sizes: 'lg-6',
                  child: MyResponsive(
                    builder: (_, __, type) {
                      return type == MyScreenMediaType.xxl
                          ? Image.asset(
                              AppImages.resetPassword,
                              fit: BoxFit.fitHeight,
                              height: 500,
                            )
                          : type == MyScreenMediaType.xl
                              ? Image.asset(
                                  AppImages.resetPassword,
                                  fit: BoxFit.fitHeight,
                                  height: 500,
                                )
                              : type == MyScreenMediaType.lg
                                  ? Image.asset(
                                      AppImages.resetPassword,
                                      fit: BoxFit.fitHeight,
                                      height: 500,
                                    )
                                  : const SizedBox();
                    },
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-6',
                  child: Padding(
                    padding: MySpacing.y(16),
                    child: Form(
                      key: controller.basicValidator.formKey,
                      autovalidateMode: controller.autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: MyText.titleLarge(
                              'Reset password',
                              fontWeight: 700,
                            ),
                          ),
                          MySpacing.height(10),
                          const Center(
                            child: MyText.bodySmall(
                              'Your password will be reset',
                              muted: true,
                            ),
                          ),
                          MySpacing.height(45),
                          CustomFormField(
                            title: 'OTP',
                            label: 'Enter OTP',
                            controller: controller.basicValidator.getController('otp'),
                            validator: controller.basicValidator.getValidation('otp'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightMessageCheck,
                          ),
                          CustomFormField(
                            title: 'Password',
                            label: 'Password',
                            controller: controller.basicValidator.getController('password'),
                            validator: controller.basicValidator.getValidation('password'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightLock,
                            obscureText: !controller.showPassword,
                            suffixIcon: PasswordIcon(
                              isShown: controller.showPassword,
                              onTap: controller.onChangeShowPassword,
                            ),
                          ),
                          CustomFormField(
                            title: 'Confirm Password',
                            label: 'Confirm Password',
                            controller: controller.basicValidator.getController('confirmPassword'),
                            validator: controller.basicValidator.getValidation('confirmPassword'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightLock,
                            obscureText: !controller.showConfirmPassword,
                            onFieldSubmitted: (_) => controller.onResetPassword(),
                            suffixIcon: PasswordIcon(
                              isShown: controller.showConfirmPassword,
                              onTap: controller.onChangeShowConfirmPassword,
                            ),
                          ),
                          Center(
                            child: ButtonWithLoadingOnAction(
                              text: 'Confirm',
                              onPressed: controller.onResetPassword,
                              isLoading: controller.loading,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
