import 'package:qfinity/export.dart';

mixin ExportMixin on BaseController {
  String? fileUrl;
  String? secondFileUrl;
  String? voucherNo;

  Future<void> export({required ExportedFileType fileType});

  Future<void> secondExport({required ExportedFileType fileType}) async {}
}
