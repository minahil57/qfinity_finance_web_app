import 'package:qfinity/export.dart';

class WidgetRadius {
  double xs;
  double small;
  double medium;
  double large;

  WidgetRadius({this.xs = 2, this.small = 4, this.medium = 6, this.large = 8});
}

class ColorGroup {
  final Color color;
  final Color onColor;

  ColorGroup(this.color, this.onColor);
}

class MainAppTheme {
  static ThemeData theme = MainAppTheme.getThemeFromThemeMode();
  static TextDirection textDirection = TextDirection.ltr;

  static Color primaryColor = const Color(0xffD17E0F);

  static ThemeData getThemeFromThemeMode() {
    return ThemeCustomizer.instance.theme == ThemeMode.light ? lightTheme : darkTheme;
  }

  /// -------------------------- Light Theme  -------------------------------------------- ///

  static final ThemeData lightTheme = ThemeData(
    /// Brightness
    brightness: Brightness.light,

    /// Primary Color
    primaryColor: MainAppTheme.primaryColor,

    /// Scaffold and Background color
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffF5F5F5),
      iconTheme: IconThemeData(color: Color(0xff495057)),
      actionsIconTheme: IconThemeData(color: Color(0xff495057)),
    ),

    /// Card Theme
    cardTheme: const CardTheme(color: Color(0xffffffff)),
    cardColor: const Color(0xffffffff),

    /// Colorscheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffe5a10d),
    ),

    snackBarTheme: const SnackBarThemeData(actionTextColor: Colors.white),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MainAppTheme.primaryColor,
      splashColor: const Color(0xffeeeeee).withAlpha(100),
      highlightElevation: 8,
      elevation: 4,
      focusColor: MainAppTheme.primaryColor,
      hoverColor: MainAppTheme.primaryColor,
      foregroundColor: const Color(0xffeeeeee),
    ),

    /// Divider Theme
    dividerTheme: const DividerThemeData(color: Color(0xffdddddd), thickness: 1),
    dividerColor: const Color(0xffdddddd),

    /// Bottom AppBar Theme
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xffeeeeee), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: const Color(0xff495057),
      labelColor: MainAppTheme.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: MainAppTheme.primaryColor, width: 2),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: MainAppTheme.primaryColor,
      inactiveTrackColor: MainAppTheme.primaryColor.withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4,
      thumbColor: MainAppTheme.primaryColor,
      thumbShape: const RoundSliderThumbShape(),
      overlayShape: const RoundSliderOverlayShape(),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Color(0xffeeeeee),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return MainAppTheme.primaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? MainAppTheme.primaryColor : Colors.white,
      ),
    ),

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? MainAppTheme.primaryColor : null,
      ),
    ),

    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(
        Colors.grey.shade900.withOpacity(.6),
      ),
    ),

    /// Other Colors
    splashColor: Colors.white.withAlpha(100),
    indicatorColor: const Color(0xffeeeeee),
    highlightColor: const Color(0xffeeeeee),
  );

  /// -------------------------- Dark Theme  -------------------------------------------- ///
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    /// Brightness

    /// Scaffold and Background color
    scaffoldBackgroundColor: const Color(0xff262729),
    canvasColor: Colors.transparent,

    primaryColor: const Color(0xff4ddada),

    /// AppBar Theme
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff262729)),

    /// Card Theme
    cardTheme: const CardTheme(color: Color(0xff1b1b1c)),
    cardColor: const Color(0xff1b1b1c),

    /// Colorscheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffe5a10d),
      surface: const Color(0xff262729),
      onSurface: const Color(0xFFD7D7D7),
      brightness: Brightness.dark,
    ),

    /// Input (Text-Field) Theme
    inputDecorationTheme: const InputDecorationTheme(),

    /// Divider Color
    dividerTheme: const DividerThemeData(color: Color(0xff393A41), thickness: 1),
    dividerColor: const Color(0xff393A41),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MainAppTheme.primaryColor,
      splashColor: Colors.white.withAlpha(100),
      highlightElevation: 8,
      elevation: 4,
      focusColor: MainAppTheme.primaryColor,
      hoverColor: MainAppTheme.primaryColor,
      foregroundColor: Colors.white,
    ),

    /// Bottom AppBar Theme
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: const Color(0xff495057),
      labelColor: MainAppTheme.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: MainAppTheme.primaryColor, width: 2),
      ),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: MainAppTheme.primaryColor,
      inactiveTrackColor: MainAppTheme.primaryColor.withAlpha(100),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4,
      thumbColor: MainAppTheme.primaryColor,
      thumbShape: const RoundSliderThumbShape(),
      overlayShape: const RoundSliderOverlayShape(),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),

    ///Other Color
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffa3a3a3),
    highlightColor: const Color(0xff47484b),
    splashColor: Colors.white.withAlpha(100),
  );

  static ThemeData createTheme(ThemeMode themeType, Color seedColor) {
    if (themeType == ThemeMode.light) {
      return lightTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      );
    }
    return darkTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
        onSurface: const Color(0xFFDAD9CA),
      ),
    );
  }
}

class AppStyle {
  static void init() {
    initMyStyle();
    AdminTheme.setTheme();
  }

  static void changeMyTheme() {
    My.changeTheme(MainAppTheme.theme);
  }

  static void initMyStyle() {
    MyTextStyle.resetFontStyles();
    MyTextStyle.changeFontFamily(GoogleFonts.poppins);
    My.changeTheme(MainAppTheme.theme);
    My.setConstant(
      MyConstantData(
        containerRadius: AppStyle.containerRadius.medium,
        cardRadius: AppStyle.cardRadius.medium,
        buttonRadius: AppStyle.buttonRadius.medium,
        defaultBreadCrumbItem: MyBreadcrumbItem(name: 'Flatten', route: Routes.dashboard),
      ),
    );
    bool isMobile = true;
    try {
      isMobile = Platform.isAndroid || Platform.isIOS;
    } catch (_) {
      isMobile = false;
    }
    My.setFlexSpacing(isMobile ? 16 : 24);
  }

  /// -------------------------- Styles  -------------------------------------------- ///

  static WidgetRadius buttonRadius = WidgetRadius(small: 2, medium: 4);
  static WidgetRadius cardRadius = WidgetRadius(medium: 4);
  static WidgetRadius containerRadius = WidgetRadius(medium: 4);
  static WidgetRadius imageRadius = WidgetRadius(medium: 4);
}

class AppColors {
  static const Color star = Color(0xffFFC233);
  static const Color ratingStarColor = Color(0xFFF9A825);
  static const Color success = Color(0xff1abc9c);

  static ColorGroup pink = ColorGroup(const Color(0xffFFC2D9), const Color(0xffF5005E));
  static ColorGroup violet = ColorGroup(const Color(0xffD0BADE), const Color(0xff4E2E60));

  static ColorGroup blue = ColorGroup(const Color(0xffADD8FF), const Color(0xff004A8F));
  static ColorGroup green = ColorGroup(const Color(0xffAFE9DA), const Color(0xff165041));
  static ColorGroup orange = ColorGroup(const Color(0xffFFCEC2), const Color(0xffFF3B0A));
  static ColorGroup skyBlue = ColorGroup(const Color(0xffC2F0FF), const Color(0xff0099CC));
  static ColorGroup lavender = ColorGroup(const Color(0xffEAE2F3), const Color(0xff7748AD));
  static ColorGroup queenPink = ColorGroup(const Color(0xffE8D9DC), const Color(0xff804D57));
  static ColorGroup blueViolet = ColorGroup(const Color(0xffC5C6E7), const Color(0xff3B3E91));
  static ColorGroup rosePink = ColorGroup(const Color(0xffFCB1E0), const Color(0xffEC0999));

  static ColorGroup rubinRed = ColorGroup(const Color(0x98f6a8bd), const Color(0xffd03760));
  static ColorGroup favorite = rubinRed;
  static ColorGroup redOrange = ColorGroup(const Color(0xffFFAD99), const Color(0xffF53100));

  static Color notificationSuccessBGColor = const Color(0xff117E68);
  static Color notificationSuccessTextColor = const Color(0xffffffff);
  static Color notificationSuccessActionColor = const Color(0xffFFE815);

  static Color notificationErrorBGColor = const Color(0xfffcd9df);
  static Color notificationErrorTextColor = const Color(0xffFF3B0A);
  static Color notificationErrorActionColor = const Color(0xff3874ff);

  // static Color notificationErrorActionColor = Color(0xff006784);

  static List<ColorGroup> list = [
    redOrange,
    violet,
    blue,
    green,
    orange,
    skyBlue,
    lavender,
    blueViolet,
  ];

  static ColorGroup get random => list[Random().nextInt(list.length)];

  static ColorGroup get(int index) {
    return list[index % list.length];
  }

  static Color getColorByRating(int rating) {
    var colors = {
      1: const Color(0xfff0323c),
      2: const Color(0xcdf0323c),
      3: star,
      4: const Color(0xcd3cd278),
      5: const Color(0xff3cd278),
    };

    return colors[rating] ?? colors[1]!;
  }

  AppColors() {
    list.addAll([pink, violet, blue, green, orange]);
  }
}
