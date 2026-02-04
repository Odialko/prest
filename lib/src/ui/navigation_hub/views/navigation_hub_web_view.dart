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
            ref,
            NavItem.submitProperty,
            isOutlined: true,
          ),
          const SizedBox(width: 10),
          _buildCtaButton(
            context,
            theme,
            ref,
            NavItem.bookCall,
            isDialog: true,
          ),
        ],
      ),
      body: child,
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
    final bool isContact = item == NavItem.contact;

    // Створюємо стиль спеціально для Контакту
    final TextStyle contactStyle = theme.blackTextTheme.font7.copyWith(
      fontSize: isContact ? 13 : 12, // Трішки більший шрифт
      letterSpacing: isContact ? 3.5 : 2.5, // Ширші відступи між буквами
      fontWeight: isContact ? FontWeight.w600 : FontWeight.w400,
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isContact ? 12.0 : 8.0,
      ), // Більше простору навколо
      child: DefaultTextStyle(
        style: contactStyle,
        child: HoverMenu(
          title: item.title,
          theme: theme,
          isStaticLink: true,
          onSelected: (_) => context.go(item.route),
        ),
      ),
    );
  }

  Widget _buildCtaButton(
    BuildContext context,
    PrestThemeData theme,
    WidgetRef ref,
    NavItem item, {
    bool isOutlined = false,
    bool isDialog = false,
  }) {
    // Дивимось, чи прокручена сторінка (через Riverpod або стан)
    final isScrolled = ref.watch(isScrolledProvider);

    // Розраховуємо динамічну висоту
    final double dynamicHeight = isScrolled ? 38.0 : 45.0;

    void onPressed() =>
        isDialog ? PrestDialogs.showContact(context) : context.go(item.route);

    return AnimatedContainer(
      // Додаємо для плавності зміни відступів
      duration: const Duration(milliseconds: 300),
      child: isOutlined
          ? PrestDarkBorderButton(
              label: item.title,
              onPressed: onPressed,
              height: dynamicHeight, // Передаємо висоту
              width: 180,
            )
          : PrestPrimaryButton(
              label: item.title,
              onPressed: onPressed,
              height: dynamicHeight, // Передаємо висоту
              width: 180,
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
}
