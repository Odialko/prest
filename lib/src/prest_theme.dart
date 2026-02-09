import 'package:flutter/material.dart';

/// LUXURY COLOR PALETTE - PREST (Navy & Beige Edition)
class PrestColors {
  PrestColors._();

  // Premium Foundations (Beiges)
  static const beigeLight = Color(0xFFF5F0E8); // Головне тло
  static const beigeMedium = Color(0xFFE3D5C3); // Картки, виділені секції
  static const beigeDark = Color(0xFFC7B299); // Рамки, ховери

  // Brand Accents
  static const deepNavy = Color(0xFF0C2B5B); // Навігація, заголовки
  static const warmGold = Color(0xFFF4A259); // CTA, Акценти
  static const warmTerra = Color(0xFFD97757); // CTA Hover, важливі деталі

  // Typography
  static const neutralGray = Color(
    0xFF1F2933,
  ); // Основний текст (м’якший за чорний)
  static const pureWhite = Color(0xFFFFFFFF); // Текст на темному тлі

  // Semantic
  static const redSolid = Color(0xFFAF2D2D);
  static const niagara = Color(0xFF05A898);
}

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
    9.0, // font9: Legal / Micro
  ];
}

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
          height: 1.5, // Трохи збільшено для кращого читання бежевих тонів
          fontFamily: 'Inter',
          fontWeight: index < 3 ? FontWeight.w300 : FontWeight.w400,
          letterSpacing: index < 2 ? 8.0 : 0.5,
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

class PrestColorTheme {
  // Базові
  final Color background;
  final Color white;
  final Color milk;

  // Твоя Luxury палітра (те, чого не було)
  final Color beigeLight;
  final Color beigeMedium;
  final Color beigeDark;
  final Color deepNavy;
  final Color warmGold;
  final Color warmTerra;
  final Color neutralGray;

  // Семантичні та старі для сумісності
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
    required this.beigeLight,
    required this.beigeMedium,
    required this.beigeDark,
    required this.deepNavy,
    required this.warmGold,
    required this.warmTerra,
    required this.neutralGray,
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

class PrestThemeData {
  final PrestColorTheme colors;
  final PrestTextTheme defaultTextTheme;
  final PrestTextTheme whiteTextTheme;
  final PrestTextTheme neonBlueTextTheme;
  final PrestTextTheme goldTextTheme;
  final PrestTextTheme arsenicTextTheme;
  final PrestTextTheme grayTextTheme;
  final PrestTextTheme blackTextTheme;
  final PrestThemeData? raw; // Для посилань

  PrestThemeData({
    required this.colors,
    required this.defaultTextTheme,
    required this.whiteTextTheme,
    required this.neonBlueTextTheme,
    required this.goldTextTheme,
    required this.arsenicTextTheme,
    required this.grayTextTheme,
    required this.blackTextTheme,
    this.raw,
  });
}

class PrestTheme extends InheritedWidget {
  final PrestThemeData data;
  const PrestTheme({required super.child, super.key, required this.data});

  static PrestThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PrestTheme>()?.data ??
        defaultLightTheme;
  }

  @override
  bool updateShouldNotify(covariant PrestTheme oldWidget) =>
      data != oldWidget.data;
}

final PrestThemeData defaultLightTheme = _buildTheme(Brightness.light);

PrestThemeData _buildTheme(Brightness brightness) {
  final colorTheme = PrestColorTheme(
    // Luxury Palette Mapping
    beigeLight: PrestColors.beigeLight,
    beigeMedium: PrestColors.beigeMedium,
    beigeDark: PrestColors.beigeDark,
    deepNavy: PrestColors.deepNavy,
    warmGold: PrestColors.warmGold,
    warmTerra: PrestColors.warmTerra,
    neutralGray: PrestColors.neutralGray,

    // Решта полів для сумісності
    background: PrestColors.beigeLight,
    white: PrestColors.pureWhite,
    milk: PrestColors.beigeMedium,
    chineseBlack: PrestColors.deepNavy,
    neonBlue: PrestColors.deepNavy,
    gold: PrestColors.warmGold,
    gray: PrestColors.beigeDark,
    arsenic: PrestColors.neutralGray,
    raisinBlack: PrestColors.deepNavy,
    black: PrestColors.neutralGray,
    redSolid: PrestColors.redSolid,
    niagara: PrestColors.niagara,
  );

  return PrestThemeData(
    colors: colorTheme,
    defaultTextTheme: PrestTextTheme.fromColor(colorTheme.neutralGray),
    whiteTextTheme: PrestTextTheme.fromColor(PrestColors.pureWhite),
    neonBlueTextTheme: PrestTextTheme.fromColor(PrestColors.deepNavy),
    goldTextTheme: PrestTextTheme.fromColor(PrestColors.warmGold),
    arsenicTextTheme: PrestTextTheme.fromColor(PrestColors.neutralGray),
    grayTextTheme: PrestTextTheme.fromColor(PrestColors.beigeDark),
    blackTextTheme: PrestTextTheme.fromColor(PrestColors.neutralGray),
  );
}

extension PrestThemeContext on BuildContext {
  PrestThemeData get prestTheme => PrestTheme.of(this);
}
