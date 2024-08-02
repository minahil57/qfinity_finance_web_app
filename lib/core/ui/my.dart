import 'package:qfinity/export.dart';

class My {
  // entry point of the package
  void init() {}

  static void changeTheme(ThemeData theme) {
    AppTheme.theme = theme;
  }

  static void setTextDirection(TextDirection direction) {
    AppTheme.textDirection = direction;
  }

  static void changeFontFamily(GoogleFontFunction fontFamily) {
    MyTextStyle.changeFontFamily(fontFamily);
  }

  static void changeDefaultFontWeight(Map<int, FontWeight> defaultFontWeight) {
    MyTextStyle.changeDefaultFontWeight(defaultFontWeight);
  }

  static void changeDefaultTextFontWeight(
    Map<MyTextType, int> defaultFontWeight,
  ) {
    MyTextStyle.changeDefaultTextFontWeight(defaultFontWeight);
  }

  static void changeDefaultTextSize(Map<MyTextType, double> defaultTextSize) {
    MyTextStyle.changeDefaultTextSize(defaultTextSize);
  }

  static void changeDefaultLetterSpacing(
    Map<MyTextType, double> defaultLetterSpacing,
  ) {
    MyTextStyle.changeDefaultLetterSpacing(defaultLetterSpacing);
  }

  static void setConstant(MyConstantData constantData) {
    MyConstant.constant = constantData;
  }

  static void setFlexSpacing(double spacing) {
    MyScreenMedia.flexSpacing = spacing;
  }

  static void setFlexColumns(int columns) {
    MyScreenMedia.flexColumns = columns;
  }
}
