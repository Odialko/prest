import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/providers/scroll_provider.dart';
import 'package:prest/src/ui/common_widgets/hover_menu.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/navigation_hub/widgets/nav_cta_button.dart';
import 'package:prest/src/ui/navigation_hub/widgets/navigation_app_bar.dart';
import 'package:prest/src/ui/navigation_hub/widgets/premium_drawer.dart';

class NavigationHubWebView extends NavigationHubScreen {
  const NavigationHubWebView({super.key, required super.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final isScrolled = ref.watch(isScrolledProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: PremiumDrawer(theme: theme),
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
          NavCtaButton(
            item: NavItem.submitProperty,
            theme: theme,
            isOutlined: true,
          ),
          const SizedBox(width: 10),
          NavCtaButton(item: NavItem.bookCall, theme: theme, isDialog: true),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          // Оновлюємо позицію тільки якщо це скрол у глибину (depth == 0)
          if (notification.depth == 0) {
            ref.read(scrollPositionProvider.notifier).state = notification.metrics.pixels;
          }
          return false; // Дозволяємо скролу йти далі
        },
        child: SelectionArea(
          key: ValueKey(child.hashCode),
          child: child,
        ),
      ),
      // body: SelectionArea(key: ValueKey(child.hashCode), child: child),
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
        final selectedItem = items.firstWhere((e) => e.title == title);
        context.go(selectedItem.route);
      },
    );
  }

  Widget _buildNavLink(
    BuildContext context,
    PrestThemeData theme,
    NavItem item,
  ) {
    return HoverMenu(
      title: item.title,
      theme: theme,
      isStaticLink: true,
      onSelected: (_) => context.go(item.route),
    );
  }
}
