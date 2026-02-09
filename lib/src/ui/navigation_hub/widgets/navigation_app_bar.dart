import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
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

  @override
  Size get preferredSize {
    final double currentTopBar = (topBarHeight - scrollOffset).clamp(0.0, topBarHeight);
    final double t = ((scrollOffset - topBarHeight) / 50.0).clamp(0.0, 1.0);
    final double currentHeader = lerpDouble(headerLarge, headerSmall, t)!;
    return Size.fromHeight(currentTopBar + currentHeader);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme; // Юзаємо твою тему через розширення
    final bool isMobile = MediaQuery.of(context).size.width < 1150;

    final double currentTopBarHeight = (topBarHeight - scrollOffset).clamp(0.0, topBarHeight);
    final double t = ((scrollOffset - topBarHeight) / 50.0).clamp(0.0, 1.0);
    final double currentHeaderHeight = lerpDouble(isMobile ? 80.0 : headerLarge, headerSmall, t)!;

    final bool isShrunk = scrollOffset > topBarHeight;

    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: theme.colors.white, // Pure White
        boxShadow: isShrunk
            ? [BoxShadow(color: theme.colors.chineseBlack.withValues(alpha: 0.1), blurRadius: 15, offset: const Offset(0, 5))]
            : [],
      ),
      child: Column(
        children: [
          // 1. TOP BAR (Beige Medium)
          if (currentTopBarHeight > 0)
            SizedBox(
              height: currentTopBarHeight,
              child: ClipRect(
                child: Opacity(
                  opacity: (currentTopBarHeight / topBarHeight).clamp(0.0, 1.0),
                  child: Container(
                    color: theme.colors.milk, // Це твій beigeMedium
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
            ),

          // 2. MAIN HEADER (White)
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLogo(currentHeaderHeight),
                      if (!isMobile)
                        Row(mainAxisSize: MainAxisSize.min, children: actions)
                      else
                        _buildMobileIcon(theme, scrollOffset),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopContent(PrestThemeData theme, bool isMobile) {
    return Container(
      height: topBarHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _contactLink(
            Icons.phone_outlined,
            '+48 883 031 339',
                () => UrlLauncherService.makeCall('+48 883 031 339'),
            theme,
          ),
          const SizedBox(width: 25),
          _contactLink(
            Icons.email_outlined,
            'biuro@prestestate.pl',
                () => UrlLauncherService.sendEmail('biuro@prestestate.pl'),
            theme,
          ),
          const SizedBox(width: 25),
          // Секція Instagram з нікнеймом
          _contactLink(
            Icons.camera_alt_outlined,
            '@prest_estate',
                () => UrlLauncherService.openInstagram(),
            theme,
          ),
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
            Icon(icon, size: 14, color: theme.colors.chineseBlack),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.neonBlueTextTheme.font7.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(double height) {
    return Image.asset(
      'assets/images/logo-prest.jpeg',
      height: height * 0.55,
      fit: BoxFit.contain,
    );
  }

  Widget _buildMobileIcon(PrestThemeData theme, double offset) {
    // Плавна анімація кольору іконки: від білого (на Hero) до Navy (на білому фоні)
    final Color iconColor = Color.lerp(
        theme.colors.white,
        theme.colors.chineseBlack,
        (offset / 100).clamp(0.0, 1.0)
    )!;

    return Builder(
      builder: (ctx) => IconButton(
        icon: Icon(Icons.menu_rounded, color: iconColor, size: 30),
        onPressed: () => Scaffold.of(ctx).openEndDrawer(),
      ),
    );
  }
}