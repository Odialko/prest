import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final bool isMobile = MediaQuery.of(context).size.width < LayoutsConstants.brakePointToMobile;

    return Container(
      color: theme.colors.chineseBlack,
      width: double.infinity,
      // Larger vertical padding for a "breathable" luxury feel
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : LayoutsConstants.horizontalPaddingDesktop,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MAIN FOOTER CONTENT
                isMobile
                    ? _buildMobileLayout(context, theme)
                    : _buildDesktopLayout(context, theme),

                const SizedBox(height: 80),
                const Divider(color: Colors.white10, thickness: 1),
                const SizedBox(height: 40),

                // BOTTOM COPYRIGHT BAR
                _buildBottomBar(theme, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- DESKTOP LAYOUT (Clean Grid) ---
  Widget _buildDesktopLayout(BuildContext context, PrestThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildBrandColumn(theme)),
        const Spacer(),
        _buildLinkColumn(context, theme, 'EXPLORE', [
          NavItem.about, NavItem.sale, NavItem.rent, NavItem.team
        ]),
        const SizedBox(width: 80),
        _buildLinkColumn(context, theme, 'SERVICES', [
          NavItem.design, NavItem.credit, NavItem.advice
        ]),
        const SizedBox(width: 80),
        _buildContactColumn(theme),
      ],
    );
  }

  // --- MOBILE LAYOUT (Stacked) ---
  Widget _buildMobileLayout(BuildContext context, PrestThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandColumn(theme),
        const SizedBox(height: 60),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildLinkColumn(context, theme, 'EXPLORE', [NavItem.about, NavItem.sale, NavItem.rent])),
            Expanded(child: _buildLinkColumn(context, theme, 'SERVICES', [NavItem.design, NavItem.credit, NavItem.advice])),
          ],
        ),
        const SizedBox(height: 60),
        _buildContactColumn(theme),
      ],
    );
  }

  // --- REUSABLE COLUMNS ---

  Widget _buildBrandColumn(PrestThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'prEST',
            style: theme.whiteTextTheme.font1.copyWith(
              letterSpacing: 10,
              fontWeight: FontWeight.w200,
            )
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 300,
          child: Text(
            'Definiujemy standardy luksusu na rynku nieruchomości premium w Polsce.',
            style: theme.whiteTextTheme.font7.copyWith(
              color: Colors.white54,
              height: 1.8,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLinkColumn(BuildContext context, PrestThemeData theme, String title, List<NavItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            title,
            style: theme.whiteTextTheme.font8.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colors.gold,
              letterSpacing: 2,
            )
        ),
        const SizedBox(height: 30),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _FooterLink(item: item),
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
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            )
        ),
        const SizedBox(height: 30),
        _contactRow(Icons.location_on_outlined, 'Poznań, Polska'),
        _contactRow(Icons.phone_outlined, '+48 000 000 000'),
        _contactRow(Icons.email_outlined, 'office@prest.pl'),
      ],
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.white24, size: 18),
          const SizedBox(width: 15),
          Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                letterSpacing: 0.5,
              )
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(PrestThemeData theme, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            '© 2026 prEST. All rights reserved.',
            style: theme.whiteTextTheme.font9.copyWith(color: Colors.white24)
        ),
        Row(
          children: [
            _socialIcon(Icons.camera_alt_outlined),
            const SizedBox(width: 24),
            _socialIcon(Icons.business_outlined),
          ],
        )
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return Icon(icon, color: Colors.white24, size: 20);
  }
}

class _FooterLink extends StatefulWidget {
  final NavItem item;
  const _FooterLink({required this.item});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.item.route),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          style: theme.whiteTextTheme.font7.copyWith(
            color: _isHovered ? theme.colors.gold : Colors.white70,
            letterSpacing: 0.5,
          ),
          child: Text(widget.item.title),
        ),
      ),
    );
  }
}