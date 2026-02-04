import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/about/join_us/join_us_screen.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';

class JoinUsMobileView extends JoinUsScreen {
  const JoinUsMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // --- HEADER ---
              Container(
                color: theme.colors.milk,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                child: Column(
                  children: [
                    ScrollRevealBox(child: _buildMobileHeader(theme, 'DOŁĄCZ DO NAS')),
                    const SizedBox(height: 15), // Ще менший відступ для мобілок
                    SelectableText(
                      'DOSKONAŁA obsługa rodzi skuteczne transakcje dzięki nieprzeciętnym LUDZIOM.',
                      textAlign: TextAlign.center,
                      style: theme.blackTextTheme.font3.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              // --- BLOCK 1 ---
              _buildMobileInfoBlock(
                theme: theme,
                color: theme.colors.white,
                title: 'Nasz zespół to nasz największy kapitał.',
                text: 'Jako zaufani doradcy najbardziej wymagających klientów, nasi agenci кожного дня potwierdzają profesjonalizm, zaangażowanie i skuteczność.',
                subText: 'Szukamy talentów. Pasjonatów sprzedaży. Ludzi, którzy chcą grać w pierwszej lidze.',
                imageUrl: ImagesConstants.aboutImage,
              ),

              // --- BLOCK 2 ---
              _buildMobileInfoBlock(
                theme: theme,
                color: theme.colors.milk,
                title: 'Pomagamy realnie osiągać cele.',
                text: 'Dołączając do prEST, stajesz się częścią dynamicznego środowiska. Szlifujemy warsztat і wspieramy w tworzeniu silnej marki osobistej.',
                subText: 'Pomagamy Agentom rosnąć, rozwijać skrzydła i błyszczeć własnymi sukcesami.',
                imageUrl: ImagesConstants.house5,
              ),

              // --- FORM SECTION ---
              Container(
                color: theme.colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                child: Column(
                  children: [
                    SelectableText(
                      'DOŁĄCZ DO NAS',
                      style: theme.blackTextTheme.font3.copyWith(fontSize: 22, letterSpacing: 3),
                    ),
                    const SizedBox(height: 15),
                    SelectableText(
                      'WYPEŁNIJ FORMULARZ ORAZ WYŚLIJ NAM SWOJE CV.',
                      textAlign: TextAlign.center,
                      style: theme.grayTextTheme.font7.copyWith(fontSize: 13, height: 1.5),
                    ),
                    const SizedBox(height: 40),
                    // Форма адаптована під ширину мобілки
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.colors.gold.withOpacity(0.2)),
                      ),
                      child: Column(
                        children: [
                          const Text("FORMULARZ (Mobile)"),
                          const SizedBox(height: 30),
                          PrestPrimaryButton(
                              label: 'WYŚLIJ',
                              onPressed: () {},
                              width: double.infinity
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHeader(PrestThemeData theme, String title) {
    return Column(
      children: [
        SelectableText(
          title,
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font1.copyWith(
            letterSpacing: 10, // Менший спрейдинг для вузьких екранів
            fontWeight: FontWeight.w100,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 20),
        Container(height: 1, width: 60, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildMobileInfoBlock({
    required PrestThemeData theme,
    required Color color,
    required String title,
    required String text,
    required String subText,
    required String imageUrl,
  }) {
    return Container(
      color: color,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          // Фото на мобільці завжди зверху і на всю ширину з невеликим падінгом
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ScrollRevealBox(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  title,
                  style: theme.blackTextTheme.font3.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                SelectableText(
                  text,
                  style: theme.blackTextTheme.font7.copyWith(fontSize: 15, height: 1.6),
                ),
                const SizedBox(height: 15),
                SelectableText(
                  subText,
                  style: theme.blackTextTheme.font7.copyWith(
                    fontSize: 14,
                    height: 1.6,
                    color: theme.colors.gold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}