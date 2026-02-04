import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/credit/credit_screen.dart';

class CreditMobileView extends CreditScreen {
  const CreditMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final double sidePadding = 24.0; // Стандартний мобільний падінг

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // --- HEADER ---
              const SizedBox(height: 80), // Менший відступ для мобілок
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: ScrollRevealBox(child: _buildMobileHeader(theme)),
              ),
              const SizedBox(height: 40),

              // --- INTRO ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: _buildMobileIntro(theme),
              ),
              const SizedBox(height: 40),

              // --- IMAGE ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.asset(
                      ImagesConstants.aboutImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // --- MAIN TEXT CONTENT ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: _buildMobileMainContent(theme),
              ),

              const SizedBox(height: 60),

              // --- CTA / FORM SECTION ---
              Container(
                color: theme.colors.milk,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 80),
                child: _buildMobileFormSection(theme),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHeader(PrestThemeData theme) {
    return Column(
      children: [
        SelectableText(
          'KREDYTY',
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font1.copyWith(
            letterSpacing: 12, // Зменшено для мобілок
            fontSize: 36,       // Зменшено, щоб не вилазило за екран
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(height: 20),
        Container(height: 1, width: 60, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildMobileIntro(PrestThemeData theme) {
    return SelectableText(
      'Doradztwo kredytowe',
      textAlign: TextAlign.center,
      style: theme.blackTextTheme.font3.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildMobileMainContent(PrestThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildParagraph(theme,
            'Znalezienie najlepszej oferty kredytu hipotecznego lub pożyczki bywa dziś procesem złożonym, czasochłonnym i — nie oszukujmy się — frustrującym.',
            isBold: true),
        const SizedBox(height: 20),
        _buildParagraph(theme,
            'Co zrobić, gdy potrzebujesz dodatkowych środków, a brakuje Ci specjalistycznej wiedzy finansowej, rozeznania w ofertach banków albo po prostu czasu na prowadzenie całej procedury?'),
        const SizedBox(height: 20),
        _buildParagraph(theme, 'Nie działaj pochopnie.', color: theme.colors.gold),
        const SizedBox(height: 20),
        _buildParagraph(theme,
            'W takich sprawach warto zaufać wyłącznie sprawdzonym ekspertom. Nietrafiony wybór doradcy kredytowego może słono kosztować.'),
        const SizedBox(height: 20),
        _buildParagraph(theme,
            'W naszej agencji współpracujemy z doświadczonym ekspertem kredytowym, który potrafi przeprowadzić навіть найбільш вимогливі справи в спосіб простий, упорядкований і ефективний.'),
      ],
    );
  }

  Widget _buildParagraph(PrestThemeData theme, String text, {bool isBold = false, Color? color}) {
    return ScrollRevealBox(
      child: SelectableText(
        text,
        style: theme.blackTextTheme.font7.copyWith(
          fontSize: 16, // Оптимально для читання з телефона
          height: 1.6,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w300,
          color: color ?? theme.colors.chineseBlack,
        ),
      ),
    );
  }

  Widget _buildMobileFormSection(PrestThemeData theme) {
    return Column(
      children: [
        SelectableText(
          'POTRZEBUJESZ KREDYTU?',
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font3.copyWith(
            fontSize: 22,
            letterSpacing: 2,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 15),
        SelectableText(
          'ZOSTAW SWOJE DANE, A NASZ EKSPERT ODDZWONI DO CIEBIE.',
          textAlign: TextAlign.center,
          style: theme.grayTextTheme.font7.copyWith(fontSize: 13, height: 1.5),
        ),
        const SizedBox(height: 40),
        // Контейнер форми на мобайлі займає всю доступну ширину
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: theme.colors.gold.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              const Text("FORMULARZ KREDYTOWY"),
              const SizedBox(height: 20),
              PrestDarkBorderButton(
                label: 'ZAMÓW KONSULTACJĘ',
                onPressed: () {},
                width: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}