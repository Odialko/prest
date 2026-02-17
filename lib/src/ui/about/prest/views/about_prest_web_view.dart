import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/generated/l10n.dart'; // Додано
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/contact_dialog.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_overlap_section.dart';
import 'package:prest/src/ui/common_widgets/prest_section_header.dart';
import 'package:prest/src/constants/layouts_constants.dart';
import '../about_prest_screen.dart';

class AboutPrestWebView extends AboutPrestScreen {
  const AboutPrestWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final s = S.of(context); // Ініціалізація локалізації

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              final bool isMobile = width < 1150;
              const double desktopPadding = 40.0;

              return SelectionArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroSection(
                      context, // Передаємо контекст для S
                      theme,
                      isMobile ? 24 : desktopPadding,
                      isMobile,
                    ),
                    PrestOverlapSection(
                      variant: PrestSectionVariant.onlyText,
                      backgroundColor: theme.colors.white,
                      height: isMobile ? 150 : 250,
                      textContent: Text(
                        s.aboutBelieveInTeam, // "Wierzymy w siłę zespołu."
                        textAlign: TextAlign.center,
                        style: isMobile
                            ? theme.blackTextTheme.font2.copyWith(fontSize: 28)
                            : theme.blackTextTheme.font2.copyWith(fontSize: 48),
                      ),
                    ),
                    PrestOverlapSection(
                      variant: PrestSectionVariant.imageLeft,
                      imagePath: ImagesConstants.team_2,
                      backgroundColor: theme.colors.milk,
                      textContent: _buildTeamPowerDescription(context, theme),
                    ),
                    _buildFooterCTA(context),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection(
      BuildContext context,
      PrestThemeData theme,
      double padding,
      bool isMobile,
      ) {
    final s = S.of(context);
    final sectionHeader = PrestSectionHeader(
      title: Text(
        s.navPoznajNas.toUpperCase(), // "POZNAJ NAS"
        style: isMobile ? theme.arsenicTextTheme.font5 : theme.arsenicTextTheme.font2.copyWith(
          letterSpacing: 4,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    return Container(
      color: theme.colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LayoutsConstants.maxContentWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: padding,
              vertical: isMobile ? 60 : 120,
            ),
            child: isMobile
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionHeader,
                const SizedBox(height: 30),
                _buildHeroTypography(context, theme, isMobile),
                const SizedBox(height: 40),
                _buildTeamImage(ImagesConstants.team_3, isMobile),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScrollRevealBox(child: sectionHeader),
                      const SizedBox(height: 60),
                      ScrollRevealBox(
                        delay: const Duration(milliseconds: 200),
                        child: _buildHeroTypography(context, theme, isMobile),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                Expanded(
                  flex: 6,
                  child: ScrollRevealBox(
                    delay: const Duration(milliseconds: 400),
                    child: _buildTeamImage(
                      ImagesConstants.team_3,
                      isMobile,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroTypography(BuildContext context, PrestThemeData theme, bool isMobile) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.aboutHeroTitle, // "Skuteczna sprzedaż. Przemyślany zakup."
          style: theme.blackTextTheme.font2.copyWith(
            height: 1.2,
            fontSize: isMobile ? 32 : 44,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          s.aboutHeroDesc1, // Опис про нерухомість
          style: theme.blackTextTheme.font4.copyWith(
            height: 1.7,
            color: theme.colors.chineseBlack.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          s.aboutHeroDesc2, // Опис про контрастуючі особистості
          style: theme.blackTextTheme.font4.copyWith(
            height: 1.7,
            color: theme.colors.chineseBlack.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamPowerDescription(BuildContext context, PrestThemeData theme) {
    final s = S.of(context);
    return RichText(
      text: TextSpan(
        style: theme.blackTextTheme.font4.copyWith(
          height: 1.7,
          fontSize: 18,
          color: theme.colors.chineseBlack.withValues(alpha: 0.8),
        ),
        children: [
          TextSpan(text: s.aboutTeamPowerP1),
          TextSpan(
            text: s.aboutTeamPowerP2Bold,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: '\n\n${s.aboutTeamPowerP3}\n\n'),
          TextSpan(text: s.aboutTeamPowerP4),
          TextSpan(
            text: s.aboutTeamPowerP5Bold,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamImage(String path, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        width: double.infinity,
        height: isMobile ? null : 580,
      ),
    );
  }

  Widget _buildFooterCTA(BuildContext context) {
    final theme = context.prestTheme;
    final s = S.of(context);
    return Container(
      width: double.infinity,
      color: theme.colors.white,
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Center(
        child: ScrollRevealBox(
          child: PrestDarkBorderButton(
            label: s.btnScheduleCall.toUpperCase(), // "UMÓW ROZMOWĘ"
            onPressed: () => PrestDialog.showContact(
              context,
              title: s.btnScheduleCall.toUpperCase(),
              showWiadomosc: false,
            ),
            width: 280,
          ),
        ),
      ),
    );
  }
}