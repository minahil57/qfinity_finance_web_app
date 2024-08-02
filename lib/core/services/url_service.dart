import 'package:qfinity/export.dart';

abstract final class UrlService {
  static Future<void> goToUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
