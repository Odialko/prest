import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import '../about_prest_screen.dart';

class AboutPrestMobileView extends AboutPrestScreen {
  const AboutPrestMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;

    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(height: 100),
        _buildMobileHeader(theme, 'POZNAJ NAS'),
        const SizedBox(height: 40),
        _buildMobileBlock(theme, 'Zajmujemy się sprzedażą i wynajmem nieruchomości. Takich transakcji mamy na koncie najwięcej. Ponadto wyszukujemy dla Klientów perełki na specjalne zamówienie.', ImagesConstants.house5),
        _buildMobileBlock(theme, 'prEST to spotkanie kontrastujących osobowości i pozornie różnych światów, ale łączy nas zamiłowanie do sprzedaży i pracy z ludźmi, a także pasja do nieruchomości.', ImagesConstants.aboutImage, isDark: true),
        _buildMobileBlock(theme, 'Wiemy, że skuteczna sprzedaż wynika z dobrego planu, a przemyślany proces jest kluczowy w projektowaniu wartościowych rozwiązań.', ImagesConstants.house5),
        // const ContactFormSection(),
      ]),
    );
  }

  Widget _buildMobileHeader(PrestThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(title, style: theme.blackTextTheme.font2.copyWith(letterSpacing: 10), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Container(height: 1, width: 50, color: theme.colors.gold),
        ],
      ),
    );
  }

  Widget _buildMobileBlock(PrestThemeData theme, String text, String imageUrl, {bool isDark = false}) {
    return Container(
      color: isDark ? theme.colors.chineseBlack : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          Image.asset(imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover),
          const SizedBox(height: 30),
          Text(text, textAlign: TextAlign.center, style: (isDark ? theme.whiteTextTheme : theme.blackTextTheme).font4.copyWith(height: 1.6)),
        ],
      ),
    );
  }
}