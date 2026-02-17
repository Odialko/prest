import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/generated/l10n.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/providers/locale_provider.dart';
import 'package:prest/src/routing/app_router.dart';

class PrestApp extends ConsumerWidget {
  const PrestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(routerProvider);
    final currentLocale = ref.watch(localeProvider);
    // Forced to light for now, as the Navy+Beige palette is tuned for light mode aesthetics
    const themeMode = ThemeMode.light;

    // final systemBrightness = View.of(context).platformDispatcher.platformBrightness;
    // final bool isDark = themeMode == ThemeMode.system
    //     ? systemBrightness == Brightness.dark
    //     : themeMode == ThemeMode.dark;

    // Pick our custom theme data (Navy & Beige)
    // final prestThemeData = isDark ? defaultDarkTheme : defaultLightTheme;
    final prestThemeData = defaultLightTheme;

    return PrestTheme(
      data: prestThemeData,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'prEST',
        routerConfig: appRouter,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: currentLocale,

        // Material themes wrappers with our new palette
        theme: _buildMaterialTheme(Brightness.light),
        darkTheme: _buildMaterialTheme(Brightness.dark),
        themeMode: themeMode,
      ),
    );
  }

  /// Creates a basic Material theme wrapper synced with Navy & Beige palette
  ThemeData _buildMaterialTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      // ВИПРАВЛЕНО: Використовуємо нові константи кольорів
      scaffoldBackgroundColor: isLight
          ? PrestColors.beigeLight
          : PrestColors.deepNavy,
      fontFamily: 'Inter',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        // Колір іконок в AppBar (гранат на бежевому або білий на гранаті)
        iconTheme: IconThemeData(
          color: isLight ? PrestColors.deepNavy : PrestColors.pureWhite,
        ),
      ),
      // Колір виділення тексту (золотистий акцент)
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: PrestColors.warmGold,
        selectionColor: PrestColors.warmGold.withValues(alpha: 0.3),
        selectionHandleColor: PrestColors.warmGold,
      ),
    );
  }
}
