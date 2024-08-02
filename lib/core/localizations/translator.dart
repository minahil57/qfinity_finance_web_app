import 'package:qfinity/export.dart';

abstract final class Translator {
  static Map<String, String>? _localizedStrings;

  static Future<bool> changeLanguage(Language language) async {
    try {
      String jsonString = await rootBundle.loadString('assets/lang/${language.locale.languageCode}.json');
      Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
      _localizedStrings = jsonLanguageMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  // called from every screens which needs a localized text
  static String translate(String text) {
    if (_localizedStrings != null) {
      String? value = _localizedStrings![text];
      return value ?? autoTranslate(text);
    }

    return autoTranslate(text);
  }

  static String autoTranslate(String text) {
    // log("You need to translate this text : " + text);
    at(text);

    try {
      List<String> texts = text.split('_');
      StringBuffer stringBuffer = StringBuffer();
      for (final String singleText in texts) {
        stringBuffer.write('${singleText[0].toUpperCase()}${singleText.substring(1)} ');
      }
      String result = stringBuffer.toString();
      return result.substring(0, result.length - 1);
    } catch (err) {
      return text;
    }
  }

  static Future<void> at(String t) async {
    // print("at");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = sharedPreferences.getStringList('test_tr') ?? [];
    var set = data.toSet()..add(t);
    sharedPreferences.setStringList('test_tr', set.toList());
  }
}
