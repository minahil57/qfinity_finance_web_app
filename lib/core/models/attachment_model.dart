import 'package:qfinity/export.dart';

class AttachmentModel {
  int? recordId;
  String? fileName;
  String? description;
  XFile? imageFile;
  Uint8List? imageBytes;
  String? fileUrl;
  bool? isOldPic;

  AttachmentModel({
    this.recordId,
    this.fileName,
    this.description,
    this.imageFile,
    this.imageBytes,
    this.fileUrl,
    this.isOldPic,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) => AttachmentModel(
        recordId: json['recordId'],
        fileName: json['fileName'],
        description: json['description'],
        fileUrl: json['fileUrl'],
      );

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
        'description': description,
        'recordId': recordId,
        'fileUrl': fileUrl,
      };
}
