part of 'api_provider.dart';

class _Uploads {
  factory _Uploads() {
    _instance ??= _Uploads._sharedInstance();
    return _instance!;
  }

  _Uploads._sharedInstance();

  static _Uploads? _instance;

  Future<List<String>> uploadToFinancePostingAttachments({
    required List<XFile> files,
  }) async {
    return DioHelper.uploadFiles(
      files: files,
      endPoint: EndPoints.uploads.uploadToFinancePostingAttachments,
    );
  }

  Future<List<String>> uploadToUserProfile({
    required List<XFile> files,
  }) async {
    return DioHelper.uploadFiles(
      files: files,
      endPoint: EndPoints.uploads.uploadToUserProfile,
    );
  }
}
