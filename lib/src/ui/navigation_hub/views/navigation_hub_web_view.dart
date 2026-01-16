import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/providers/scroll_provider.dart';
import 'package:prest/src/ui/common_widgets/hover_menu.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/navigation_hub/widgets/navigation_app_bar.dart';

class NavigationHubWebView extends NavigationHubScreen {
  const NavigationHubWebView({super.key, required super.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final isScrolled = ref.watch(isScrolledProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: _buildPremiumDrawer(context, theme),
      appBar: NavigationAppBar(
        isScrolled: isScrolled,
        actions: [
          _buildDropdown(context, theme, 'POZNAJ NAS', [
            NavItem.about,
            NavItem.team,
            NavItem.joinUs,
          ]),
          _buildDropdown(context, theme, 'NIERUCHOMOŚCI', [
            NavItem.sale,
            NavItem.rent,
            NavItem.offMarket,
          ]),
          _buildDropdown(context, theme, 'USŁUGI', [
            NavItem.design,
            NavItem.credit,
            NavItem.advice,
            NavItem.abroad,
          ]),
          _buildNavLink(context, theme, NavItem.contact),
          const SizedBox(width: 20),
          _buildCtaButton(
            context,
            theme,
            NavItem.submitProperty,
            isOutlined: true,
          ),
          const SizedBox(width: 10),
          _buildCtaButton(context, theme, NavItem.bookCall, isDialog: true),
        ],
      ),
      body: SelectionArea(child: child),
    );
  }

  Widget _buildDropdown(
    BuildContext context,
    PrestThemeData theme,
    String label,
    List<NavItem> items,
  ) {
    return HoverMenu(
      title: label,
      items: items.map((e) => e.title).toList(),
      theme: theme,
      onSelected: (title) {
        final item = items.firstWhere((e) => e.title == title);
        context.go(item.route);
      },
    );
  }

  Widget _buildNavLink(
    BuildContext context,
    PrestThemeData theme,
    NavItem item,
  ) {
    // We use a ValueNotifier or simple State to track hover if this were a
    // StatefulWidget, but since we are in a Hub, we can use a local hover state
    // or a simple HoverMenu in 'isStaticLink' mode to guarantee 100% identity.

    return HoverMenu(
      title: item.title,
      theme: theme,
      isStaticLink:
          true, // This flag in your HoverMenu handles the "link-only" style
      onSelected: (_) => context.go(item.route),
    );
  }

  Widget _buildCtaButton(
    BuildContext context,
    PrestThemeData theme,
    NavItem item, {
    bool isOutlined = false,
    bool isDialog = false,
  }) {
    return ElevatedButton(
      onPressed: () => isDialog
          ? _showContactDialog(context, theme)
          : context.go(item.route),
      style: ElevatedButton.styleFrom(
        // Use theme.colors.milk or Colors.transparent for outlined if needed
        backgroundColor: isOutlined
            ? theme.colors.milk
            : theme.colors.chineseBlack,
        foregroundColor: isOutlined ? theme.colors.chineseBlack : Colors.white,
        side: BorderSide(color: theme.colors.chineseBlack),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        elevation: 0,
      ),
      child: Text(
        item.title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildPremiumDrawer(BuildContext context, PrestThemeData theme) {
    return Drawer(
      backgroundColor: Colors.white.withValues(alpha: 0.95),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          children: [
            const SizedBox(height: 50),
            ...[
              NavItem.about,
              NavItem.sale,
              NavItem.design,
              NavItem.contact,
            ].map(
              (item) => ListTile(
                title: Center(
                  child: Text(item.title, style: theme.blackTextTheme.font6),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.go(item.route);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showContactDialog(BuildContext context, PrestThemeData theme) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Contact',
      barrierColor: Colors.black.withValues(alpha: 0.8),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) => Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: anim1,
            child: Container(
              width: 450,
              padding: const EdgeInsets.all(60),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'UMÓW ROZMOWĘ',
                    style: theme.blackTextTheme.font4.copyWith(
                      letterSpacing: 4,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildField(theme, 'Imię i Nazwisko'),
                  const SizedBox(height: 20),
                  _buildField(theme, 'Numer телефону / Email'),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colors.chineseBlack,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text('WYŚLIJ', style: theme.whiteTextTheme.font7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(PrestThemeData theme, String hint) {
    return TextField(
      style: theme.blackTextTheme.font6,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.grayTextTheme.font7,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
