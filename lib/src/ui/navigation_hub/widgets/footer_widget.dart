import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/routing/routes.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < LayoutsConstants.brakePointToMobile;

    return Container(
      color: theme.colors.chineseBlack,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: LayoutsConstants.footerVerticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LayoutsConstants.maxContentWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? LayoutsConstants.horizontalPaddingMobile
                  : LayoutsConstants.horizontalPaddingDesktop,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      _buildBrandColumn(theme, isMobile),
                      Wrap(
                        spacing: 60,
                        runSpacing: 40,
                        children: [
                          _buildLinkColumn(context, theme, 'MENU', {
                            'O prEST': Routes.about,
                            'Nieruchomości': Routes.propertiesSale,
                            'Usługi': Routes.servicesDesign,
                            'Zespół': Routes.team,
                          }),
                          _buildLinkColumn(context, theme, 'INFO', {
                            'Polityka prywatności': Routes.politykaPrywatnosci,
                            'Regulamin': Routes.regulamin,
                            'Cookies': Routes.cookies,
                          }),
                          _buildContactColumn(theme),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Divider(color: Colors.white10),
                const SizedBox(height: 40),
                _buildBottomBar(theme, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLinkColumn(
      BuildContext context,
      PrestThemeData theme,
      String title,
      Map<String, String> links,
      ) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.whiteTextTheme.font6.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          ...links.entries.map(
                (entry) => _FooterLink(
              title: entry.key,
              onTap: () => context.go(entry.value),
              theme: theme,
            ),
          ),
        ],
      ),
    );
  }

  // --- Інші допоміжні методи залишаються майже такими ж, але з додаванням hover для іконок ---

  Widget _buildBrandColumn(PrestThemeData theme, bool isMobile) {
    return SizedBox(
      width: isMobile ? double.infinity : 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'prEST',
            style: theme.whiteTextTheme.font1.copyWith(
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Definiujemy standardy luksusu na rynku nieruchomości premium w Polsce.',
            style: theme.whiteTextTheme.font7.copyWith(
              color: Colors.white60,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactColumn(PrestThemeData theme) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'KONTAKT',
            style: theme.whiteTextTheme.font6.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          _contactRow(Icons.location_on_outlined, 'Poznań, Polska'),
          _contactRow(Icons.phone_outlined, '+48 000 000 000'),
          _contactRow(Icons.email_outlined, 'office@prest.pl'),
        ],
      ),
    );
  }

  Widget _buildBottomBar(PrestThemeData theme, bool isMobile) {
    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          '© 2026 prEST. All rights reserved.',
          style: theme.whiteTextTheme.font7.copyWith(color: Colors.white38),
        ),
        if (isMobile) const SizedBox(height: 20),
        Row(
          children: [
            _socialIcon(Icons.camera_alt_outlined),
            const SizedBox(width: 20),
            _socialIcon(Icons.business_outlined),
            const SizedBox(width: 20),
            _socialIcon(Icons.facebook_outlined),
          ],
        ),
      ],
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.white54, size: 18),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) => Icon(icon, color: Colors.white70, size: 20);
}

// --- ОКРЕМИЙ ВІДЖЕТ ДЛЯ ЕФЕКТУ НАВЕДЕННЯ ---
class _FooterLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final PrestThemeData theme;

  const _FooterLink({
    required this.title,
    required this.onTap,
    required this.theme,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: widget.theme.whiteTextTheme.font7.copyWith(
              color: _isHovered ? widget.theme.colors.gold : Colors.white70,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}