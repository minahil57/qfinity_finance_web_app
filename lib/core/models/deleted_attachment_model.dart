class DeletedAttachmentModel {
  int? recordId;

  DeletedAttachmentModel({
    this.recordId,
  });

  factory DeletedAttachmentModel.fromJson(Map<String, dynamic> json) => DeletedAttachmentModel(
        recordId: json['recordId'],
      );

  Map<String, dynamic> toJson() => {
        'recordId': recordId,
      };
}
