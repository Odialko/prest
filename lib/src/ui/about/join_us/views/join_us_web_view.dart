import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/generated/l10n.dart'; // Додано
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/about/join_us/join_us_screen.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/common_widgets/prest_overlap_section.dart';
import 'package:prest/src/ui/common_widgets/prest_section_header.dart';

class JoinUsWebView extends JoinUsScreen {
  const JoinUsWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final s = S.of(context); // Локалізація

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              final bool isMobile = width < 1150;
              const double sidePadding = 40.0;
              final double effectivePadding = isMobile ? 24 : sidePadding;

              return SelectionArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroHeader(context, theme, isMobile, width, effectivePadding),

                    PrestOverlapSection(
                      variant: PrestSectionVariant.imageRight,
                      imagePath: ImagesConstants.join_1,
                      backgroundColor: theme.colors.white,
                      textContent: _buildTeamDescription(context, theme),
                    ),

                    PrestOverlapSection(
                      variant: PrestSectionVariant.imageLeft,
                      imagePath: ImagesConstants.join_2,
                      backgroundColor: theme.colors.milk,
                      height: isMobile ? 650 : 850,
                      textContent: _buildGoalsDescription(context, theme),
                    ),

                    _buildFormSection(context, theme, width, effectivePadding, isMobile),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeroHeader(BuildContext context, PrestThemeData theme, bool isMobile, double width, double sidePadding) {
    final s = S.of(context);
    return Container(
      color: theme.colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sidePadding,
              vertical: isMobile ? 80 : 140,
            ),
            child: Column(
              children: [
                ScrollRevealBox(
                  child: Center(
                    child: PrestSectionHeader(
                      linePosition: HeaderLinePosition.bottom,
                      lineWidth: 80,
                      hoverLineWidth: 120,
                      title: Text(
                        s.navJoinUs.toUpperCase(), // "DOŁĄCZ DO NAS"
                        style: theme.arsenicTextTheme.font2.copyWith(
                          letterSpacing: 4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                ScrollRevealBox(
                  delay: const Duration(milliseconds: 200),
                  child: _buildMainIntro(context, theme),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamDescription(BuildContext context, PrestThemeData theme) {
    final s = S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.joinTeamTitle,
          style: theme.blackTextTheme.font2,
        ),
        const SizedBox(height: 40),
        Text(
          s.joinTeamDesc,
          style: theme.blackTextTheme.font4.copyWith(
            color: theme.colors.chineseBlack.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          s.joinTeamQuote,
          style: theme.blackTextTheme.font7.copyWith(
            color: theme.colors.gold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildGoalsDescription(BuildContext context, PrestThemeData theme) {
    final s = S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.joinGoalsTitle,
          style: theme.blackTextTheme.font2,
        ),
        const SizedBox(height: 40),
        RichText(
          text: TextSpan(
            style: theme.blackTextTheme.font4.copyWith(
              color: theme.colors.chineseBlack.withValues(alpha: 0.7),
            ),
            children: [
              TextSpan(text: s.joinGoalsDescP1),
              TextSpan(text: s.joinGoalsDescP2),
              TextSpan(
                text: s.joinGoalsDescP2Bold,
                style: TextStyle(color: theme.colors.chineseBlack, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection(BuildContext context, PrestThemeData theme, double width, double sidePadding, bool isMobile) {
    final s = S.of(context);
    return Container(
      color: theme.colors.white,
      padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 120),
      child: Center(
        child: Column(
          children: [
            ScrollRevealBox(
              child: PrestSectionHeader(
                linePosition: HeaderLinePosition.bottom,
                lineWidth: 60,
                hoverLineWidth: 90,
                title: Text(
                  s.joinFormTitle.toUpperCase(), // "WYPEŁNIJ FORMULARZ"
                  style: theme.blackTextTheme.font7.copyWith(
                    letterSpacing: 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            _buildMockForm(context, theme, width),
          ],
        ),
      ),
    );
  }

  Widget _buildMainIntro(BuildContext context, PrestThemeData theme) {
    final s = S.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 850),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: theme.blackTextTheme.font3.copyWith(
            fontWeight: FontWeight.w200,
            color: theme.colors.chineseBlack,
          ),
          children: [
            TextSpan(text: s.joinMainIntro1),
            TextSpan(text: s.joinMainIntro2Bold, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }

  Widget _buildMockForm(BuildContext context, PrestThemeData theme, double width) {
    final s = S.of(context);
    final bool isSmall = width < 800;
    return Container(
      width: isSmall ? double.infinity : 700,
      padding: EdgeInsets.all(isSmall ? 40 : 80),
      color: theme.colors.milk,
      child: Column(
        children: [
          Text(
            s.joinFormSubtitle.toUpperCase(),
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font7.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 50),
          PrestDarkBorderButton(
            label: s.btnUploadCv.toUpperCase(),
            onPressed: () {},
            width: 220,
          ),
        ],
      ),
    );
  }
}