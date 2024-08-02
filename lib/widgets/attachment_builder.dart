import 'package:qfinity/export.dart';

class AttachmentBuilder<T extends AttachmentMixin> extends StatelessWidget {
  const AttachmentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return AttachmentWidget(
          descriptionController: controller.attachmentDescriptionTextEditingController,
          onChooseFilePressed: controller.onChooseFilePressed,
          imageBytes: controller.imageBytes,
          isEditingAttachment: controller.isEditingAttachment,
          onAddAttachmentPressed: controller.onAddAttachmentPressed,
          onResetAttachmentPressed: controller.onResetAttachmentPressed,
          onUpdateAttachmentPressed: controller.onUpdateAttachmentPressed,
          attachments: controller.attachments,
          editSingleAttachment: controller.editSingleAttachment,
          deleteSingleAttachment: controller.deleteSingleAttachment,
        );
      },
    );
  }
}
