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

              return Column(
                children: [
                  // --- HEADER SECTION ---
                  _buildSection(
                    color: theme.colors.milk,
                    sidePadding: sidePadding,
                    child: Column(
                      children: [
                        const SizedBox(height: 140),
                        ScrollRevealBox(child: _buildCenteredHeader(theme, 'DOŁĄCZ DO NAS')),
                        const SizedBox(height: 25), // Відступ у 4 рази менший
                        _buildMainIntro(theme, width),
                      ],
                    ),
                  ),

                  // --- TEXT BLOCK 1 (Text Left, Image Right) ---
                  _buildSection(
                    color: theme.colors.white,
                    sidePadding: sidePadding,
                    child: _JoinUsRow(
                      title: 'Nasz zespół to nasz największy kapitał.',
                      text: 'Jako zaufani doradcy najbardziej wymagających klientów prywatnych i instytucjonalnych, nasi agenci każdego dnia potwierdzają, że ich profesjonalizm, zaangażowanie i skuteczność realnie przekładają się na sukcesy naszych klientów.',
                      subText: 'Szukamy talentów. Pasjonatów sprzedaży. Ludzi, którzy chcą grać w pierwszej lidze.',
                      imageUrl: ImagesConstants.aboutImage,
                      isImageLeft: false,
                      screenWidth: width,
                    ),
                  ),

                  // --- TEXT BLOCK 2 (Image Left, Text Right) ---
                  _buildSection(
                    color: theme.colors.milk,
                    sidePadding: sidePadding,
                    child: _JoinUsRow(
                      title: 'Pomagamy realnie osiągać cele.',
                      text: 'Dołączając do zespołu prEST, stajesz się częścią dynamicznego, ambitnego środowiska, które ceni kreatywność, zaangażowanie i rozwój. Budujemy wiedzę, szlifujemy warsztat i wspieramy w tworzeniu silnej, rozpoznawalnej marki osobistej.',
                      subText: 'W prEST pomagamy Agentom не tylko skutecznie sprzedawać. Pomagamy im rosnąć, rozwijać skrzydła i błyszczeć własnymi sukcesami.',
                      imageUrl: ImagesConstants.house5,
                      isImageLeft: true,
                      screenWidth: width,
                    ),
                  ),

                  // --- FORM PRE-HEADER ---
                  _buildSection(
                    color: theme.colors.white,
                    sidePadding: sidePadding,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: Column(
                        children: [
                          SelectableText(
                            'DOŁĄCZ DO NAS',
                            style: theme.blackTextTheme.font3.copyWith(fontSize: 28, letterSpacing: 4),
                          ),
                          const SizedBox(height: 20),
                          SelectableText(
                            'WYPEŁNIJ PONIŻSZY FORMULARZ ORAZ WYŚLIJ NAM SWOJE CV,\nA MY SKONTAKTUJEMY SIĘ Z TOBĄ WKTÓTCE.',
                            textAlign: TextAlign.center,
                            style: theme.grayTextTheme.font7.copyWith(fontSize: 14, height: 1.6),
                          ),
                          const SizedBox(height: 60),
                          // Тут буде твій віджет форми
                          _buildMockForm(theme, width),
                        ],
                      ),
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

  Widget _buildCenteredHeader(PrestThemeData theme, String title) {
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

  Widget _buildMainIntro(PrestThemeData theme, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: SelectableText(
          'DOSKONAŁA obsługa rodzi skuteczne transakcje dzięki nieprzeciętnym LUDZIOM.',
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font3.copyWith(
            fontSize: width < 800 ? 24 : 32,
            fontWeight: FontWeight.w300,
            height: 1.4,
          ),
        ),
      ),
    );
  }

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

  // Заглушка для форми
  Widget _buildMockForm(PrestThemeData theme, double width) {
    return Container(
      width: width < 800 ? double.infinity : 600,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colors.gold.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          const Text("FORMULARZ REKRUTACYJNY (Work in progress)"),
          const SizedBox(height: 20),
          PrestPrimaryButton(label: 'WYŚLIJ', onPressed: () {}, width: double.infinity),
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
    final bool isMobile = screenWidth < 1000;

    final imageWidget = ScrollRevealBox(
      child: Container(
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );

    final textWidget = ScrollRevealBox(
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(
            title,
            style: theme.blackTextTheme.font3.copyWith(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 25),
          SelectableText(
            text,
            style: theme.blackTextTheme.font7.copyWith(fontSize: 17, height: 1.8, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 20),
          SelectableText(
            subText,
            style: theme.blackTextTheme.font7.copyWith(
              fontSize: 16,
              height: 1.8,
              color: theme.colors.gold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: isMobile
          ? Column(
        children: [
          imageWidget,
          const SizedBox(height: 50),
          textWidget,
        ],
      )
          : Row(
        children: [
          Expanded(flex: 5, child: isImageLeft ? imageWidget : textWidget),
          const SizedBox(width: 80),
          Expanded(flex: 5, child: isImageLeft ? textWidget : imageWidget),
        ],
      ),
    );
  }
}