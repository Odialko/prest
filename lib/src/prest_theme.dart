import 'package:flutter/material.dart';

/// LUXURY COLOR PALETTE
/// Defined as constants to ensure consistency across light and dark modes
class PrestColors {
  PrestColors._();

  // Premium Foundations
  static const white = Color(0xFFF9F9F7);
  static const milk = Color(0xFFF1F1E6);
  static const chineseBlack = Color(0xFF121212);
  static const raisinBlack = Color(0xFF1A1A1A);

  // Accents & Grays
  static const neonBlue = Color(0xFF002366);
  static const gold = Color(0xFFC5A059);
  static const spanishGray = Color(0xFF9E9E9E);
  static const gray = Color(0xFFBDBDBD);
  static const arsenic = Color(0xFF424242);
  static const sonicSilver = Color(0xFF767676);
  static const silverChalice = Color(0xFFA9A9A9);

  // Semantic Colors
  static const redSolid = Color(0xFFAF2D2D);
  static const niagara = Color(0xFF05A898);
}

/// BASE FONT SIZES
/// Hierarchy from Hero headers to tiny legal text
class _BaseFonts {
  _BaseFonts._();
  static const fontSizes = [
    64.0, // font0: Hero Header
    48.0, // font1: Section Title
    34.0, // font2: Sub-title
    22.0, // font3: Card Title
    18.0, // font4: Navigation item
    16.0, // font5: Main Body
    14.0, // font6: Small body / Button
    12.0, // font7: Footnote
    10.0, // font8: Caption
    9.0   // font9: Legal / Micro
  ];
}

/// TEXT THEME HOLDER
/// Manages font families and scaling for specific colors
class PrestTextTheme {
  final List<TextStyle> styles;
  PrestTextTheme._(this.styles);

  factory PrestTextTheme.fromColor(Color color) {
    return PrestTextTheme._(
      List.generate(
        _BaseFonts.fontSizes.length,
            (index) => TextStyle(
          fontSize: _BaseFonts.fontSizes[index],
          color: color,
          height: 1.4,
          fontFamily: 'Inter',
          fontWeight: index < 3 ? FontWeight.w300 : FontWeight.w400,
          letterSpacing: index < 2 ? 8.0 : 0.5, // Wide tracking for headers
        ),
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
  TextStyle get font8 => styles[8];
  TextStyle get font9 => styles[9];
}

/// COLOR THEME HOLDER
/// Centralized access to the brand colors
class PrestColorTheme {
  final Color background;
  final Color white;
  final Color milk;
  final Color chineseBlack;
  final Color neonBlue;
  final Color gold;
  final Color gray;
  final Color arsenic;
  final Color raisinBlack;
  final Color black;
  final Color redSolid;
  final Color niagara;

  const PrestColorTheme({
    required this.background,
    required this.white,
    required this.milk,
    required this.chineseBlack,
    required this.neonBlue,
    required this.gold,
    required this.gray,
    required this.arsenic,
    required this.raisinBlack,
    required this.black,
    required this.redSolid,
    required this.niagara,
  });
}

/// PREST THEME DATA
/// The main object provided by the InheritedWidget
class PrestThemeData {
  final PrestColorTheme colors;
  final PrestTextTheme defaultTextTheme;
  final PrestTextTheme whiteTextTheme;
  final PrestTextTheme neonBlueTextTheme;
  final PrestTextTheme goldTextTheme;
  final PrestTextTheme arsenicTextTheme;
  final PrestTextTheme grayTextTheme;
  final PrestTextTheme blackTextTheme;
  final PrestTextTheme redSolidTextTheme;
  final PrestTextTheme niagaraTextTheme;

  PrestThemeData({
    required this.colors,
    required this.defaultTextTheme,
    required this.whiteTextTheme,
    required this.neonBlueTextTheme,
    required this.goldTextTheme,
    required this.arsenicTextTheme,
    required this.grayTextTheme,
    required this.blackTextTheme,
    required this.redSolidTextTheme,
    required this.niagaraTextTheme,
  });
}

/// INHERITED WIDGET
/// Facilitates the propagation of theme data down the widget tree
class PrestTheme extends InheritedWidget {
  final PrestThemeData data;
  const PrestTheme({required super.child, super.key, required this.data});

  static PrestThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PrestTheme>()?.data ?? defaultLightTheme;
  }

  @override
  bool updateShouldNotify(covariant PrestTheme oldWidget) => data != oldWidget.data;
}

/// THEME CONFIGURATIONS
final PrestThemeData defaultLightTheme = _buildTheme(Brightness.light);
final PrestThemeData defaultDarkTheme = _buildTheme(Brightness.dark);

PrestThemeData _buildTheme(Brightness brightness) {
  final isLight = brightness == Brightness.light;

  final colorTheme = PrestColorTheme(
    background: isLight ? PrestColors.white : PrestColors.chineseBlack,
    white: PrestColors.white,
    milk: PrestColors.milk,
    chineseBlack: PrestColors.chineseBlack,
    neonBlue: PrestColors.neonBlue,
    gold: PrestColors.gold,
    gray: PrestColors.gray,
    arsenic: isLight ? PrestColors.arsenic : PrestColors.white,
    raisinBlack: PrestColors.raisinBlack,
    black: isLight ? PrestColors.chineseBlack : PrestColors.white,
    redSolid: PrestColors.redSolid,
    niagara: PrestColors.niagara,
  );

  return PrestThemeData(
    colors: colorTheme,
    defaultTextTheme: PrestTextTheme.fromColor(colorTheme.arsenic),
    whiteTextTheme: PrestTextTheme.fromColor(PrestColors.white),
    neonBlueTextTheme: PrestTextTheme.fromColor(PrestColors.neonBlue),
    goldTextTheme: PrestTextTheme.fromColor(PrestColors.gold),
    arsenicTextTheme: PrestTextTheme.fromColor(PrestColors.arsenic),
    grayTextTheme: PrestTextTheme.fromColor(PrestColors.gray),
    blackTextTheme: PrestTextTheme.fromColor(isLight ? PrestColors.chineseBlack : PrestColors.white),
    redSolidTextTheme: PrestTextTheme.fromColor(PrestColors.redSolid),
    niagaraTextTheme: PrestTextTheme.fromColor(PrestColors.niagara),
  );
}

/// CONTEXT EXTENSION
extension PrestThemeContext on BuildContext {
  PrestThemeData get prestTheme => PrestTheme.of(this);
}