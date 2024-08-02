import 'package:qfinity/export.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<LoginController>(
        init: LoginController(),
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
                              AppImages.login,
                              fit: BoxFit.cover,
                              height: 500,
                            )
                          : type == MyScreenMediaType.xl
                              ? Image.asset(
                                  AppImages.login,
                                  fit: BoxFit.cover,
                                  height: 500,
                                )
                              : type == MyScreenMediaType.lg
                                  ? Image.asset(
                                      AppImages.login,
                                      fit: BoxFit.cover,
                                      height: 500,
                                    )
                                  : const SizedBox();
                    },
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-6',
                  child: Padding(
                    padding: MySpacing.y(28),
                    child: Form(
                      key: controller.basicValidator.formKey,
                      autovalidateMode: controller.autovalidateMode,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: MyText.titleLarge(
                              'Welcome',
                              fontWeight: 600,
                              fontSize: 24,
                            ),
                          ),
                          const Center(
                            child: MyText.bodyMedium(
                              'Login your account',
                              fontSize: 16,
                            ),
                          ),
                          MySpacing.height(40),
                          CustomFormField(
                            title: 'Email Address',
                            label: 'Email Address',
                            controller: controller.basicValidator.getController('email'),
                            validator: controller.basicValidator.getValidation('email'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightEnvelope,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          CustomFormField(
                            title: 'Password',
                            label: 'Password',
                            controller: controller.basicValidator.getController('password'),
                            validator: controller.basicValidator.getValidation('password'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightLock,
                            obscureText: !controller.showPassword,
                            onFieldSubmitted: (_) => controller.onLogin(),
                            suffixIcon: PasswordIcon(
                              isShown: controller.showPassword,
                              onTap: controller.onChangeShowPassword,
                            ),
                            marginBottom: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LabeledCheckBox(
                                onChanged: controller.onChangeCheckBox,
                                isChecked: controller.isChecked,
                                label: 'Remember Me',
                              ),
                              MyButton.text(
                                onPressed: controller.goToForgotPassword,
                                elevation: 0,
                                padding: MySpacing.xy(8, 0),
                                splashColor: UIConstants.contentTheme.secondary.withOpacity(0.1),
                                child: MyText.labelSmall(
                                  'Forgot password?',
                                  color: UIConstants.contentTheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          MySpacing.height(40),
                          Center(
                            child: ButtonWithLoadingOnAction(
                              text: 'Login',
                              onPressed: controller.onLogin,
                              isLoading: controller.loading,
                            ),
                          ),
                          Center(
                            child: MyButton.text(
                              onPressed: controller.goToRegister,
                              elevation: 0,
                              padding: MySpacing.x(16),
                              splashColor: UIConstants.contentTheme.secondary.withOpacity(0.1),
                              child: MyText.labelMedium(
                                'Create account',
                                color: UIConstants.contentTheme.secondary,
                              ),
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
