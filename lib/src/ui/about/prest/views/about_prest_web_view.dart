import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/contact_dialog.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import '../about_prest_screen.dart';

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
              final double sidePadding = width < 1200 ? 24 : 40;
              final bool isMobile = width < 1000;

              return SelectionArea(
                child: Column(
                  children: [
                    // 1. ЗАГОЛОВОК + ПІДЗАГОЛОВОК (MILK)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.milk,
                      sidePadding: sidePadding,
                      child: Column(
                        children: [
                          SizedBox(height: isMobile ? 80 : 140),
                          ScrollRevealBox(child: _buildWebHeader(theme, 'POZNAJ NAS', isMobile)),
                          const SizedBox(height: 40),
                          ScrollRevealBox(
                            delay: const Duration(milliseconds: 200),
                            child: _buildSubHeader(theme, width),
                          ),
                          SizedBox(height: isMobile ? 60 : 100),
                        ],
                      ),
                    ),

                    // 2. ПЕРШИЙ БЛОК (WHITE)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.white,
                      sidePadding: sidePadding,
                      child: _SingleScrollAnimRow(
                        text: 'Zajmujemy się sprzedażą i wynajmem nieruchomości. Takich transakcji mamy na koncie najwięcej.',
                        imageUrl: ImagesConstants.house5,
                        isImageLeft: false,
                        screenWidth: width,
                      ),
                    ),

                    // 3. ДРУГИЙ БЛОК - OVERLAP (MILK + WHITE BASE)
                    _buildVileaOverlapSection(theme, width, sidePadding),

                    // 4. ТРЕТІЙ БЛОК (WHITE) - Текст і фотка знову на білому
                    _buildSection(
                      theme: theme,
                      color: theme.colors.white,
                      sidePadding: sidePadding,
                      child: _SingleScrollAnimRow(
                        text: 'Wiemy, że skuteczna sprzedaż wynika z dobrego planu, a przemyślany proces jest kluczowy.',
                        imageUrl: ImagesConstants.house5,
                        isImageLeft: false,
                        screenWidth: width,
                      ),
                    ),

                    // 5. ЗАКЛЮЧНИЙ CTA (MILK)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.milk,
                      sidePadding: sidePadding,
                      child: Column(
                        children: [
                          const SizedBox(height: 100),
                          ScrollRevealBox(
                            delay: const Duration(milliseconds: 400),
                            child: PrestDarkBorderButton(
                              label: 'UMÓW ROZMOWĘ',
                              onPressed: () => PrestDialog.showContact(context, title: 'UMÓW ROZMOWĘ', showWiadomosc: false),
                              width: 280,
                            ),
                          ),
                          const SizedBox(height: 150),
                        ],
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

  Widget _buildVileaOverlapSection(PrestThemeData theme, double width, double sidePadding) {
    final bool isMobile = width < 1100;

    if (isMobile) {
      return _buildSection(
        theme: theme,
        color: theme.colors.milk,
        sidePadding: sidePadding,
        child: _SingleScrollAnimRow(
          text: 'prEST to spotkanie kontrastujących osobowości...',
          imageUrl: ImagesConstants.aboutImage,
          isImageLeft: true,
          screenWidth: width,
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.white, // Основа біла
      height: 650,
      child: Stack(
        children: [
          // Права частина фону - Milk
          Align(
            alignment: Alignment.centerRight,
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
                      flex: 6,
                      child: ScrollRevealBox(
                        child: Transform.translate(
                          offset: const Offset(60, 0), // Наїзд на Milk
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 30,
                                  offset: const Offset(10, 15),
                                )
                              ],
                            ),
                            child: Image.asset(ImagesConstants.aboutImage, fit: BoxFit.cover, height: 480),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    Expanded(
                      flex: 5,
                      child: ScrollRevealBox(
                        delay: const Duration(milliseconds: 300),
                        child: Text(
                          'prEST to spotkanie kontrastujących osobowości i pozornie różnych światów...',
                          style: theme.blackTextTheme.font3.copyWith(height: 1.8, fontSize: 22),
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

  // --- HELPER METHODS ---

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

  Widget _buildWebHeader(PrestThemeData theme, String title, bool isMobile) {
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

  Widget _buildSubHeader(PrestThemeData theme, double width) {
    final bool isSmall = width < 800;
    return Container(
      constraints: const BoxConstraints(maxWidth: 850),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: theme.blackTextTheme.font3.copyWith(
                fontSize: isSmall ? 18 : 26,
                height: 1.4,
                letterSpacing: 1.2,
                color: theme.colors.chineseBlack,
              ),
              children: const [
                TextSpan(text: 'Skuteczna sprzedaż. ', style: TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(text: 'Przemyślany zakup.', style: TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Towarzyszymy w całym procesie, od pierwszej rozmowy aż po ostatni uścisk dłoni, budując relacje, które mają wartość także po zakończeniu transakcji.',
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font6.copyWith(
              fontSize: isSmall ? 14 : 17,
              height: 1.6,
              color: theme.colors.chineseBlack.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleScrollAnimRow extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool isImageLeft;
  final double screenWidth;

  const _SingleScrollAnimRow({
    required this.text,
    required this.imageUrl,
    required this.isImageLeft,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final bool isSmallWeb = screenWidth < 1000;

    final imageWidget = Container(
      height: isSmallWeb ? 350 : 480,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );

    final textWidget = Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallWeb ? 20 : 60,
      ),
      child: SelectableText(
        text,
        style: theme.blackTextTheme.font3.copyWith(
          height: 1.8,
          fontWeight: FontWeight.w200,
          fontSize: isSmallWeb ? 18 : 22,
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: isSmallWeb
          ? Column(
        children: [
          ScrollRevealBox(child: imageWidget),
          const SizedBox(height: 40),
          ScrollRevealBox(child: textWidget),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: ScrollRevealBox(
              child: isImageLeft ? imageWidget : textWidget,
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 5,
            child: ScrollRevealBox(
              delay: const Duration(milliseconds: 300),
              child: isImageLeft ? textWidget : imageWidget,
            ),
          ),
        ],
      ),
    );
  }
}
