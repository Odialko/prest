import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/advice/advice_screen.dart';

class AdviceMobileView extends AdviceScreen {
  const AdviceMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final double sidePadding = 24.0;

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 80),

              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: ScrollRevealBox(
                  child: Column(
                    children: [
                      SelectableText('INWESTYCJE',
                          style: theme.blackTextTheme.font1.copyWith(fontSize: 36, letterSpacing: 12)),
                      const SizedBox(height: 20),
                      Container(height: 1, width: 60, color: theme.colors.gold),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Intro
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: SelectableText('Doradztwo inwestycyjne',
                    textAlign: TextAlign.center,
                    style: theme.blackTextTheme.font3.copyWith(fontSize: 24, fontWeight: FontWeight.w300)),
              ),

              const SizedBox(height: 40),

              // Content Block 1
              _buildMobileBlock(
                theme: theme,
                padding: sidePadding,
                imagePath: ImagesConstants.house5,
                text: 'Oferujemy profesjonalne doradztwo inwestycyjne dla klientów indywidualnych oraz deweloperów. Pomagamy bezpiecznie lokować kapitał w nieruchomościach.',
              ),

              // Content Block 2 (Milk Background)
              Container(
                color: theme.colors.milk,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: sidePadding),
                child: Column(
                  children: [
                    _buildParagraph(theme, 'Analizujemy potencjał lokalizacji, opłacalność oraz ryzyka. Rekomendujemy rozwiązania, które mają sens w praktyce.', isBold: true),
                    const SizedBox(height: 20),
                    _buildParagraph(theme, 'Działamy z pełną dyskrecją i odpowiedzialnością, niezależnie від skali projektu.'),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // CTA
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Column(
                  children: [
                    SelectableText('CHCESZ ZAINWESTOWAĆ?',
                        style: theme.blackTextTheme.font3.copyWith(fontSize: 22, letterSpacing: 2)),
                    const SizedBox(height: 40),
                    PrestDarkBorderButton(label: 'UMÓW KONSULTACJĘ', onPressed: () {}, width: double.infinity),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileBlock({required PrestThemeData theme, required double padding, required String imagePath, required String text}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          _buildParagraph(theme, text),
        ],
      ),
    );
  }

  Widget _buildParagraph(PrestThemeData theme, String text, {bool isBold = false}) {
    return SelectableText(text,
        textAlign: TextAlign.center,
        style: theme.blackTextTheme.font7.copyWith(fontSize: 16, height: 1.6, fontWeight: isBold ? FontWeight.w600 : FontWeight.w300));
  }
}