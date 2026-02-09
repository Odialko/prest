import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/services/url_launcher.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double scrollOffset;
  final List<Widget> actions;

  const NavigationAppBar({
    super.key,
    required this.scrollOffset,
    required this.actions,
  });

  static const double topBarHeight = 40.0;
  static const double headerLarge = 100.0;
  static const double headerSmall = 70.0;
  static const double threshold = 60.0;

  @override
  Size get preferredSize {
    final bool isCollapsed = scrollOffset > threshold;
    return Size.fromHeight(isCollapsed ? headerSmall : (topBarHeight + headerLarge));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final bool isCollapsed = scrollOffset > threshold;

    return Material(
      elevation: isCollapsed ? 4.0 : 0.0,
      shadowColor: Colors.black.withOpacity(0.2),
      color: theme.colors.white, // Гарантуємо білий фон, щоб контент не просвічував
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        height: preferredSize.height,
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.topCenter,
            minHeight: 0,
            maxHeight: topBarHeight + headerLarge,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTopBar(isCollapsed, theme, context),
                _buildMainHeader(isCollapsed, theme, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // МЕТОД 1: ТОП-БАР
  Widget _buildTopBar(bool isCollapsed, PrestThemeData theme, BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1150;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      height: isCollapsed ? 0 : topBarHeight,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isCollapsed ? 0.0 : 1.0,
        child: ClipRect(
          child: Container(
            color: theme.colors.milk,
            width: double.infinity,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
                child: _buildTopContent(theme, isMobile),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // МЕТОД 2: ОСНОВНИЙ ХЕДЕР
  Widget _buildMainHeader(bool isCollapsed, PrestThemeData theme, BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1150;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      height: isCollapsed ? headerSmall : headerLarge,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(context, isCollapsed),
                if (!isMobile)
                  Row(mainAxisSize: MainAxisSize.min, children: actions)
                else
                  _buildMobileIcon(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ДОПОМІЖНІ МЕТОДИ (Лого, Контакти тощо)
  Widget _buildLogo(BuildContext context, bool isCollapsed) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      height: isCollapsed ? 45 : 70,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.go(Routes.home),
          child: Image.asset('assets/images/logo-prest.jpeg', fit: BoxFit.contain),
        ),
      ),
    );
  }

  Widget _buildTopContent(PrestThemeData theme, bool isMobile) {
    return Container(
      height: topBarHeight,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _contactLink(Icons.phone_outlined, '+48 883 031 339', () => UrlLauncherService.makeCall('+48 883 031 339'), theme),
          const SizedBox(width: 25),
          _contactLink(Icons.email_outlined, 'kontakt@prestestate.pl', () => UrlLauncherService.sendEmail('kontakt@prestestate.pl'), theme),
          const SizedBox(width: 25),
          _contactLink(Icons.camera_alt_outlined, '@prest_estate', () => UrlLauncherService.openInstagram(), theme),
        ],
      ),
    );
  }

  Widget _contactLink(IconData icon, String label, VoidCallback onTap, PrestThemeData theme) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 15, color: theme.colors.chineseBlack),
            const SizedBox(width: 8),
            Text(label, style: theme.neonBlueTextTheme.font5.copyWith(fontWeight: FontWeight.w500, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileIcon(PrestThemeData theme) {
    return Builder(
      builder: (ctx) => IconButton(
        icon: Icon(Icons.menu_rounded, color: theme.colors.chineseBlack, size: 32),
        onPressed: () => Scaffold.of(ctx).openEndDrawer(),
      ),
    );
  }
}