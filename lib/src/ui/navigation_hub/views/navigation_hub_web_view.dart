import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/ui/common_widgets/hover_menu.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/navigation_hub/store/navigation_hub_store.dart';
import 'package:prest/src/ui/navigation_hub/widgets/footer_widget.dart';
import 'package:prest/src/ui/navigation_hub/widgets/navigation_app_bar.dart';

class NavigationHubWebView extends NavigationHubScreen {
  const NavigationHubWebView({super.key, required super.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScrolled = ref.watch(navigationProvider.select((s) => s.isScrolled));
    final theme = context.prestTheme;

    return Scaffold(
      key: const ValueKey('navigation_scaffold'),
      extendBodyBehindAppBar: true,
      endDrawer: _buildMobileDrawer(context, theme),
      appBar: NavigationAppBar(
        isScrolled: isScrolled,
        actions: [
          _buildDropdownMenu(context, theme, 'POZNAJ NAS', [
            'O prEST',
            'Zespół',
            'Dołącz do nas',
          ]),
          _buildDropdownMenu(context, theme, 'NIERUCHOMOŚCI', [
            'Sprzedaż',
            'Wynajem',
            'OFFmarket',
          ]),
          _buildDropdownMenu(context, theme, 'USŁUGI', [
            'prEST design',
            'Kredyt',
            'Doradztwo',
            'Zakupy za granicą',
          ]),
          _navLink(context, theme, 'KONTAKT', Routes.contact),
          const SizedBox(width: 20),
          _ctaButton(context, theme, 'ZGŁOŚ NIERUCHOMOŚĆ', route: Routes.contact, isOutlined: true),
          const SizedBox(width: 10),
          _ctaButton(context, theme, 'UMÓW ROZMOWĘ', isDialog: true),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.depth == 0) {
            ref.read(navigationProvider.notifier).setScrolled(notification.metrics.pixels > 50);
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              child,
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // --- МЕНЮ (DROPDOWN) ---
  Widget _buildDropdownMenu(BuildContext context, PrestThemeData theme, String title, List<String> items) {
    return HoverMenu(
      title: title,
      items: items,
      theme: theme,
      onSelected: (value) {
        switch (value) {
          case 'O prEST': context.go(Routes.about); break;
          case 'Zespół': context.go(Routes.team); break;
          case 'Dołącz do nas': context.go(Routes.joinUs); break;
          case 'Sprzedaż': context.go(Routes.propertiesSale); break;
          case 'Wynajem': context.go(Routes.propertiesRent); break;
          case 'OFFmarket': context.go(Routes.propertiesOffMarket); break;
          case 'prEST design': context.go(Routes.servicesDesign); break;
          case 'Kredyt': context.go(Routes.servicesCredit); break;
          case 'Doradztwo': context.go(Routes.servicesDoradztwo); break;
          case 'Zakupy za granicą': context.go(Routes.servicesZaGranica); break;
          default: debugPrint('No route for: $value');
        }
      },
    );
  }

  // --- КНОПКИ CTA ---
  Widget _ctaButton(
      BuildContext context,
      PrestThemeData theme,
      String title, {
        String? route,
        bool isOutlined = false,
        bool isDialog = false,
      }) {
    return ElevatedButton(
      onPressed: () {
        if (isDialog) {
          _showContactDialog(context, theme);
        } else if (route != null) {
          context.go(route);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : theme.colors.chineseBlack,
        foregroundColor: isOutlined ? theme.colors.chineseBlack : Colors.white,
        side: BorderSide(color: theme.colors.chineseBlack),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
    );
  }

  // --- ПОСИЛАННЯ ТЕКСТОМ ---
  Widget _navLink(BuildContext context, PrestThemeData theme, String title, String route) {
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(
        title,
        style: theme.blackTextTheme.font7.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  // --- ДІАЛОГ "РОЗМОВА" ---
  void _showContactDialog(BuildContext context, PrestThemeData theme) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Contact',
      barrierColor: Colors.black.withValues(alpha: 0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 450,
              padding: const EdgeInsets.all(40),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('UMÓW ROZMOWĘ', style: theme.blackTextTheme.font4.copyWith(letterSpacing: 2)),
                  const SizedBox(height: 30),
                  TextField(decoration: InputDecoration(hintText: 'Imię i Nazwisko', hintStyle: theme.blackTextTheme.font7)),
                  const SizedBox(height: 15),
                  TextField(decoration: InputDecoration(hintText: 'Numer telefonu', hintStyle: theme.blackTextTheme.font7)),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: theme.colors.chineseBlack),
                      onPressed: () => Navigator.pop(context),
                      child: Text('WYŚLIJ', style: theme.whiteTextTheme.font7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
    );
  }

  // --- МОБІЛЬНИЙ DRAWER ---
  Widget _buildMobileDrawer(BuildContext context, PrestThemeData theme) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 50),
              _drawerLink(context, theme, 'O NAS', Routes.about),
              _drawerLink(context, theme, 'NIERUCHOMOŚCI', Routes.propertiesSale),
              _drawerLink(context, theme, 'USŁUGI', Routes.servicesDesign),
              _drawerLink(context, theme, 'KONTAKT', Routes.contact),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(40),
                child: SizedBox(
                  width: double.infinity,
                  child: _ctaButton(context, theme, 'UMÓW ROZMOWĘ', isDialog: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerLink(BuildContext context, PrestThemeData theme, String title, String route) {
    return ListTile(
      title: Center(child: Text(title, style: theme.blackTextTheme.font6.copyWith(letterSpacing: 2))),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }
}
