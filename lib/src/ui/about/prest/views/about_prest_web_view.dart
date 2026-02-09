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
              // Визначаємо падінг як у хедері (40px для десктопа)
              final double sidePadding = width < 1200 ? 24 : 40;

              return Column(
                children: [
                  // СЕКЦІЯ 1: MILK BACKGROUND
                  _buildSection(
                    theme: theme,
                    color: theme.colors.milk,
                    sidePadding: sidePadding,
                    child: Column(
                      children: [
                        const SizedBox(height: 140),
                        ScrollRevealBox(
                          child: _buildWebHeader(theme, 'POZNAJ NAS'),
                        ),
                        const SizedBox(height: 25), // В 4 рази менше, як домовлялися
                        _SingleScrollAnimRow(
                          text: 'Zajmujemy się sprzedażą i wynajmem nieruchomości. Takich transakcji mamy na koncie najwięcej. Ponadto wyszukujemy dla Klientów perełki na specjalne zamówienie.',
                          imageUrl: ImagesConstants.house5,
                          isImageLeft: false,
                          screenWidth: width,
                        ),
                      ],
                    ),
                  ),

                  // СЕКЦІЯ 2: WHITE BACKGROUND
                  _buildSection(
                    theme: theme,
                    color: theme.colors.white,
                    sidePadding: sidePadding,
                    child: _SingleScrollAnimRow(
                      text: 'prEST to spotkanie kontrastujących osobowości i pozornie różnych światów, ale łączy nas zamiłowanie do sprzedaży i pracy z ludźmi, a także pasja do nieruchomości.',
                      imageUrl: ImagesConstants.aboutImage,
                      isImageLeft: true,
                      screenWidth: width,
                    ),
                  ),

                  // СЕКЦІЯ 3: MILK BACKGROUND + CTA
                  _buildSection(
                    theme: theme,
                    color: theme.colors.milk,
                    sidePadding: sidePadding,
                    child: Column(
                      children: [
                        _SingleScrollAnimRow(
                          text: 'Wiemy, że skuteczna sprzedaż wynika z dobrego planu, a przemyślany proces jest kluczowy w projektowaniu wartościowych rozwiązań.',
                          imageUrl: ImagesConstants.house5,
                          isImageLeft: false,
                          screenWidth: width,
                        ),
                        const SizedBox(height: 100),
                        ScrollRevealBox(
                          delay: const Duration(milliseconds: 400),
                          child: PrestDarkBorderButton(
                            label: 'UMÓW ROZMOWĘ',
                            onPressed: () => PrestDialog.showContact(context, title: 'UMÓW ROZMOWĘ'),
                            width: 280,
                          ),
                        ),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }



  /// Обгортка для секції, яка тримає колір фону на всю ширину,
  /// але контент обмежує по LayoutsConstants.maxContentWidth
  Widget _buildSection({
    required PrestThemeData theme,
    required Color color,
    required double sidePadding,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      color: color,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LayoutsConstants.maxContentWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _buildWebHeader(PrestThemeData theme, String title) {
    return Column(
      children: [
        SelectableText(
          title,
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font1.copyWith(
            letterSpacing: 25,
            fontWeight: FontWeight.w100,
            fontSize: 55,
          ),
        ),
        const SizedBox(height: 30),
        Container(height: 1, width: 80, color: theme.colors.gold),
      ],
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
          ? Column( // На маленьких екранах перемикаємо в колонку
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
          const SizedBox(width: 40), // Фіксований відступ між текстом і фото
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