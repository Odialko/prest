import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/providers/scroll_provider.dart';
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

    return Scaffold(
      endDrawer: _buildPremiumDrawer(context),
      // Використовуємо Stack, щоб покласти AppBar поверх body
      body: Stack(
        children: [
          // 1. КОНТЕНТ (НИЖНІЙ ШАР)
          child,

          // 2. ХЕДЕР (ВЕРХНІЙ ШАР)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavigationAppBar(
              scrollOffset: scrollOffset,
              actions: [
                _buildDropdown(context, theme, 'POZNAJ NAS', [NavItem.about, NavItem.team, NavItem.joinUs]),
                _buildDropdown(context, theme, 'NIERUCHOMOŚCI', [NavItem.sale, NavItem.rent, NavItem.offMarket]),
                _buildDropdown(context, theme, 'USŁUGI', [NavItem.design, NavItem.credit, NavItem.advice, NavItem.abroad]),
                _buildDropdown(
                  context,
                  theme,
                  'ZGŁOŚ',
                  ['Nieruchomość', 'Poszukiwanie'],
                  onCustomSelected: (val) => PrestDialog.showContact(context, title: 'Zgłoś $val'),
                ),
                const SizedBox(width: 20),
                _buildCtaButton(context, theme, scrollOffset, NavItem.bookCall, isDialog: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 2. ВИПАДАЮЧИЙ СПИСОК (HOVER MENU)
  Widget _buildDropdown(
      BuildContext context,
      PrestThemeData theme,
      String label,
      List<dynamic> items, {
        Function(String)? onCustomSelected,
      }) {
    return HoverMenu(
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
    );
  }

  // 3. CTA КНОПКА З АНІМАЦІЄЮ РОЗМІРУ
  Widget _buildCtaButton(
      BuildContext context,
      PrestThemeData theme,
      double scrollOffset,
      NavItem item, {
        bool isOutlined = false,
        bool isDialog = false,
      }) {
    final bool isShrunk = scrollOffset > 40;
    final double dynamicHeight = isShrunk ? 38.0 : 46.0; // Трохи вища для солідності

    void onPressed() => isDialog ? PrestDialog.showContact(context) : context.go(item.route);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: isOutlined
          ? PrestDarkBorderButton(
        label: item.title,
        onPressed: onPressed,
        height: dynamicHeight,
        width: 190,
      )
          : PrestPrimaryButton(
        label: item.title,
        onPressed: onPressed,
        height: dynamicHeight,
        width: 190,
      ),
    );
  }

  // 4. СТАТИЧНІ ПОСИЛАННЯ (НАПРИКЛАД КОНТАКТ)
  Widget _buildNavLink(BuildContext context, PrestThemeData theme, NavItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: HoverMenu(
        title: item.title,
        theme: theme,
        isStaticLink: true,
        onSelected: (_) => context.go(item.route),
      ),
    );
  }

  // 5. ПРЕМІАЛЬНЕ БОКОВЕ МЕНЮ (MOBILE)
  Widget _buildPremiumDrawer(BuildContext context) {
    final theme = context.prestTheme;
    return Drawer(
      backgroundColor: theme.colors.background.withValues(alpha: 0.98),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              // Логотип у Drawer
              Image.asset('assets/images/logo-prest.jpeg', height: 60),
              const SizedBox(height: 40),
              const Divider(indent: 40, endIndent: 40),
              ...[NavItem.about, NavItem.sale, NavItem.design, NavItem.contact].map(
                    (item) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  title: Center(
                    child: Text(
                      item.title,
                      style: theme.blackTextTheme.font5.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(item.route);
                  },
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  'PREST ESTATE © 2026',
                  style: theme.blackTextTheme.font9.copyWith(color: theme.colors.arsenic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}