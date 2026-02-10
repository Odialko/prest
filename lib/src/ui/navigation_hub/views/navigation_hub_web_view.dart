import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/providers/scroll_provider.dart';
import 'package:prest/src/services/url_launcher.dart';
import 'package:prest/src/ui/common_widgets/contact_dialog.dart';
import 'package:prest/src/ui/common_widgets/hover_menu.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/navigation_hub/widgets/navigation_app_bar.dart';

class NavigationHubWebView extends ConsumerWidget implements NavigationHubScreen {
  const NavigationHubWebView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final scrollOffset = ref.watch(scrollPositionProvider);
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // Drawer (Мобільне меню)
      endDrawer: _buildPremiumDrawer(context, theme),
      body: Stack(
        children: [
          child,
          Positioned(
            top: 0, left: 0, right: 0,
            child: NavigationAppBar(
              scrollOffset: scrollOffset,
              actions: [
                _buildDropdown(context, theme, 'POZNAJ NAS', [NavItem.about, NavItem.team, NavItem.joinUs], width),
                _buildDropdown(context, theme, 'NIERUCHOMOŚCI', [NavItem.sale, NavItem.rent, NavItem.offMarket], width),
                _buildDropdown(context, theme, 'USŁUGI', [NavItem.design, NavItem.credit, NavItem.advice, NavItem.abroad], width),
                _buildDropdown(
                  context, theme, 'ZGŁOŚ', ['Nieruchomość', 'Poszukiwanie'], width,
                  onCustomSelected: (val) => PrestDialog.showContact(context, title: 'Zgłoś $val'),
                ),
                SizedBox(width: width < 1300 ? 10 : 20),
                _buildCtaButton(context, theme, scrollOffset, width),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, PrestThemeData theme, String label, List<dynamic> items, double screenWidth, {Function(String)? onCustomSelected}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth < 1300 ? 4 : 8),
      child: HoverMenu(
        title: label,
        theme: theme,
        items: items.map((e) => e is NavItem ? e.title : e.toString()).toList(),
        onSelected: (title) {
          if (onCustomSelected != null) {
            onCustomSelected(title);
          } else {
            final item = items.firstWhere((e) => e is NavItem && e.title == title) as NavItem;
            context.go(item.route);
          }
        },
      ),
    );
  }

  Widget _buildCtaButton(BuildContext context, PrestThemeData theme, double scrollOffset, double screenWidth) {
    final bool isShrunk = scrollOffset > 40;
    return PrestPrimaryButton(
      label: 'UMÓW ROZMOWĘ',
      onPressed: () => PrestDialog.showContact(
        context,
        title: 'Umów rozmowę',
        showWiadomosc: false, // Це прибере поле "Wiadomość"
      ),
      height: isShrunk ? 38.0 : 44.0,
      width: screenWidth < 1300 ? 160.0 : 190.0,
    );
  }

  // МОБІЛЬНЕ МЕНЮ (DRAWER)
  Widget _buildPremiumDrawer(BuildContext context, PrestThemeData theme) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // ПРЯМІ КУТИ
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset('assets/images/logo-prest.jpeg', height: 50),
            const SizedBox(height: 30),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerExpandableSection(context, theme, 'POZNAJ NAS', [NavItem.about, NavItem.team, NavItem.joinUs]),
                  _drawerExpandableSection(context, theme, 'NIERUCHOMOŚCI', [NavItem.sale, NavItem.rent, NavItem.offMarket]),
                  _drawerExpandableSection(context, theme, 'USŁUGI', [NavItem.design, NavItem.credit, NavItem.advice, NavItem.abroad]),
                  _drawerSimpleItem(context, theme, 'KONTAKT', NavItem.contact),
                ],
              ),
            ),
            // КОНТАКТИ ВНИЗУ МЕНЮ
            Container(
              padding: const EdgeInsets.all(24),
              color: theme.colors.milk,
              child: Column(
                children: [
                  _contactRow(Icons.phone, '+48 883 031 339', () => UrlLauncherService.makeCall('+48 883 031 339')),
                  const SizedBox(height: 15),
                  _contactRow(Icons.email, 'kontakt@prestestate.pl', () => UrlLauncherService.sendEmail('kontakt@prestestate.pl')),
                  const SizedBox(height: 15),
                  _contactRow(Icons.camera_alt, '@prest_estate', () => UrlLauncherService.openInstagram()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerExpandableSection(BuildContext context, PrestThemeData theme, String title, List<NavItem> items) {
    return ExpansionTile(
      shape: const Border(),
      title: Text(title, style: theme.blackTextTheme.font6.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
      children: items.map((item) => ListTile(
        contentPadding: const EdgeInsets.only(left: 40),
        title: Text(item.title, style: theme.blackTextTheme.font7),
        onTap: () {
          Navigator.pop(context);
          context.go(item.route);
        },
      )).toList(),
    );
  }

  Widget _drawerSimpleItem(BuildContext context, PrestThemeData theme, String title, NavItem item) {
    return ListTile(
      title: Text(title, style: theme.blackTextTheme.font6.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
      onTap: () {
        Navigator.pop(context);
        context.go(item.route);
      },
    );
  }

  Widget _contactRow(IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black54),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}