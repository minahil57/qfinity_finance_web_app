import 'package:qfinity/export.dart';

mixin AttachmentMixin on BaseController {
  Uint8List? imageBytes;
  List<AttachmentModel> attachments = [];
  bool isEditingAttachment = false;
  final attachmentDescriptionTextEditingController = TextEditingController();

  int? attachmentRecordId;
  String? fileUrl;

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  AttachmentModel? _editingAttachment;

  Future<void> onChooseFilePressed() async {
    _imageFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_imageFile == null) return;
    imageBytes = await _imageFile!.readAsBytes();
    AppLogger.d('imageFile!.path --------------------->>> ${_imageFile!.path}');
    update();
  }

  void onAddAttachmentPressed() {
    isEditingAttachment = false;
    if (attachmentDescriptionTextEditingController.text.isEmpty || imageBytes == null) {
      Snackbars.warningWithTitle('Error', 'Description and File are required.');
      return;
    } else {
      var newAttachment = AttachmentModel(
        fileName: _imageFile?.name,
        description: attachmentDescriptionTextEditingController.text,
        imageFile: _imageFile,
        imageBytes: imageBytes,
        recordId: 0,
      );

      attachments.add(newAttachment);

      onResetAttachmentPressed();
      update();
    }
  }

  Future<void> editSingleAttachment(
    AttachmentModel attachment,
  ) async {
    _editingAttachment = attachment;
    isEditingAttachment = true;
    attachmentDescriptionTextEditingController.text = attachment.description?.toString() ?? '';

    if (attachment.recordId == 0) {
      imageBytes = attachment.imageBytes;
      attachmentRecordId = 0;
    } else {
      attachmentRecordId = attachment.recordId;
      fileUrl = attachment.fileUrl;
    }
    update();
  }

  void onResetAttachmentPressed() {
    attachmentDescriptionTextEditingController.clear();
    imageBytes = null;
    _imageFile = null;
    isEditingAttachment = false;
    imageBytes = null;
    attachmentRecordId = null;
    update();
  }

  void onUpdateAttachmentPressed() {
    var editingAttachment = _editingAttachment;

    if (attachmentDescriptionTextEditingController.text.isEmpty || imageBytes == null) {
      Snackbars.warningWithTitle('Error', 'Description and File are required.');
      return;
    } else {
      if (editingAttachment?.recordId != 0) {
        editingAttachment?.isOldPic = true;
      }

      editingAttachment?.description = attachmentDescriptionTextEditingController.text;
      editingAttachment?.fileName = _imageFile?.name;
      editingAttachment?.imageFile = _imageFile;
      editingAttachment?.imageBytes = imageBytes;
    }

    _editingAttachment = null;
    isEditingAttachment = false;

    onResetAttachmentPressed();

    update();
  }

  void deleteSingleAttachment(AttachmentModel attachment) {
    attachments.remove(attachment);
    update();
  }

  Future<List<AttachmentModel>> uploadImages() async {
    for (final element in attachments) {
      if (element.recordId == 0 || (element.isOldPic != null && element.isOldPic! == true)) {
        var uploadedImage = await _uploadAttachmentImage(element.imageFile);
        element.fileName = uploadedImage;
      }
    }

    return attachments;
  }

  Future<String?> _uploadAttachmentImage(XFile? file) async {
    var response = await ApiProvider.uploads.uploadToFinancePostingAttachments(
      files: [file!],
    );
    if (response.isNotEmpty) {
      return response[0];
    } else {
      return null;
    }
  }

  void disposeAttachmentMixinResources() {
    attachmentDescriptionTextEditingController.dispose();
  }
}
