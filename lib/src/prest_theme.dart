import 'package:flutter/material.dart';

/// LUXURY COLOR PALETTE
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

  // Semantic
  static const redSolid = Color(0xFFAF2D2D);
  static const niagara = Color(0xFF05A898);
  static const japaneseLaurel = Color(0xFF0D6E01);
}

/// BASE FONT SIZES
class _BaseFonts {
  _BaseFonts._();
  static const fontSizes = [40.0, 34.0, 22.0, 18.0, 16.0, 14.0, 12.0, 10.0];
}

/// TEXT THEME HOLDER
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
          height: 1.2,
          fontFamily: 'Inter', // Recommended for premium look
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
}

/// COLOR THEME HOLDER
class PrestColorTheme {
  final Color background; // Universal background getter
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
class PrestTheme extends InheritedWidget {
  final PrestThemeData data;
  const PrestTheme({required super.child, super.key, required this.data});

  static PrestThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PrestTheme>()?.data ?? defaultLightTheme;
  }

  static PrestThemeData get light => defaultLightTheme;
  static PrestThemeData get dark => defaultDarkTheme;

  @override
  bool updateShouldNotify(covariant PrestTheme oldWidget) => data != oldWidget.data;
}

/// LIGHT THEME CONFIGURATION
final PrestThemeData defaultLightTheme = PrestThemeData(
  colors: const PrestColorTheme(
    background: PrestColors.white,
    white: PrestColors.white,
    milk: PrestColors.milk,
    chineseBlack: PrestColors.chineseBlack,
    neonBlue: PrestColors.neonBlue,
    gold: PrestColors.gold,
    gray: PrestColors.gray,
    arsenic: PrestColors.arsenic,
    raisinBlack: PrestColors.raisinBlack,
    black: PrestColors.chineseBlack,
    redSolid: PrestColors.redSolid,
    niagara: PrestColors.niagara,
  ),
  defaultTextTheme: PrestTextTheme.fromColor(PrestColors.arsenic),
  whiteTextTheme: PrestTextTheme.fromColor(PrestColors.white),
  neonBlueTextTheme: PrestTextTheme.fromColor(PrestColors.neonBlue),
  goldTextTheme: PrestTextTheme.fromColor(PrestColors.gold),
  arsenicTextTheme: PrestTextTheme.fromColor(PrestColors.arsenic),
  grayTextTheme: PrestTextTheme.fromColor(PrestColors.gray),
  blackTextTheme: PrestTextTheme.fromColor(PrestColors.chineseBlack),
  redSolidTextTheme: PrestTextTheme.fromColor(PrestColors.redSolid),
  niagaraTextTheme: PrestTextTheme.fromColor(PrestColors.niagara),
);

/// DARK THEME CONFIGURATION
final PrestThemeData defaultDarkTheme = PrestThemeData(
  colors: const PrestColorTheme(
    background: PrestColors.chineseBlack,
    white: PrestColors.white,
    milk: PrestColors.milk,
    chineseBlack: PrestColors.chineseBlack,
    neonBlue: PrestColors.neonBlue,
    gold: PrestColors.gold,
    gray: PrestColors.gray,
    arsenic: PrestColors.white,
    raisinBlack: PrestColors.raisinBlack,
    black: PrestColors.white,
    redSolid: PrestColors.redSolid,
    niagara: PrestColors.niagara,
  ),
  defaultTextTheme: PrestTextTheme.fromColor(PrestColors.white),
  whiteTextTheme: PrestTextTheme.fromColor(PrestColors.white),
  neonBlueTextTheme: PrestTextTheme.fromColor(const Color(0xFFE0E0E0)),
  goldTextTheme: PrestTextTheme.fromColor(PrestColors.gold),
  arsenicTextTheme: PrestTextTheme.fromColor(PrestColors.white),
  grayTextTheme: PrestTextTheme.fromColor(PrestColors.gray),
  blackTextTheme: PrestTextTheme.fromColor(PrestColors.white),
  redSolidTextTheme: PrestTextTheme.fromColor(PrestColors.redSolid),
  niagaraTextTheme: PrestTextTheme.fromColor(PrestColors.niagara),
);

/// MATERIAL THEME FACTORY
class PrestThemeFactory {
  static ThemeData light() => _buildMaterial(Brightness.light, PrestColors.white);
  static ThemeData dark() => _buildMaterial(Brightness.dark, PrestColors.chineseBlack);

  static ThemeData _buildMaterial(Brightness brightness, Color bg) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bg,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}

/// CONTEXT EXTENSION FOR CLEANER CODE
extension PrestThemeContext on BuildContext {
  PrestThemeData get prestTheme => PrestTheme.of(this);
}