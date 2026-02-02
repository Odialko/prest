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
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < LayoutsConstants.brakePointToMobile;
    final bool isTablet = width < 1100 && width >= LayoutsConstants.brakePointToMobile;

    return Container(
      color: theme.colors.chineseBlack,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LayoutsConstants.maxContentWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAdaptiveLayout(context, theme, isMobile, isTablet),
                const SizedBox(height: 80),
                const Divider(color: Colors.white10, thickness: 1),
                const SizedBox(height: 40),
                _buildBottomBar(theme, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdaptiveLayout(BuildContext context, PrestThemeData theme, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBrandColumn(theme),
          const SizedBox(height: 60),
          _buildLinkGrid(context, theme, 1),
        ],
      );
    }

    if (isTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBrandColumn(theme),
          const SizedBox(height: 60),
          _buildLinkGrid(context, theme, 2),
        ],
      );
    }

    // DESKTOP: Повертаємо контакти в ряд і фіксимо переповнення
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Блок бренду
        SizedBox(
          width: 320,
          child: _buildBrandColumn(theme),
        ),

        // Блок навігації та контактів
        Flexible(
          child: FittedBox( // Захист від тих самих 2.4 пікселів переповнення
            fit: BoxFit.scaleDown,
            alignment: Alignment.topRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 40),
                _buildLinkColumn(context, theme, 'POZNAJ NAS', [
                  NavItem.about,
                  NavItem.team,
                  NavItem.joinUs,
                ]),
                const SizedBox(width: 50),
                _buildLinkColumn(context, theme, 'NIERUCHOMOŚCI', [
                  NavItem.sale,
                  NavItem.rent,
                  NavItem.offMarket,
                ]),
                const SizedBox(width: 50),
                _buildLinkColumn(context, theme, 'USŁUGI', [
                  NavItem.design,
                  NavItem.credit,
                  NavItem.advice,
                  NavItem.abroad,
                ]),
                const SizedBox(width: 50),
                _buildContactColumn(theme), // ПОВЕРНУВ КОНТАКТИ НА МІСЦЕ
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Сітка для планшетів та мобілок
  Widget _buildLinkGrid(BuildContext context, PrestThemeData theme, int crossAxisCount) {
    return Wrap(
      spacing: 40,
      runSpacing: 50,
      children: [
        SizedBox(
          width: crossAxisCount == 1 ? double.infinity : 200,
          child: _buildLinkColumn(context, theme, 'POZNAJ NAS', [NavItem.about, NavItem.team, NavItem.joinUs]),
        ),
        SizedBox(
          width: crossAxisCount == 1 ? double.infinity : 200,
          child: _buildLinkColumn(context, theme, 'NIERUCHOMOŚCI', [NavItem.sale, NavItem.rent, NavItem.offMarket]),
        ),
        SizedBox(
          width: crossAxisCount == 1 ? double.infinity : 200,
          child: _buildLinkColumn(context, theme, 'USŁUGI', [NavItem.design, NavItem.credit, NavItem.advice, NavItem.abroad]),
        ),
        SizedBox(
          width: crossAxisCount == 1 ? double.infinity : 200,
          child: _buildContactColumn(theme),
        ),
      ],
    );
  }

  Widget _buildBrandColumn(PrestThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Текстовий логотип з від’ємним padding зверху, щоб вирівняти з малими заголовками
        Transform.translate(
          offset: const Offset(0, -8),
          child: Text(
            'prEST',
            style: theme.whiteTextTheme.font1.copyWith(
              letterSpacing: 8,
              fontWeight: FontWeight.w200,
              height: 1, // Прибираємо зайву висоту рядка
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Definiujemy standardy luksusu na rynku nieruchomości premium w Polsce.',
          style: theme.whiteTextTheme.font7.copyWith(
            color: Colors.white54,
            height: 1.6,
            letterSpacing: 0.5,
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
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 30),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
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
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 30),
        _contactRow(Icons.location_on_outlined, 'Poznań, Polska'),
        _contactRow(Icons.phone_outlined, '+48 690 175 317'),
        _contactRow(Icons.email_outlined, 'kontakt@prestestate.pl'),
      ],
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13)),
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
          style: theme.whiteTextTheme.font9.copyWith(color: Colors.white24),
        ),
        const Row(
          children: [
            Icon(Icons.camera_alt_outlined, color: Colors.white24, size: 20),
            SizedBox(width: 24),
            Icon(Icons.business_outlined, color: Colors.white24, size: 20),
          ],
        ),
      ],
    );
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
        child: Text(
          widget.item.title,
          style: theme.whiteTextTheme.font7.copyWith(
            color: _isHovered ? theme.colors.gold : Colors.white70,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}