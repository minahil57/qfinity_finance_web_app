import 'package:qfinity/export.dart';

class CreateCompanyAccountPage extends StatelessWidget {
  const CreateCompanyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<CreateCompanyAccountController>(
        init: CreateCompanyAccountController(),
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
                              AppImages.createAccount,
                              fit: BoxFit.cover,
                              height: 500,
                            )
                          : type == MyScreenMediaType.xl
                              ? Image.asset(
                                  AppImages.createAccount,
                                  fit: BoxFit.cover,
                                  height: 500,
                                )
                              : type == MyScreenMediaType.lg
                                  ? Image.asset(
                                      AppImages.createAccount,
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
                    padding: MySpacing.y(20),
                    child: Form(
                      key: controller.basicValidator.formKey,
                      autovalidateMode: controller.autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: MyText.titleLarge(
                              'Register',
                              fontWeight: 700,
                            ),
                          ),
                          MySpacing.height(10),
                          const Center(
                            child: MyText.bodySmall(
                              'Create a demo account to try out our system',
                              muted: true,
                            ),
                          ),
                          MySpacing.height(45),
                          CustomFormField(
                            title: 'Full Name',
                            label: 'Full Name',
                            controller: controller.basicValidator.getController('fullName'),
                            validator: controller.basicValidator.getValidation('fullName'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightUser,
                          ),
                          CustomFormField(
                            title: 'Company Name',
                            label: 'Company Name',
                            controller: controller.basicValidator.getController('companyName'),
                            validator: controller.basicValidator.getValidation('companyName'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightBuilding,
                          ),
                          CustomFormField(
                            title: 'Contact Number',
                            label: 'Contact Number',
                            controller: controller.basicValidator.getController('contactNo'),
                            validator: controller.basicValidator.getValidation('contactNo'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightPhone,
                            keyboardType: TextInputType.phone,
                          ),
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
                            onFieldSubmitted: (_) => controller.onCreateCompanyAccount(),
                            suffixIcon: PasswordIcon(
                              isShown: controller.showPassword,
                              onTap: controller.onChangeShowPassword,
                            ),
                            marginBottom: 2,
                          ),
                          MySpacing.height(30),
                          Center(
                            child: ButtonWithLoadingOnAction(
                              text: 'Create Account',
                              onPressed: controller.onCreateCompanyAccount,
                              isLoading: controller.loading,
                            ),
                          ),
                          Center(
                            child: MyButton.text(
                              onPressed: controller.goToLogin,
                              elevation: 0,
                              padding: MySpacing.x(16),
                              splashColor: UIConstants.contentTheme.secondary.withOpacity(0.1),
                              child: MyText.labelMedium(
                                'Already have an account? Login',
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
