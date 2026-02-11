import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/contact_dialog.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/for_developers/for_developers_screen.dart';

class ForDevelopersMobileView extends ConsumerWidget implements ForDevelopersScreen {
  const ForDevelopersMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    const double sidePadding = 24;

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: SelectionArea(
            child: Column(
              children: [
                // 1. HEADER
                Container(
                  color: theme.colors.milk,
                  padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      _buildHeader(theme),
                      const SizedBox(height: 40),
                      _buildIntro(theme),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),

                // 2. BLOCK 1
                _buildMobileContentBlock(
                  theme: theme,
                  title: 'Sprzedaż jako system',
                  text: 'Czasy, w których wystarczyło ogłoszenie, należą do przeszłości. My projektujemy proces świadomie.',
                  imageUrl: ImagesConstants.developer_1,
                ),

                // 3. BLOCK 2 (MILK)
                Container(
                  color: theme.colors.milk,
                  child: _buildMobileContentBlock(
                    theme: theme,
                    title: 'Bez kosztownych struktur',
                    text: 'Deweloper zyskuje czas i kontrolę. Przejmujemy odpowiedzialność za cały obszar sprzedaży.',
                    imageUrl: ImagesConstants.developer_2,
                  ),
                ),

                // 4. BLOCK 3
                _buildMobileContentBlock(
                  theme: theme,
                  title: 'Zespół ekspertów',
                  text: 'Połączenie marketingu, prawa i sprzedaży, które skraca proces decyzyjний klientów.',
                  imageUrl: ImagesConstants.developer_3,
                ),

                // 5. FEATURES
                _buildFeaturesList(theme),

                // 6. CTA (MILK)
                Container(
                  color: theme.colors.milk,
                  child: _buildCTA(context, theme),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(PrestThemeData theme) {
    return Column(
      children: [
        Text('DLA DEWELOPERÓW', textAlign: TextAlign.center,
            style: theme.blackTextTheme.font1.copyWith(letterSpacing: 10, fontSize: 32, fontWeight: FontWeight.w100)),
        const SizedBox(height: 20),
        Container(height: 1, width: 60, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildIntro(PrestThemeData theme) {
    return Column(
      children: [
        Text('Rynek pierwotny nie sprzedaje się już „sam”', textAlign: TextAlign.center,
            style: theme.blackTextTheme.font3.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Text(
          'Dzisiejszy rynek wymaga precyzji, rytmu i konsekwencji. Sprzedaż jest dziś procesem, a не jednorazowym zdarzeniem.',
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font7.copyWith(fontSize: 16, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildMobileContentBlock({required PrestThemeData theme, required String title, required String text, required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity),
          const SizedBox(height: 30),
          Text(title, style: theme.blackTextTheme.font3.copyWith(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 15),
          Text(text, textAlign: TextAlign.center, style: theme.blackTextTheme.font7.copyWith(fontSize: 16, height: 1.6)),
        ],
      ),
    );
  }

  Widget _buildFeaturesList(PrestThemeData theme) {
    final List<String> features = [
      'Konsultacje projektu на етапі koncepcji.',
      'Wsparcie w przygotowaniu umów.',
      'Kompleksowy marketing inwestycji.',
      'Dostęp do bazy klientów.',
      'Pełne przejęcie procesu sprzedaży.',
      'Projektowanie domów pokazowych.'
    ];

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text('KOMPLEKSOWA OBSŁUGA', style: theme.blackTextTheme.font3.copyWith(fontSize: 20, letterSpacing: 2)),
          const SizedBox(height: 40),
          ...features.map((f) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•', style: TextStyle(color: theme.colors.gold, fontSize: 18)),
                const SizedBox(width: 15),
                Expanded(child: Text(f, style: theme.blackTextTheme.font7.copyWith(fontSize: 15))),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildCTA(BuildContext context, PrestThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          Text('CHCESZ POROZMAWIAĆ?', textAlign: TextAlign.center, style: theme.blackTextTheme.font3.copyWith(fontSize: 22)),
          const SizedBox(height: 40),
          PrestDarkBorderButton(
            label: 'SKONTAKTUJ SIĘ',
            onPressed: () => PrestDialog.showContact(context, title: 'WSPÓŁPRACA'),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}