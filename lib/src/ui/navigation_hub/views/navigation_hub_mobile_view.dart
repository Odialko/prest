import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/providers/scroll_provider.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import '../widgets/navigation_app_bar.dart';

class NavigationHubMobileView extends ConsumerWidget implements NavigationHubScreen {
  final Widget child;
  const NavigationHubMobileView({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollOffset = ref.watch(scrollPositionProvider);
    final theme = context.prestTheme;
    final bool isHeaderWhite = scrollOffset > 40;

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: _buildPremiumDrawer(context, theme),
      appBar: NavigationAppBar(
        scrollOffset: scrollOffset,
        actions: [
          Builder(
            builder: (ctx) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: isHeaderWhite ? theme.colors.black : Colors.white,
              ),
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            // Оновлюємо стейт для синхронізації AppBar
            ref.read(scrollPositionProvider.notifier).state = notification.metrics.pixels;
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildMobileHero(theme),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileHero(PrestThemeData theme) {
    return Container(
      height: 500,
      width: double.infinity,
      color: theme.colors.chineseBlack,
      child: Center(
        child: Text(
          'PREMIUM\nESTATE',
          textAlign: TextAlign.center,
          style: theme.whiteTextTheme.font1.copyWith(letterSpacing: 8),
        ),
      ),
    );
  }

  Widget _buildPremiumDrawer(BuildContext context, PrestThemeData theme) {
    return Drawer(
      backgroundColor: theme.colors.background,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _drawerItem(theme, 'O NAS', Icons.info_outline),
            _drawerItem(theme, 'NIERUCHOMOŚCI', Icons.home_work_outlined),
            _drawerItem(theme, 'KONTAKT', Icons.mail_outline),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colors.chineseBlack,
                  minimumSize: const Size(double.infinity, 55),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text('UMÓW ROZMOWĘ', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(PrestThemeData theme, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: theme.colors.gold),
      title: Text(title, style: theme.blackTextTheme.font6),
      onTap: () {},
    );
  }
}