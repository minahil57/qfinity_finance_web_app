import 'package:qfinity/export.dart';

class AttachmentWidget extends StatelessWidget {
  const AttachmentWidget({
    super.key,
    required this.descriptionController,
    required this.onChooseFilePressed,
    required this.imageBytes,
    required this.isEditingAttachment,
    required this.onAddAttachmentPressed,
    required this.onResetAttachmentPressed,
    required this.onUpdateAttachmentPressed,
    required this.attachments,
    required this.editSingleAttachment,
    required this.deleteSingleAttachment,
    this.attachmentRecordId,
    this.fileUrl,
  });

  final TextEditingController descriptionController;
  final VoidCallback onChooseFilePressed;
  final Uint8List? imageBytes;
  final bool isEditingAttachment;
  final VoidCallback onAddAttachmentPressed;
  final VoidCallback onResetAttachmentPressed;
  final VoidCallback onUpdateAttachmentPressed;
  final List<AttachmentModel> attachments;
  final void Function(AttachmentModel) editSingleAttachment;
  final void Function(AttachmentModel) deleteSingleAttachment;
  final int? attachmentRecordId;
  final String? fileUrl;

  @override
  Widget build(BuildContext context) {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: flexSpacing * .5),
            child: const SectionTitleWidget(title: 'Attachments'),
          ),
          MySpacing.height(flexSpacing * 1.5),
          MyFlex(
            children: [
              MyFlexItem(
                sizes: 'lg-12 md-12 sm-12',
                child: Column(
                  children: [
                    LabeledTextField(
                      label: 'Description',
                      hintText: 'Enter Description',
                      textController: descriptionController,
                    ),
                    MySpacing.height(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: onChooseFilePressed,
                          child: const Text('Choose File'),
                        ),
                        const SizedBox(height: 20),
                        ProfileImageWrapper(
                          child: Visibility(
                            visible: imageBytes != null || attachmentRecordId != null,
                            replacement: const Icon(
                              Icons.cloud_upload,
                              size: 100,
                              color: Color.fromARGB(255, 202, 198, 198),
                            ),
                            child: imageBytes != null
                                ? Image.memory(
                                    imageBytes!,
                                    fit: BoxFit.cover,
                                  )
                                : (fileUrl != null
                                    ? Image.network(
                                        fileUrl!,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox.shrink()),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
              MyFlexItem(
                sizes: 'lg-12 md-12 sm-12',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(
                      onPressed: isEditingAttachment ? onUpdateAttachmentPressed : onAddAttachmentPressed,
                      elevation: 0,
                      padding: MySpacing.xy(20, 16),
                      borderRadiusAll: AppStyle.buttonRadius.medium,
                      backgroundColor: UIConstants.contentTheme.secondary,
                      child: Row(
                        children: [
                          MyText.bodySmall(
                            isEditingAttachment ? 'Update' : 'Add',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MySpacing.width(16),
                    MyButton(
                      onPressed: onResetAttachmentPressed,
                      elevation: 0,
                      padding: MySpacing.xy(20, 16),
                      borderRadiusAll: AppStyle.buttonRadius.medium,
                      backgroundColor: UIConstants.contentTheme.danger,
                      child: Row(
                        children: [
                          MySpacing.width(8),
                          const MyText.bodySmall(
                            'Reset',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MyFlexItem(
                sizes: 'lg-12 md-12 sm-12',
                child: DataTableWrapper(
                  columnsNames: const [
                    'View',
                    'Description',
                    'File Name',
                    'Actions',
                  ],
                  rows: attachments.map<DataRow>((a) {
                    return DataRow(
                      cells: [
                        DataCell(
                          IconButton(
                            onPressed: () async {
                              if (a.recordId != 0) {
                                await AttachmentHelper.showFromNetworkImageDialog(
                                  a.fileUrl!,
                                );
                              } else {
                                Uint8List bytes = await a.imageFile!.readAsBytes();
                                await AttachmentHelper.showFromMemoryImageDialog(
                                  bytes,
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.link,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        DataCell(Text(a.description ?? '')),
                        DataCell(Text(a.fileName ?? '')),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  editSingleAttachment(a);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  deleteSingleAttachment(a);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
