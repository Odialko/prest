import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/generated/l10n.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/routing/app_router.dart';

import 'prest_provider.dart';

class PrestApp extends ConsumerWidget {
  const PrestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(routerProvider);

    /// getting from the provider
    final themeMode = ref.watch(themeProvider);

    /// determining whether light/dark mode depends on system settings
    final systemBrightness = View.of(
      context,
    ).platformDispatcher.platformBrightness;
    final isDarkMode = themeMode == ThemeMode.system
        ? systemBrightness == Brightness.dark
        : themeMode == ThemeMode.dark;

    /// Choose data for custom theme
    final prestThemeData = isDarkMode ? PrestTheme.dark : PrestTheme.light;

    return PrestTheme(
      data: prestThemeData,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'prEST',
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,

        /// pass the current themeMode
        themeMode: themeMode,

        /// standard Material themes
        theme: PrestThemeFactory.light(),
        darkTheme: PrestThemeFactory.dark(),

        localizationsDelegates: const [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
