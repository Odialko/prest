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
import 'package:prest/src/ui/our_services/for_developers/for_developers_screen.dart';

class ForDevelopersWebView extends ConsumerWidget
    implements ForDevelopersScreen {
  const ForDevelopersWebView({super.key});

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
              final double sidePadding = isMobile ? 24 : 40;

              return SelectionArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. HERO SECTION (ТЕКСТ + ТАЙТЛ НАВПРОТИ ФОТО)
                    _buildHeroSection(theme, sidePadding, isMobile),

                    // 2. BLOCK 1 (IMAGE LEFT - MILK)
                    PrestOverlapSection(
                      variant: PrestSectionVariant.onlyText,
                      backgroundColor: theme.colors.white,
                      height: isMobile ? 150 : 250,
                      textContent: Text(
                        'Bez kosztownych struktur. \nBez chaosu.',
                        textAlign: TextAlign.center, // Змінив на Center для симетрії
                        style: isMobile
                            ? theme.blackTextTheme.font2.copyWith(fontSize: 28)
                            : theme.blackTextTheme.font2.copyWith(fontSize: 48),
                      ),
                    ),
                    PrestOverlapSection(
                      variant: PrestSectionVariant.imageLeft,
                      imagePath: ImagesConstants.developer_1,
                      backgroundColor: theme.colors.milk,
                      textContent: _buildTeamPowerDescription(theme),
                    ),

                    // 3. FEATURES SECTION
                    _buildFeaturesSection(theme, isMobile, sidePadding),

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

  Widget _buildHeroSection(PrestThemeData theme, double padding, bool isMobile) {
    // Використовуємо Flexible, щоб уникнути Overflow у Row
    final sectionHeader = Flexible(
      child: PrestSectionHeader(
        title: Text(
          'DLA DEWELOPERÓW',
          style: isMobile
              ? theme.arsenicTextTheme.font5
              : theme.arsenicTextTheme.font2.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

    return Container(
      color: theme.colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
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
                _buildMergedTypography(theme),
                const SizedBox(height: 40),
                _buildImage(ImagesConstants.developer_2, isMobile),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ЛІВА ЧАСТИНА: ТАЙТЛ ТА ТЕКСТ
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScrollRevealBox(child: Row(children: [sectionHeader])),
                      const SizedBox(height: 60),
                      ScrollRevealBox(
                        delay: const Duration(milliseconds: 200),
                        child: _buildMergedTypography(theme),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                // ПРАВА ЧАСТИНА: ФОТО
                Expanded(
                  flex: 5,
                  child: ScrollRevealBox(
                    delay: const Duration(milliseconds: 400),
                    child: _buildImage(ImagesConstants.developer_3, isMobile),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
            text: 'Nie ma potrzeby budować wewnętrznych zespołów. Przejmujemy odpowiedzialność za cały obszar sprzedaży — od zarządzania procesem po codzienną pracę z klientem.',
          ),
        ],
      ),
    );
  }

  // Весь текст в один блок з однаковим шрифтом font4
  Widget _buildMergedTypography(PrestThemeData theme) {
    return Text(
      'Dzisiejszy rynek wymaga precyzji, rytmu i konsekwencji. My projektujemy ten proces świadomie. Projektujemy sukces inwestycji. Sprzedaż jako system, nie improwizacja. Wspieramy deweloperów kompleksowo: od konsultacji koncepcji inwestycji, przez stworzenie strategii marketingowej i sprzedażowej, po pełną realizację procesu.',
      style: theme.blackTextTheme.font4.copyWith(
        height: 1.7,
        color: theme.colors.chineseBlack.withValues(alpha: 0.7),
      ),
    );
  }

  Widget _buildImage(String path, bool isMobile) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      height: isMobile ? null : 580,
      width: double.infinity,
    );
  }

  Widget _buildFeaturesSection(PrestThemeData theme, bool isMobile, double padding) {
    final List<String> features = [
      'Konsultacje projektu na etapie koncepcji.',
      'Wsparcie w przygotowaniu bezpiecznych umów.',
      'Kompleksowy marketing inwestycji.',
      'Dostęp do aktywnej bazy klientów.',
      'Pełne przejęcie procesu sprzedaży.',
      'Projektowanie apartamentów pokazowych.',
      'Elastyczny model współpracy.'
    ];

    return Container(
      color: theme.colors.white,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Column(
            children: [
              PrestSectionHeader(
                title: Text(
                  'KOMPLEKSOWA OBSŁUGA',
                  style: theme.blackTextTheme.font7.copyWith(letterSpacing: 4, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 80),
              Wrap(
                spacing: 60, runSpacing: 40,
                alignment: WrapAlignment.center,
                children: features.map((f) => SizedBox(
                  width: isMobile ? double.infinity : 400,
                  child: Row(
                    children: [
                      Icon(Icons.fiber_manual_record, size: 8, color: theme.colors.gold),
                      const SizedBox(width: 20),
                      Expanded(child: Text(f, style: theme.blackTextTheme.font5)),
                    ],
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
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
            label: 'SKONTAKTUJ SIĘ',
            onPressed: () => PrestDialog.showContact(context, title: 'WSPÓŁPRACA DEWELOPERSKA'),
            width: 280,
          ),
        ),
      ),
    );
  }
}
