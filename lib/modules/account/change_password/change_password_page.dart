import 'package:qfinity/export.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerPageLayout(
      pageTitle: 'Change Password',
      child: GetBuilder<ChangePasswordController>(
        init: ChangePasswordController(),
        builder: (controller) {
          return Column(
            children: [
              Form(
                key: controller.basicValidator.formKey,
                autovalidateMode: controller.autovalidateMode,
                child: Column(
                  children: [
                    CustomFormField(
                      title: 'New Password',
                      label: 'New Password',
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
                      title: 'Confirm New Password',
                      label: 'Confirm New Password',
                      controller: controller.basicValidator.getController('confirmPassword'),
                      validator: controller.basicValidator.getValidation('confirmPassword'),
                      loading: controller.loading,
                      prefixIcon: FontAwesomeIcons.lightLock,
                      obscureText: !controller.showConfirmPassword,
                      onFieldSubmitted: (_) => controller.onChangePassword(),
                      suffixIcon: PasswordIcon(
                        isShown: controller.showConfirmPassword,
                        onTap: controller.onChangeShowConfirmPassword,
                      ),
                    ),
                    Center(
                      child: ButtonWithLoadingOnAction(
                        text: 'Save',
                        onPressed: controller.onChangePassword,
                        isLoading: controller.loading,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
