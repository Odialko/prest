import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/services/url_launcher.dart';
import 'package:prest/src/providers/locale_provider.dart'; // Твій провайдер мови

class NavigationAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final double scrollOffset;
  final List<Widget> actions;

  const NavigationAppBar({
    super.key,
    required this.scrollOffset,
    required this.actions,
  });

  static const double topBarHeight = 40.0;
  static const double headerLarge = 90.0;
  static const double headerSmall = 70.0;
  static const double threshold = 60.0;

  @override
  Size get preferredSize {
    final bool isCollapsed = scrollOffset > threshold;
    return Size.fromHeight(isCollapsed ? headerSmall : (topBarHeight + headerLarge));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final bool isCollapsed = scrollOffset > threshold;

    return Material(
      elevation: isCollapsed ? 4.0 : 0.0,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      color: theme.colors.white,
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
                _buildTopBar(isCollapsed, theme, context, ref),
                _buildMainHeader(isCollapsed, theme, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(bool isCollapsed, PrestThemeData theme, BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 1150;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      height: (isCollapsed || isMobile) ? 0 : topBarHeight,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: (isCollapsed || isMobile) ? 0.0 : 1.0,
        child: Container(
          color: theme.colors.milk,
          width: double.infinity,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
              child: _buildTopContent(theme, context, ref),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopContent(PrestThemeData theme, BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    final bool isShort = width < 1350;

    return Container(
      height: topBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          _contactLink(Icons.phone_outlined, '+48 883 031 339',
                  () => UrlLauncherService.makeCall('+48 883 031 339'), theme),

          const SizedBox(width: 25),

          if (!isShort) ...[
            _contactLink(Icons.email_outlined, 'kontakt@prestestate.pl',
                    () => UrlLauncherService.sendEmail('kontakt@prestestate.pl'), theme),
            const SizedBox(width: 25),
          ],

          _contactLink(Icons.camera_alt_outlined, isShort ? '' : '@prest_estate',
                  () => UrlLauncherService.openInstagram(), theme),

          const VerticalDivider(width: 30, indent: 12, endIndent: 12, color: Colors.black12),
          // LANGUAGE SELECTOR
          _buildLanguageSelector(theme, ref),

        ],
      ),
    );
  }

  Widget _buildLanguageSelector(PrestThemeData theme, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);

    // Мапа мов з прапорцями
    final Map<String, String> languages = {
      'pl': '🇵🇱 PL',
      'en': '🇬🇧 EN', // Британський прапор
      'de': '🇩🇪 DE',
      'uk': '🇺🇦 UA',
      'ru': '🇷🇺 RU', // Російський прапор
    };

    return PopupMenuButton<String>(
      tooltip: 'Zmień język',
      offset: const Offset(0, 30),
      color: theme.colors.white,
      elevation: 4,
      onSelected: (String code) => ref.read(localeProvider.notifier).setLocale(code),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              languages[currentLocale.languageCode] ?? '🇵🇱 PL',
              style: theme.neonBlueTextTheme.font5.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: theme.colors.chineseBlack,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 16),
          ],
        ),
      ),
      itemBuilder: (context) => languages.entries.map((entry) {
        final bool isSelected = entry.key == currentLocale.languageCode;
        return PopupMenuItem<String>(
          value: entry.key,
          height: 40,
          child: Text(
            entry.value,
            style: theme.neonBlueTextTheme.font5.copyWith(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? theme.colors.gold : theme.colors.chineseBlack,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMainHeader(bool isCollapsed, PrestThemeData theme, BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 1150;

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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions,
                  )
                else
                  _buildMobileIcon(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context, bool isCollapsed) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      height: isCollapsed ? 60 : 120,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.go(Routes.home),
          child: Image.asset('assets/images/logo-prest.jpeg', fit: BoxFit.contain),
        ),
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
            if (label.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(label, style: theme.neonBlueTextTheme.font5.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              )),
            ],
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