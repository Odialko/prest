import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

/// The web version of the "About Prest" page.
class AboutPrestWebView extends AboutPrestScreen {
  const AboutPrestWebView({super.key});

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
              const double desktopPadding = 40.0;

              return SelectionArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. HERO SECTION
                    _buildHeroSection(
                      theme,
                      isMobile ? 24 : desktopPadding,
                      isMobile,
                    ),

                    // 2. INTERMEDIATE HEADING (Wierzymy w siłę zespołu)
                    PrestOverlapSection(
                      variant: PrestSectionVariant.onlyText,
                      backgroundColor: theme.colors.white,
                      height: isMobile ? 150 : 250,
                      textContent: Text(
                        'Wierzymy w siłę zespołu.',
                        textAlign: TextAlign.center, // Змінив на Center для симетрії
                        style: isMobile
                            ? theme.blackTextTheme.font2.copyWith(fontSize: 28)
                            : theme.blackTextTheme.font2.copyWith(fontSize: 48),
                      ),
                    ),

                    // 3. TEAM POWER SECTION
                    PrestOverlapSection(
                      variant: PrestSectionVariant.imageLeft,
                      imagePath: ImagesConstants.team_2,
                      backgroundColor: theme.colors.milk,
                      textContent: _buildTeamPowerDescription(theme),
                    ),

                    // 4. CALL TO ACTION FOOTER
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

  // --- SECTION BUILDERS ---

  Widget _buildHeroSection(
      PrestThemeData theme,
      double padding,
      bool isMobile,
      ) {
    // Спільний віджет заголовка для мобілки та десктопа
    final sectionHeader = PrestSectionHeader(
      title: Text(
        'POZNAJ NAS',
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
                _buildHeroTypography(theme, isMobile),
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
                        child: _buildHeroTypography(theme, isMobile),
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

  Widget _buildHeroTypography(PrestThemeData theme, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skuteczna sprzedaż.\nPrzemyślany zakup.',
          style: theme.blackTextTheme.font2.copyWith(
            height: 1.2,
            fontSize: isMobile ? 32 : 44,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Zajmujemy się sprzedażą i wynajmem nieruchomości. Takich transakcji mamy na koncie najwięcej. Ponadto wyszukujemy dla Klientów perełki na specjalne zamówienie.',
          style: theme.blackTextTheme.font4.copyWith(
            height: 1.7,
            color: theme.colors.chineseBlack.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'prEST to spotkanie kontrastujących osobowości i pozornie різних światów, ale łączy nas zamiłowanie do sprzedaży i pracy z ludźmi, a także pasja do nieruchomości.',
          style: theme.blackTextTheme.font4.copyWith(
            height: 1.7,
            color: theme.colors.chineseBlack.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamPowerDescription(PrestThemeData theme) {
    return RichText(
      text: TextSpan(
        style: theme.blackTextTheme.font4.copyWith(
          height: 1.7,
          fontSize: 18,
          color: theme.colors.chineseBlack.withValues(alpha: 0.8),
        ),
        children: [
          const TextSpan(
            text: 'Dlatego każdą sprzedażą zajmuje się u nas nie jedna osoba, lecz kilkuosobowy zespół specjalistów, którzy wspólnie dbają o każdy detal procesu. ',
          ),
          const TextSpan(
            text: 'Łączymy wiedzę rynkową, doświadczenie inwestycyjne, skuteczny marketing i mądre, spokojne negocjacje.',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const TextSpan(
            text: '\n\nPracujemy uważnie i z заangażowaniem, słuchamy, analizujemy, doradzamy. Prowadzimy klientów przez cały proces krok po kroku, tak aby czuli się pewnie, bezpiecznie i po prostu dobrze zaopiekowani.\n\n',
          ),
          const TextSpan(
            text: 'Bo dla nas nieruchomości to nie tylko transakcje. ',
          ),
          const TextSpan(
            text: 'To ważne decyzje i realne historie ludzi, którym towarzyszymy od pierwszej rozmowy aż do finalnego podpisu.',
            style: TextStyle(fontWeight: FontWeight.w700),
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
    return Container(
      width: double.infinity,
      color: theme.colors.white,
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Center(
        child: ScrollRevealBox(
          child: PrestDarkBorderButton(
            label: 'UMÓW ROZMOWĘ',
            onPressed: () => PrestDialog.showContact(
              context,
              title: 'UMÓW ROZMOWĘ',
              showWiadomosc: false,
            ),
            width: 280,
          ),
        ),
      ),
    );
  }
}