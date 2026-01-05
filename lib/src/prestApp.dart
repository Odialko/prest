import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/routing/app_router.dart';
// import 'package:prest/src/ui/prest_provider.dart'; // Розкоментуй, коли знадобиться themeProvider

class PrestApp extends ConsumerWidget {
  const PrestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(routerProvider);

    // Watch for theme changes (light/dark/system)
    // final themeMode = ref.watch(themeProvider);
    const themeMode = ThemeMode.light; // Forced to light for now

    // Logic for future theme switching
    final systemBrightness = View.of(context).platformDispatcher.platformBrightness;
    final bool isDark = themeMode == ThemeMode.system
        ? systemBrightness == Brightness.dark
        : themeMode == ThemeMode.dark;

    // Pick our custom theme data
    final prestThemeData = isDark ? defaultDarkTheme : defaultLightTheme;

    return PrestTheme(
      data: prestThemeData, // This will change when you change themeMode
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'prEST',

        // Connect our GoRouter
        routerConfig: appRouter,

        // Material themes (standard wrappers)
        theme: _buildMaterialTheme(Brightness.light),
        darkTheme: _buildMaterialTheme(Brightness.dark),
        themeMode: themeMode,

        // Localization
        // localizationsDelegates: const [S.delegate],
        // supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }

  /// Creates a basic Material theme wrapper
  ThemeData _buildMaterialTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: isLight ? PrestColors.white : PrestColors.chineseBlack,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}