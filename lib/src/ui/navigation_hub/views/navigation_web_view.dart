// lib/src/ui/navigation_hub/views/navigation_web_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/navigation_hub/store/navigation_hub_store.dart';
import 'package:prest/src/ui/navigation_hub/widgets/footer_widget.dart';
import 'package:prest/src/ui/navigation_hub/widgets/navigation_app_bar.dart';

class NavigationHubWebScreen extends NavigationHubScreen {
  const NavigationHubWebScreen({super.key, required super.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Слухаємо стан скролу
    final isScrolled = ref.watch(navigationProvider.select((s) => s.isScrolled));
    final theme = context.prestTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: NavigationAppBar(
        isScrolled: isScrolled,
        actions: [
          _navLink(theme, 'O NAS'),
          _navLink(theme, 'NIERUCHOMOŚCI'),
          _navLink(theme, 'KONTAKT'),
          const SizedBox(width: 20),
          _ctaButton(theme),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          // ВИПРАВЛЕННЯ ТУТ:
          // depth == 0 означає, що ми слухаємо тільки головний SingleChildScrollView.
          // Будь-який скрол всередині (карусель, горизонтальні списки) матиме depth > 0
          // і буде ігноруватися цим блоком.
          if (notification.depth == 0) {
            if (notification.metrics.pixels > 50) {
              ref.read(navigationProvider.notifier).setScrolled(true);
            } else {
              ref.read(navigationProvider.notifier).setScrolled(false);
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              child, // Весь контент сторінки
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navLink(PrestThemeData theme, String title) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: theme.colors.chineseBlack,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Text(
        title,
        style: theme.blackTextTheme.font6.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _ctaButton(PrestThemeData theme) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colors.chineseBlack,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Text(
        'UMÓW ROZMOWĘ',
        style: theme.whiteTextTheme.font7.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}