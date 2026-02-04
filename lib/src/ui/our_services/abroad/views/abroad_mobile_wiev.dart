import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/abroad/abroad_screen.dart';

class AbroadMobileView extends AbroadScreen {
  const AbroadMobileView({super.key});

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
                      SelectableText('ZAGRANICA',
                          style: theme.blackTextTheme.font1.copyWith(fontSize: 32, letterSpacing: 10)),
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
                child: SelectableText('Zakupy za granicą',
                    textAlign: TextAlign.center,
                    style: theme.blackTextTheme.font3.copyWith(fontSize: 24, fontWeight: FontWeight.w300)),
              ),

              const SizedBox(height: 40),

              // Block 1
              _buildMobileImgBlock(imagePath: ImagesConstants.house5, padding: sidePadding),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: _buildParagraph(theme,
                    'Oferujemy wsparcie przy zakupie nieruchomości za granicą. Pomagamy w wyborze sprawdzonych rynków — prywatnie i inwestycyjnie.',
                    isBold: true),
              ),

              const SizedBox(height: 40),

              // Block 2 (Milk)
              Container(
                color: theme.colors.milk,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: sidePadding),
                child: Column(
                  children: [
                    _buildParagraph(theme, 'Dbamy o кожен деталь: від селекції до фіналізації. Działamy selektywnie.'),
                    const SizedBox(height: 20),
                    _buildParagraph(theme, 'Rekomendujemy wyłącznie projekty, za którymi możemy stanąć własnym nazwiskiem.', color: theme.colors.gold),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // CTA
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: PrestDarkBorderButton(label: 'DOWIEDZ SIĘ WIĘCEJ', onPressed: () {}, width: double.infinity),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileImgBlock({required String imagePath, required double padding}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildParagraph(PrestThemeData theme, String text, {bool isBold = false, Color? color}) {
    return SelectableText(text,
        textAlign: TextAlign.center,
        style: theme.blackTextTheme.font7.copyWith(
          fontSize: 16, height: 1.6,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w300,
          color: color,
        ));
  }
}