import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/routing/routes.dart';

import 'navigation_hub_store.dart';

abstract class NavigationHubScreen extends Widget {
  factory NavigationHubScreen({Key? key, required Widget child}) {
    if (kIsWeb) {
      return _NavigationHubWebScreen(child: child);
    }
    return _NavigationHubMobileScreen(child: child);
  }
}

// --- MOBILE Version ---
class _NavigationHubMobileScreen extends ConsumerWidget
    implements NavigationHubScreen {
  final Widget child;
  const _NavigationHubMobileScreen({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('prEST')),
      drawer: const Drawer(
        // Тут твій мобільний список меню (ListTile)
      ),
      body: child,
    );
  }
}

// --- WEB version ---
class _NavigationHubWebScreen extends ConsumerWidget
    implements NavigationHubScreen {
  final Widget child;
  const _NavigationHubWebScreen({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Слухаємо стан скролу
    final isScrolled = ref.watch(
      navigationProvider.select((s) => s.isScrolled),
    );
    final theme = PrestTheme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isScrolled ? Colors.white : Colors.transparent,
            boxShadow: isScrolled
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ]
                : [],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'prEST',
              style: TextStyle(
                color: isScrolled ? Colors.black : Colors.white,
                letterSpacing: 2,
              ),
            ),
            actions: [
              _navDropdown(context, 'POZNAJ NAS', isScrolled, {
                'o prEST': Routes.about,
                'Zespół': Routes.team,
              }),
              _navLink(context, 'KONTAKT', isScrolled, Routes.contact),
              const SizedBox(width: 40),
              // ОСЬ ТВОЯ КНОПКА
              _ctaButton(
                'UMÓW ROZMOWĘ',
                isScrolled ? theme.colors.neonBlue : Colors.white,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels > 50) {
            ref.read(navigationProvider.notifier).setScrolled(true);
          } else {
            ref.read(navigationProvider.notifier).setScrolled(false);
          }
          return true;
        },
        child: SingleChildScrollView(child: child),
      ),
    );
  }

  // --- МЕТОДИ ВІДЖЕТІВ ---

  Widget _ctaButton(String label, Color color) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _navLink(
    BuildContext context,
    String title,
    bool isScrolled,
    String route,
  ) {
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(
        title,
        style: TextStyle(
          color: isScrolled ? Colors.black : Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _navDropdown(
    BuildContext context,
    String title,
    bool isScrolled,
    Map<String, String> items,
  ) {
    final textColor = isScrolled ? Colors.black : Colors.white;
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, size: 16, color: textColor),
          ],
        ),
      ),
      onSelected: (route) => context.go(route),
      itemBuilder: (context) => items.entries
          .map((e) => PopupMenuItem(value: e.value, child: Text(e.key)))
          .toList(),
    );
  }
}
