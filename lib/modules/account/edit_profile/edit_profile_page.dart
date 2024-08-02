import 'package:qfinity/export.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerPageLayout(
      pageTitle: 'Edit Profile',
      child: GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        if (controller.imageFile == null)
                          controller.loginModel.profileImage == null || controller.loginModel.profileImage!.isEmpty
                              ? const ProfileImageWrapper(
                                  child: GreyAvatar(),
                                )
                              : ProfileImageWrapper(
                                  child: CachedProfileImage(
                                    imageUrl: controller.loginModel.profileImage!,
                                  ),
                                )
                        else
                          ProfileImageWrapper(
                            child: Image.memory(
                              controller.imageBytes,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            padding: MySpacing.all(2.5),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.highlightColor,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                visualDensity: VisualDensity.compact,
                                icon: Icon(
                                  FontAwesomeIcons.lightCamera,
                                  color: theme.primaryColor,
                                  size: 18,
                                ),
                                onPressed: controller.loading ? null : controller.pickImage,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(20),
                    Form(
                      key: controller.basicValidator.formKey,
                      autovalidateMode: controller.autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFormField(
                            title: 'Full Name',
                            label: 'Full Name',
                            controller: controller.basicValidator.getController('fullName'),
                            validator: controller.basicValidator.getValidation('fullName'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightUser,
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
                            title: 'Contact Number',
                            label: 'Contact Number',
                            controller: controller.basicValidator.getController('contactNo'),
                            validator: controller.basicValidator.getValidation('contactNo'),
                            loading: controller.loading,
                            prefixIcon: FontAwesomeIcons.lightPhone,
                            keyboardType: TextInputType.phone,
                          ),
                          Center(
                            child: ButtonWithLoadingOnAction(
                              text: 'Save',
                              onPressed: controller.onSave,
                              isLoading: controller.loading,
                            ),
                          ),
                        ],
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
