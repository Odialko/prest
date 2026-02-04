import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/advice/advice_screen.dart';

class AdviceWebView extends AdviceScreen {
  const AdviceWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final double sidePadding = width < 1200 ? 24 : 40;

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // --- HEADER (WHITE) ---
              _buildSection(
                color: theme.colors.milk,
                sidePadding: sidePadding,
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    ScrollRevealBox(child: _buildHeader(theme, 'INWESTYCJE')),
                    const SizedBox(height: 25),
                    _buildIntro(theme),
                    const SizedBox(height: 60),
                  ],
                ),
              ),

              // --- BLOCK 1: STRATEGY (MILK) ---
              _buildSection(
                color: theme.colors.milk,
                sidePadding: sidePadding,
                child: _AdviceScrollRow(
                  imagePath: ImagesConstants.house5, // Фото масштабного проекту
                  isImageLeft: false,
                  screenWidth: width,
                  children: [
                    _buildParagraph(theme,
                        'Oferujemy profesjonalne doradztwo inwestycyjne zarówno dla klientów indywidualnych, jak i przy większych projektach deweloperskich i portfelowych.',
                        isBold: true),
                    const SizedBox(height: 25),
                    _buildParagraph(theme,
                        'Pomagamy bezpiecznie i świadomie lokować kapitał w nieruchomościach — od pojedynczych mieszkań inwestycyjnych, po kompleksowe przedsięwzięcia na większą skalę.'),
                  ],
                ),
              ),

              // --- BLOCK 2: ANALYSIS (WHITE) ---
              _buildSection(
                color: theme.colors.white,
                sidePadding: sidePadding,
                child: _AdviceScrollRow(
                  imagePath: ImagesConstants.aboutImage, // Фото з аналітикою/планами
                  isImageLeft: true,
                  screenWidth: width,
                  children: [
                    _buildParagraph(theme,
                        'Analizujemy potencjał lokalizacji, opłacalność projektu, ryzyka oraz możliwe scenariusze wyjścia z inwestycji.',
                        isBold: true,
                        color: theme.colors.gold),
                    const SizedBox(height: 25),
                    _buildParagraph(theme,
                        'Łączymy wiedzę rynkową, doświadczenie transakcyjne i chłodną kalkulację з realnym spojrzeniem na cele klienta.'),
                    const SizedBox(height: 25),
                    _buildParagraph(theme,
                        'Dzięki temu rekomendujemy rozwiązania, które mają sens nie tylko „na papierze”, ale przede wszystkim w praktyce.'),
                    const SizedBox(height: 25),
                    _buildParagraph(theme,
                        'Niezależnie od skali inwestycji — działamy z tą samą starannością, dyskrecją i odpowiedzialnością.'),
                  ],
                ),
              ),

              // --- CTA SECTION (MILK) ---
              _buildSection(
                color: theme.colors.milk,
                sidePadding: sidePadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 120),
                  child: _buildFormSection(theme),
                ),
              ),
              Container(height: 100, color: theme.colors.white),
            ],
          ),
        ),
      ],
    );
  }

  // --- HELPERS (STABLE STRUCTURE) ---

  Widget _buildSection({required Color color, required double sidePadding, required Widget child}) {
    return Container(
      width: double.infinity,
      color: color,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(PrestThemeData theme, String title) {
    return Column(
      children: [
        SelectableText(title,
          style: theme.blackTextTheme.font1.copyWith(
            letterSpacing: 25,
            fontSize: 55,
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(height: 30),
        Container(height: 1, width: 80, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildIntro(PrestThemeData theme) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 850),
      child: SelectableText(
        'Doradztwo inwestycyjne',
        textAlign: TextAlign.center,
        style: theme.blackTextTheme.font3.copyWith(fontSize: 32, fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget _buildParagraph(PrestThemeData theme, String text, {bool isBold = false, Color? color}) {
    return SelectableText(
      text,
      style: theme.blackTextTheme.font7.copyWith(
        fontSize: 18,
        height: 1.8,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w300,
        color: color ?? theme.colors.chineseBlack,
      ),
    );
  }

  Widget _buildFormSection(PrestThemeData theme) {
    return Column(
      children: [
        ScrollRevealBox(
          child: SelectableText(
            'POTRZEBUJESZ DORADZTWA?',
            style: theme.blackTextTheme.font3.copyWith(fontSize: 28, letterSpacing: 4, fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 60),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            border: Border.all(color: theme.colors.gold.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              const Text("FORMULARZ KONTAKTU"),
              const SizedBox(height: 30),
              PrestDarkBorderButton(label: 'ZAMÓW KONSULTACJĘ', onPressed: () {}, width: double.infinity),
            ],
          ),
        ),
      ],
    );
  }
}

class _AdviceScrollRow extends StatelessWidget {
  final List<Widget> children;
  final String imagePath;
  final bool isImageLeft;
  final double screenWidth;

  const _AdviceScrollRow({
    required this.children,
    required this.imagePath,
    required this.isImageLeft,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );

    final textWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
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
          const SizedBox(width: 80),
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