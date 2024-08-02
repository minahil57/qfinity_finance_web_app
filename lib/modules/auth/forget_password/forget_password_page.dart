import 'package:qfinity/export.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
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
                              AppImages.forgetPassword,
                              fit: BoxFit.fitHeight,
                              height: 500,
                            )
                          : type == MyScreenMediaType.xl
                              ? Image.asset(
                                  AppImages.forgetPassword,
                                  fit: BoxFit.fitHeight,
                                  height: 500,
                                )
                              : type == MyScreenMediaType.lg
                                  ? Image.asset(
                                      AppImages.forgetPassword,
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
                    padding: MySpacing.y(28),
                    child: Form(
                      key: controller.basicValidator.formKey,
                      autovalidateMode: controller.autovalidateMode,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(
                              child: MyText.titleLarge(
                                'Forgot Password',
                                fontWeight: 700,
                              ),
                            ),
                            MySpacing.height(40),
                            Row(
                              children: [
                                MyText.titleMedium(
                                  'I want to receive my password reset OTP '
                                  'via:',
                                  fontWeight: 500,
                                  color: UIConstants.contentTheme.secondary,
                                ),
                              ],
                            ),
                            MySpacing.height(15),
                            Row(
                              children: [
                                CustomToggleButton(
                                  isSelected: controller.selectedOtpMethod,
                                  onPressed: controller.onSelectOtpMethod,
                                  children: const [
                                    CustomToggleButtonItem(
                                      label: 'Email',
                                      icon: FontAwesomeIcons.lightEnvelope,
                                    ),
                                    CustomToggleButtonItem(
                                      label: 'SMS',
                                      icon: FontAwesomeIcons.lightMessageSms,
                                    ),
                                    CustomToggleButtonItem(
                                      label: 'WhatsApp',
                                      icon: FontAwesomeIcons.whatsapp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            MySpacing.height(40),
                            if (controller.selectedOtpMethod[0])
                              ForgetPasswordFormField(
                                validator: controller.basicValidator.getValidation('email'),
                                controller: controller.basicValidator.getController('email'),
                                loading: controller.loading,
                                icon: FontAwesomeIcons.lightEnvelope,
                                title: 'Email Address',
                                label: 'Enter your email address',
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (_) => controller.onForgetPassword(),
                              ),
                            if (controller.selectedOtpMethod[1])
                              ForgetPasswordFormField(
                                validator: controller.basicValidator.getValidation('phoneNumber'),
                                controller: controller.basicValidator.getController('phoneNumber'),
                                loading: controller.loading,
                                icon: FontAwesomeIcons.lightMessageSms,
                                title: 'Phone Number',
                                label: 'Enter your phone number',
                                keyboardType: TextInputType.phone,
                                onFieldSubmitted: (_) => controller.onForgetPassword(),
                              ),
                            if (controller.selectedOtpMethod[2])
                              ForgetPasswordFormField(
                                validator: controller.basicValidator.getValidation('whatsappNumber'),
                                controller: controller.basicValidator.getController('whatsappNumber'),
                                loading: controller.loading,
                                icon: FontAwesomeIcons.whatsapp,
                                title: 'WhatsApp Number',
                                label: 'Enter your WhatsApp number',
                                keyboardType: TextInputType.phone,
                                onFieldSubmitted: (_) => controller.onForgetPassword(),
                              ),
                            MySpacing.height(20),
                            Column(
                              children: [
                                ButtonWithLoadingOnAction(
                                  text: 'Send OTP',
                                  onPressed: controller.onForgetPassword,
                                  isLoading: controller.loading,
                                ),
                                MyButton.text(
                                  onPressed: controller.goToLogIn,
                                  elevation: 0,
                                  padding: MySpacing.x(16),
                                  splashColor: UIConstants.contentTheme.secondary.withOpacity(0.1),
                                  child: MyText.labelMedium(
                                    'Back to login',
                                    color: UIConstants.contentTheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
