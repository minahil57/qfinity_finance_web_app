part of 'endpoints.dart';

class _Uploads {
  final String _apiBaseUrl;

  factory _Uploads({required String apiBaseUrl}) {
    _instance ??= _Uploads._sharedInstance(
      apiBaseUrl: apiBaseUrl,
    );
    return _instance!;
  }

  _Uploads._sharedInstance({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;
  static _Uploads? _instance;

  String get _controllerName => '$_apiBaseUrl/general/Uploads';

  String get uploadToFinancePostingAttachments => '$_controllerName/UploadToFinancePostingAttachments';

  String get deleteFromFinancePostingAttachments => '$_controllerName/DeleteFromFinancePostingAttachments';

  String get uploadToUserProfile => '$_controllerName/UploadToUserProfile';

  String get deleteFromUserProfile => '$_controllerName/DeleteFromUserProfile';
}
