import 'package:flutter/material.dart';

/// COLORS
class PrestColors {
  PrestColors._();

  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const milk = Color.fromRGBO(250, 250, 245, 1);
  static const spanishGray = Color.fromRGBO(158, 158, 158, 1);
  static const chineseBlack = Color.fromRGBO(18, 18, 18, 1);
  static const neonBlue = Color.fromRGBO(17, 0, 168, 1);
  static const gray = Color.fromRGBO(189, 189, 189, 1);
  static const arsenic = Color.fromRGBO(66, 66, 66, 1);
  static const raisinBlack = Color.fromRGBO(33, 33, 33, 1);
  static const sonicSilver = Color.fromRGBO(118, 118, 118, 1);
  static const silverChalice = Color.fromRGBO(169, 169, 169, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const redSolid = Color.fromRGBO(255, 0, 0, 1);
  static const niagara = Color.fromRGBO(5, 168, 152, 1);
  static const japaneseLaurel = Color.fromRGBO(13, 168, 1, 1);
}

/// BASE FONT SIZES
class _BaseFonts {
  _BaseFonts._();
  static const fontSizes = [
    40.0, 34.0, 22.0, 18.0, 16.0, 14.0, 12.0, 10.0,
  ];
}

/// TEXT THEME
class PrestTextTheme {
  PrestTextTheme._(this.styles);
  final List<TextStyle> styles;

  factory PrestTextTheme.fromColor(Color color) {
    return PrestTextTheme._(
      List.generate(
        _BaseFonts.fontSizes.length,
            (index) => TextStyle(fontSize: _BaseFonts.fontSizes[index], color: color),
      ),
    );
  }

  TextStyle get font0 => styles[0];
  TextStyle get font1 => styles[1];
  TextStyle get font2 => styles[2];
  TextStyle get font3 => styles[3];
  TextStyle get font4 => styles[4];
  TextStyle get font5 => styles[5];
  TextStyle get font6 => styles[6];
  TextStyle get font7 => styles[7];
}

/// COLOR THEME
class PrestColorTheme {
  const PrestColorTheme({
    required this.white,
    required this.milk,
    required this.spanishGray,
    required this.chineseBlack,
    required this.neonBlue,
    required this.gray,
    required this.arsenic,
    required this.raisinBlack,
    required this.sonicSilver,
    required this.silverChalice,
    required this.black,
    required this.redSolid,
    required this.niagara,
    required this.japaneseLaurel,
  });

  final Color white;
  final Color milk;
  final Color spanishGray;
  final Color chineseBlack;
  final Color neonBlue;
  final Color gray;
  final Color arsenic;
  final Color raisinBlack;
  final Color sonicSilver;
  final Color silverChalice;
  final Color black;
  final Color redSolid;
  final Color niagara;
  final Color japaneseLaurel;
}

/// Prest THEME DATA
class PrestThemeData {
  PrestThemeData({required this.textThemes, required this.colors});

  final Map<String, PrestTextTheme> textThemes;
  final PrestColorTheme colors;

  PrestTextTheme getTextTheme(String colorName) => textThemes[colorName] ?? textThemes['text']!;

  // getters
  PrestTextTheme get defaultTextTheme => getTextTheme('text');
  PrestTextTheme get whiteTextTheme => getTextTheme('white');
  PrestTextTheme get neonBlueTextTheme => getTextTheme('neonBlue');
  PrestTextTheme get arsenicTextTheme => getTextTheme('arsenic');
  PrestTextTheme get grayTextTheme => getTextTheme('gray');
  PrestTextTheme get blackTextTheme => getTextTheme('black');
  PrestTextTheme get redSolidTextTheme => getTextTheme('redSolid');
  PrestTextTheme get niagaraTextTheme => getTextTheme('niagara');
}

/// INHERITED WIDGET
class PrestTheme extends InheritedWidget {
  const PrestTheme({required super.child, super.key, required this.data}) : super();
  final PrestThemeData data;

  static PrestThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<PrestTheme>();
    return theme?.data ?? defaultLightTheme;
  }

  static PrestThemeData get light => defaultLightTheme;
  static PrestThemeData get dark => defaultDarkTheme;

  @override
  bool updateShouldNotify(covariant PrestTheme oldWidget) => data != oldWidget.data;
}

/// DEFAULT LIGHT THEME
final PrestThemeData defaultLightTheme = PrestThemeData(
  colors: const PrestColorTheme(
    white: PrestColors.white,
    milk: PrestColors.milk,
    spanishGray: PrestColors.spanishGray,
    chineseBlack: PrestColors.chineseBlack,
    neonBlue: PrestColors.neonBlue,
    gray: PrestColors.gray,
    arsenic: PrestColors.arsenic,
    raisinBlack: PrestColors.raisinBlack,
    sonicSilver: PrestColors.sonicSilver,
    silverChalice: PrestColors.silverChalice,
    black: PrestColors.black,
    redSolid: PrestColors.redSolid,
    niagara: PrestColors.niagara,
    japaneseLaurel: PrestColors.japaneseLaurel,
  ),
  textThemes: {
    'white': PrestTextTheme.fromColor(PrestColors.white),
    'neonBlue': PrestTextTheme.fromColor(PrestColors.neonBlue),
    'arsenic': PrestTextTheme.fromColor(PrestColors.arsenic),
    'gray': PrestTextTheme.fromColor(PrestColors.gray),
    'black': PrestTextTheme.fromColor(PrestColors.black),
    'redSolid': PrestTextTheme.fromColor(PrestColors.redSolid),
    'niagara': PrestTextTheme.fromColor(PrestColors.niagara),
    'text': PrestTextTheme.fromColor(PrestColors.arsenic),
  },
);

/// DEFAULT DARK THEME
final PrestThemeData defaultDarkTheme = PrestThemeData(
  colors: const PrestColorTheme(
    white: PrestColors.white,
    milk: PrestColors.milk,
    spanishGray: PrestColors.spanishGray,
    chineseBlack: PrestColors.chineseBlack,
    neonBlue: PrestColors.neonBlue,
    gray: PrestColors.gray,
    arsenic: PrestColors.arsenic,
    raisinBlack: PrestColors.raisinBlack,
    sonicSilver: PrestColors.sonicSilver,
    silverChalice: PrestColors.silverChalice,
    black: PrestColors.black,
    redSolid: PrestColors.redSolid,
    niagara: PrestColors.niagara,
    japaneseLaurel: PrestColors.japaneseLaurel,
  ),
  textThemes: {
    'white': PrestTextTheme.fromColor(PrestColors.white),
    'neonBlue': PrestTextTheme.fromColor(PrestColors.neonBlue),
    'arsenic': PrestTextTheme.fromColor(PrestColors.white),
    'gray': PrestTextTheme.fromColor(PrestColors.gray),
    'black': PrestTextTheme.fromColor(PrestColors.white),
    'redSolid': PrestTextTheme.fromColor(PrestColors.redSolid),
    'niagara': PrestTextTheme.fromColor(PrestColors.niagara),
    'text': PrestTextTheme.fromColor(PrestColors.white),
  },
);

/// MATERIAL THEME FACTORY
class PrestThemeFactory {
  static ThemeData light() {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: PrestColors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: PrestColors.white,
        selectedItemColor: PrestColors.neonBlue,
        unselectedItemColor: PrestColors.gray,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: PrestColors.chineseBlack,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: PrestColors.chineseBlack,
        selectedItemColor: PrestColors.white,
        unselectedItemColor: PrestColors.gray,
      ),
    );
  }
}
