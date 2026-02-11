import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/about/join_us/join_us_screen.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';

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
              final double sidePadding = width < 1200 ? 24 : 40;
              final bool isMobile = width < 1100;

              return SelectionArea(
                child: Column(
                  children: [
                    // 1. HEADER (MILK)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.milk,
                      sidePadding: sidePadding,
                      child: Column(
                        children: [
                          SizedBox(height: isMobile ? 80 : 140),
                          ScrollRevealBox(child: _buildCenteredHeader(theme, 'DOŁĄCZ DO NAS', isMobile)),
                          const SizedBox(height: 40),
                          ScrollRevealBox(
                            delay: const Duration(milliseconds: 200),
                            child: _buildMainIntro(theme, width),
                          ),
                          SizedBox(height: isMobile ? 60 : 100),
                        ],
                      ),
                    ),

                    // 2. TEXT BLOCK 1 (WHITE)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.white,
                      sidePadding: sidePadding,
                      child: _JoinUsRow(
                        title: 'Nasz zespół to nasz największy kapitał.',
                        text: 'Jako zaufani doradcy najbardziej wymagających klientów prywatnych i instytucjonalnych, nasi agenci każdego dnia potwierdzają, що їх професіоналізм realnie przekładają się na sukcesy naszych klientów.',
                        subText: 'Szukamy talentów. Pasjonatów sprzedaży. Ludzi, którzy chcą grać w pierwszej lidze.',
                        imageUrl: ImagesConstants.join_1,
                        isImageLeft: false,
                        screenWidth: width,
                      ),
                    ),

                    // 3. OVERLAP SECTION (MILK BACKGROUND EFFECT)
                    _buildOverlapJoinSection(theme, width, sidePadding),

                    // 4. FORM SECTION (WHITE)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.white,
                      sidePadding: sidePadding,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 120),
                        child: Column(
                          children: [
                            ScrollRevealBox(
                              child: Text(
                                'WYPEŁNIJ FORMULARZ',
                                style: theme.blackTextTheme.font3.copyWith(
                                  fontSize: isMobile ? 22 : 28,
                                  letterSpacing: 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ScrollRevealBox(
                              delay: const Duration(milliseconds: 200),
                              child: Text(
                                'WYŚLIJ NAM SWOJE CV, A MY SKONTAKTUJEMY SIĘ Z TOBĄ WKRÓTCE.',
                                textAlign: TextAlign.center,
                                style: theme.grayTextTheme.font7.copyWith(fontSize: 14, height: 1.6),
                              ),
                            ),
                            const SizedBox(height: 80),
                            // Тут твоя майбутня форма
                            _buildMockForm(theme, width),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ЕФЕКТ НАШАРУВАННЯ (Як у About)
  Widget _buildOverlapJoinSection(PrestThemeData theme, double width, double sidePadding) {
    final bool isMobile = width < 1100;

    if (isMobile) {
      return _buildSection(
        theme: theme,
        color: theme.colors.milk,
        sidePadding: sidePadding,
        child: _JoinUsRow(
          title: 'Pomagamy realnie osiągać cele.',
          text: 'Dołączając do zespołu prEST, stajesz się częścią dynamicznego środowiska. Budujemy wiedzę, szlifujemy warsztat i wspieramy в творенні особистого бренду.',
          subText: 'W prEST pomagamy Agentom rosnąć i błyszczeć własnymi sukcesami.',
          imageUrl: ImagesConstants.join_2,
          isImageLeft: true,
          screenWidth: width,
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 700,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft, // Фон зліва для різноманіття
            child: Container(
              width: width * 0.65,
              color: theme.colors.milk,
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ScrollRevealBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pomagamy realnie osiągać cele.',
                              style: theme.blackTextTheme.font3.copyWith(fontSize: 32, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Dołączając do zespołu prEST, stajesz się częścią dynamicznego, ambitnego środowiska, które ceni kreatywność i rozwój.',
                              style: theme.blackTextTheme.font7.copyWith(fontSize: 18, height: 1.8, fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    Expanded(
                      flex: 6,
                      child: ScrollRevealBox(
                        delay: const Duration(milliseconds: 300),
                        child: Transform.translate(
                          offset: const Offset(-60, 0), // Наїзд фотографії на Milk фон зліва
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 40,
                                  offset: const Offset(-10, 20),
                                )
                              ],
                            ),
                            child: Image.asset(ImagesConstants.house5, fit: BoxFit.cover, height: 500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPERS ---

  Widget _buildCenteredHeader(PrestThemeData theme, String title, bool isMobile) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font1.copyWith(
            letterSpacing: isMobile ? 12 : 25,
            fontWeight: FontWeight.w100,
            fontSize: isMobile ? 32 : 55,
          ),
        ),
        const SizedBox(height: 30),
        Container(height: 1, width: 80, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildMainIntro(PrestThemeData theme, double width) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 850),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: theme.blackTextTheme.font3.copyWith(
            fontSize: width < 800 ? 20 : 30,
            fontWeight: FontWeight.w200,
            height: 1.5,
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

  Widget _buildSection({required PrestThemeData theme, required Color color, required double sidePadding, required Widget child}) {
    return Container(
      width: double.infinity,
      color: color,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: sidePadding), child: child),
        ),
      ),
    );
  }

  Widget _buildMockForm(PrestThemeData theme, double width) {
    return Container(
      width: width < 800 ? double.infinity : 700,
      padding: const EdgeInsets.all(60),
      color: theme.colors.milk,
      child: Column(
        children: [
          const Icon(Icons.description_outlined, size: 40, color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            "MIEJSCE NA TWÓJ FORMULARZ",
            style: theme.blackTextTheme.font9.copyWith(letterSpacing: 2),
          ),
          const SizedBox(height: 40),
          PrestDarkBorderButton(label: 'WGRAJ CV', onPressed: () {}, width: 220),
        ],
      ),
    );
  }
}

class _JoinUsRow extends StatelessWidget {
  final String title;
  final String text;
  final String subText;
  final String imageUrl;
  final bool isImageLeft;
  final double screenWidth;

  const _JoinUsRow({
    required this.title,
    required this.text,
    required this.subText,
    required this.imageUrl,
    required this.isImageLeft,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final bool isMobile = screenWidth < 1100;

    final imageWidget = Container(
      height: isMobile ? 350 : 500,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
    );

    final textWidget = Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.blackTextTheme.font3.copyWith(
              fontSize: isMobile ? 22 : 28,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            text,
            style: theme.blackTextTheme.font7.copyWith(fontSize: 17, height: 1.8, fontWeight: FontWeight.w200),
          ),
          const SizedBox(height: 25),
          Text(
            subText,
            style: theme.blackTextTheme.font7.copyWith(
              fontSize: 16,
              height: 1.6,
              color: theme.colors.gold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: isMobile
          ? Column(
        children: [
          ScrollRevealBox(child: imageWidget),
          const SizedBox(height: 40),
          ScrollRevealBox(delay: const Duration(milliseconds: 200), child: textWidget),
        ],
      )
          : Row(
        children: [
          Expanded(flex: 5, child: isImageLeft ? ScrollRevealBox(child: imageWidget) : ScrollRevealBox(child: textWidget)),
          const SizedBox(width: 80),
          Expanded(flex: 5, child: isImageLeft ? ScrollRevealBox(delay: const Duration(milliseconds: 200), child: textWidget) : ScrollRevealBox(delay: const Duration(milliseconds: 200), child: imageWidget)),
        ],
      ),
    );
  }
}