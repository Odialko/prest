import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    // 1. HERO HEADER (WHITE)
                    _buildHeroHeader(theme, isMobile, width, effectivePadding),

                    // 2. TEAM SECTION (IMAGE RIGHT)
                    PrestOverlapSection(
                      variant: PrestSectionVariant.imageRight,
                      imagePath: ImagesConstants.join_1,
                      backgroundColor: theme.colors.white,
                      textContent: _buildTeamDescription(theme),
                    ),

                    // 3. GOALS SECTION (IMAGE LEFT)
                    PrestOverlapSection(
                      variant: PrestSectionVariant.imageLeft,
                      imagePath: ImagesConstants.join_2,
                      backgroundColor: theme.colors.milk,
                      height: isMobile ? 650 : 850,
                      textContent: _buildGoalsDescription(theme),
                    ),

                    // 4. FORM SECTION
                    _buildFormSection(theme, width, effectivePadding, isMobile),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- 1. HERO HEADER ---
  Widget _buildHeroHeader(PrestThemeData theme, bool isMobile, double width, double sidePadding) {
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
                        'DOŁĄCZ DO NAS',
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
                  child: _buildMainIntro(theme),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- 2. TEAM DESCRIPTION ---
  Widget _buildTeamDescription(PrestThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nasz zespół to nasz największy kapitał.',
          style: theme.blackTextTheme.font2,
        ),
        const SizedBox(height: 40),
        Text(
          'Jako zaufani doradcy najbardziej wymagających klientów prywatnych i instytucjonalnych, nasi agenci każdego dnia potwierdzają, że ich profesjonalizm, zaangażowanie i skuteczność realnie przekładają się na sukcesy naszych klientów.',
          style: theme.blackTextTheme.font4.copyWith(
            color: theme.colors.chineseBlack.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Szukamy talentów. Pasjonatów sprzedaży. Ludzi, którzy chcą grać w pierwszej lidze.',
          style: theme.blackTextTheme.font7.copyWith(
            color: theme.colors.gold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  // --- 3. GOALS DESCRIPTION ---
  Widget _buildGoalsDescription(PrestThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pomagamy realnie osiągać cele sprzedażowe.',
          style: theme.blackTextTheme.font2,
        ),
        const SizedBox(height: 40),
        RichText(
          text: TextSpan(
            style: theme.blackTextTheme.font4.copyWith(
              color: theme.colors.chineseBlack.withOpacity(0.7),
            ),
            children: [
              const TextSpan(
                text: 'Dołączając do zespołu prEST, stajesz się częścią dynamicznego, ambitnego środowiska, które ceni kreatywność, zaangażowanie i rozwój. Budujemy wiedzę, szlifujemy warsztat i wspieramy w tworzeniu silnej marki osobistej.\n\n',
              ),
              const TextSpan(text: 'W prEST pomagamy Agentom не тільки ефективно продавати. '),
              TextSpan(
                text: 'Pomagamy im rosnąć, rozwijać skrzydła i błyszczeć własnymi sukcesami.',
                style: TextStyle(color: theme.colors.chineseBlack, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- 4. FORM SECTION ---
  Widget _buildFormSection(PrestThemeData theme, double width, double sidePadding, bool isMobile) {
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
                  'WYPEŁNIJ FORMULARZ',
                  style: theme.blackTextTheme.font7.copyWith(
                    letterSpacing: 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            _buildMockForm(theme, width),
          ],
        ),
      ),
    );
  }

  Widget _buildMainIntro(PrestThemeData theme) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 850),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: theme.blackTextTheme.font3.copyWith(
            fontWeight: FontWeight.w200,
            color: theme.colors.chineseBlack,
          ),
          children: const [
            TextSpan(text: 'DOSKONAŁA obsługa rodzi skuteczne transakcje dzięki nieprzeciętnym '),
            TextSpan(text: 'LUDZIOM.', style: TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }

  Widget _buildMockForm(PrestThemeData theme, double width) {
    final bool isSmall = width < 800;
    return Container(
      width: isSmall ? double.infinity : 700,
      padding: EdgeInsets.all(isSmall ? 40 : 80),
      color: theme.colors.milk,
      child: Column(
        children: [
          Text(
            'WYŚLIJ NAM SWOJE CV, A MY SKONTAKTUJEMY SIĘ Z TOBĄ WKRÓTCE.',
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font7.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 50),
          PrestDarkBorderButton(label: 'WGRAJ CV', onPressed: () {}, width: 220),
        ],
      ),
    );
  }
}