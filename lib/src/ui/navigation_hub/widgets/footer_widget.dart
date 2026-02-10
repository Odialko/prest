import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/services/url_launcher.dart'; // Переконайся, що цей сервіс має потрібні методи

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < LayoutsConstants.brakePointToMobile;
    final bool isTablet = width < 1100 && width >= LayoutsConstants.brakePointToMobile;

    return Container(
      color: theme.colors.chineseBlack,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAdaptiveLayout(context, theme, isMobile, isTablet),
                const SizedBox(height: 80),
                Divider(color: Colors.white.withOpacity(0.1), thickness: 1),
                const SizedBox(height: 40),
                _buildBottomBar(context, theme, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdaptiveLayout(BuildContext context, PrestThemeData theme, bool isMobile, bool isTablet) {
    if (isMobile || isTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBrandColumn(theme),
          const SizedBox(height: 60),
          _buildLinkGrid(context, theme, isMobile ? 1 : 2),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 320, child: _buildBrandColumn(theme)),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.topRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 40),
                _buildLinkColumn(context, theme, 'POZNAJ NAS', [NavItem.about, NavItem.team, NavItem.joinUs]),
                const SizedBox(width: 60),
                _buildLinkColumn(context, theme, 'NIERUCHOMOŚCI', [NavItem.sale, NavItem.rent, NavItem.offMarket]),
                const SizedBox(width: 60),
                _buildLinkColumn(context, theme, 'USŁUGI', [NavItem.design, NavItem.credit, NavItem.advice, NavItem.abroad]),
                const SizedBox(width: 60),
                _buildContactColumn(theme),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLinkGrid(BuildContext context, PrestThemeData theme, int crossAxisCount) {
    return Wrap(
      spacing: 40,
      runSpacing: 50,
      children: [
        _gridItem('POZNAJ NAS', [NavItem.about, NavItem.team, NavItem.joinUs], context, theme, crossAxisCount),
        _gridItem('NIERUCHOMOŚCI', [NavItem.sale, NavItem.rent, NavItem.offMarket], context, theme, crossAxisCount),
        _gridItem('USŁUGI', [NavItem.design, NavItem.credit, NavItem.advice, NavItem.abroad], context, theme, crossAxisCount),
        _gridItem('KONTAKT', [], context, theme, crossAxisCount, isContact: true),
      ],
    );
  }

  Widget _gridItem(String title, List<NavItem> items, BuildContext context, PrestThemeData theme, int count, {bool isContact = false}) {
    return SizedBox(
      width: count == 1 ? double.infinity : 220,
      child: isContact ? _buildContactColumn(theme) : _buildLinkColumn(context, theme, title, items),
    );
  }

  Widget _buildBrandColumn(PrestThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'prEST',
          style: theme.whiteTextTheme.font1.copyWith(letterSpacing: 12, fontWeight: FontWeight.w200, height: 1),
        ),
        const SizedBox(height: 30),
        Text(
          'Definiujemy standardy luksusu na rynku nieruchomości premium w Polsce.',
          style: theme.whiteTextTheme.font7.copyWith(color: Colors.white38, height: 1.8, letterSpacing: 0.8),
        ),
      ],
    );
  }

  Widget _buildLinkColumn(BuildContext context, PrestThemeData theme, String title, List<NavItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.whiteTextTheme.font8.copyWith(fontWeight: FontWeight.w700, color: theme.colors.gold, letterSpacing: 3, fontSize: 11)),
        const SizedBox(height: 32),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: _PrestOrganicLink(title: item.title, onTap: () => context.go(item.route)),
        )),
      ],
    );
  }

  Widget _buildContactColumn(PrestThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KONTAKT',
          style: theme.whiteTextTheme.font8.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
            fontSize: 11,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        _contactRow(
          Icons.location_on_outlined,
          'Aleja Wielkopolska 67/2, 60-603 Poznań',
          onTap: () => UrlLauncherService.openMaps('Aleja Wielkopolska 67/2, 60-603 Poznań'),
        ),
        _contactRow(
          Icons.phone_outlined,
          '+48 690 175 317',
          onTap: () => UrlLauncherService.makeCall('+48 690 175 317'),
        ),
        _contactRow(
          Icons.email_outlined,
          'kontakt@prestestate.pl',
          onTap: () => UrlLauncherService.sendEmail('kontakt@prestestate.pl'),
        ),
        _contactRow(
          Icons.camera_alt_outlined,
          '@prest_estate',
          onTap: () => UrlLauncherService.openInstagram(),
        ),
      ],
    );
  }

  Widget _contactRow(IconData icon, String text, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: MouseRegion(
        cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, // Для довгих адрес
            children: [
              Icon(icon, color: Colors.white24, size: 16),
              const SizedBox(width: 14),
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white60, fontSize: 13, letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, PrestThemeData theme, bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _PrestOrganicLink(title: 'Polityka prywatności', onTap: () => context.go(Routes.privacyPolicy), small: true),
          const SizedBox(height: 24),
          _buildLegalAndSocial(),
          const SizedBox(height: 30),
          _buildCopyright(theme),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCopyright(theme),
        _PrestOrganicLink(title: 'Polityka prywatności', onTap: () => context.go(Routes.privacyPolicy), small: true),
        _buildLegalAndSocial(),
      ],
    );
  }

  Widget _buildCopyright(PrestThemeData theme) {
    return Text('© 2026 prEST. All rights reserved.', style: theme.whiteTextTheme.font9.copyWith(color: Colors.white24));
  }

  Widget _buildLegalAndSocial() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => UrlLauncherService.openInstagram(),
            child: const Icon(Icons.camera_alt_outlined, color: Colors.white24, size: 18),
          ),
        ),
        const SizedBox(width: 24),
        const Icon(Icons.business_outlined, color: Colors.white24, size: 18),
      ],
    );
  }
}

class _PrestOrganicLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool small;

  const _PrestOrganicLink({required this.title, required this.onTap, this.small = false});

  @override
  State<_PrestOrganicLink> createState() => _PrestOrganicLinkState();
}

class _PrestOrganicLinkState extends State<_PrestOrganicLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              style: theme.whiteTextTheme.font7.copyWith(
                color: _isHovered ? theme.colors.gold : Colors.white70,
                fontSize: widget.small ? 12 : 13,
                letterSpacing: 0.5,
              ),
              child: Text(widget.title),
            ),
            const SizedBox(height: 2),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 1,
              width: _isHovered ? 24 : 0,
              color: theme.colors.gold,
            ),
          ],
        ),
      ),
    );
  }
}