import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/providers/scroll_provider.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import '../widgets/navigation_app_bar.dart';
import '../store/navigation_hub_store.dart';

class NavigationHubMobileView extends ConsumerWidget
    implements NavigationHubScreen {
  final Widget child;
  const NavigationHubMobileView({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScrolled = ref.watch(
      navigationProvider.select((s) => s.isScrolled),
    );
    final theme = context.prestTheme;
    final scrollOffset = ref.watch(scrollPositionProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      // Використовуємо той самий AppBar, що і для Web
      appBar: NavigationAppBar(
        scrollOffset: scrollOffset,
        actions: [
          // На мобільних ми показуємо лише іконку меню (Drawer)
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: isScrolled ? theme.colors.black : Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: _buildPremiumDrawer(context, theme),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Тестовий контент для скролу
            _buildMobileHero(theme),
            _buildMobileContent(theme),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildMobileHero(PrestThemeData theme) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colors.chineseBlack,
        image: const DecorationImage(
          image: AssetImage('assets/images/hero_bg.jpg'), // якщо є фон
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Center(
        child: Text(
          'PREMIUM\nEXPERIENCE',
          textAlign: TextAlign.center,
          style: theme.whiteTextTheme.font1.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileContent(PrestThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: theme.colors.background,
      child: Column(
        children: List.generate(
          5,
          (i) => Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colors.milk,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumDrawer(BuildContext context, PrestThemeData theme) {
    return Drawer(
      backgroundColor: theme.colors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(
                'assets/images/logo-prest.jpeg',
                height: 30,
                color: theme.colors.black,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
            _drawerItem(theme, 'O NAS', Icons.info_outline_rounded),
            _drawerItem(theme, 'PROJEKTY', Icons.auto_awesome_mosaic_outlined),
            _drawerItem(theme, 'KONTAKT', Icons.phone_android_rounded),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colors.chineseBlack,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text('UMÓW ROZMOWĘ'),
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
      title: Text(
        title,
        style: theme.blackTextTheme.font5.copyWith(fontWeight: FontWeight.w600),
      ),
      onTap: () {},
    );
  }
}
