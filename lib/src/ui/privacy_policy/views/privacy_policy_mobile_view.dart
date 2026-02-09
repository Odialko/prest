import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/privacy_policy/privacy_policy_screen.dart';

class PrivacyPolicyMobileView extends StatelessWidget
    implements PrivacyPolicyScreen {
  const PrivacyPolicyMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    const double sidePadding = 24.0;

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // --- HEADER ---
              Container(
                width: double.infinity,
                color: theme.colors.milk,
                padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    ScrollRevealBox(
                      child: Column(
                        children: [
                          SelectableText(
                            'POLITYKA\nPRYWATNOŚCI',
                            textAlign: TextAlign.center,
                            style: theme.blackTextTheme.font1.copyWith(
                              letterSpacing: 8,
                              fontSize: 28,
                              fontWeight: FontWeight.w100,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 1,
                            width: 60,
                            color: theme.colors.gold,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),

              // --- CONTENT ---
              Container(
                width: double.infinity,
                color: theme.colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: sidePadding,
                  vertical: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMobileLegalBlock(theme, '1. Informacje ogólne', [
                      'Dbamy o Twoją prywatność oraz bezpieczeństwo danych osobowych. Niniejsza Polityka Prywatności określa zasady przetwarzania danych osobowych przez PREST spółka z ograniczoną odpowiedzialnością.',
                      'Polityka została sporządzona w szczególności na podstawie: RODO, ustawy o ochronie danych osobowych та AML.',
                    ]),

                    _buildMobileLegalBlock(theme, '2. Administrator danych', [
                      'Administratorem danych osobowych jest: PREST spółka z ograniczoną odpowiedzialnością z siedzibą w Polsce.',
                    ]),

                    _buildMobileLegalBlock(theme, '3. Zakres danych', [
                      'Możemy przetwarzać: imię, nazwisko, e-mail, numer telefonu, adres zamieszkania, dane nieruchomości та dane finansowe do realizacji umowy.',
                    ]),

                    _buildMobileLegalBlock(theme, '4. Cele i podstawy', [
                      '4.1. Pośrednictwo: art. 6 ust. 1 lit. b RODO.',
                      '4.2. Komunikacja: art. 6 opt. 1 lit. f RODO.',
                      '4.3. AML: art. 6 ust. 1 lit. c RODO (obowiązek prawny).',
                    ]),

                    _buildMobileLegalBlock(theme, '5. Odbiorcy danych', [
                      'Dane mogą być przekazywane: notariuszom, biurom rachunkowym, dostawcom IT та organom publicznym.',
                    ]),

                    _buildMobileLegalBlock(theme, '6. Twoje prawa', [
                      'Masz prawo do: dostępu, sprostowania, usunięcia, ograniczenia przetwarzania, sprzeciwu та przenoszenia danych.',
                    ]),

                    _buildMobileLegalBlock(theme, '7. Cookies', [
                      'Strona wykorzystuje pliki cookies w celach technicznych i analitycznych. Możesz nimi zarządzać в ustawieniach przeglądarki.',
                    ]),

                    const SizedBox(height: 40),
                    Center(
                      child: Text(
                        'Ostatnia aktualizacja: 2026',
                        style: theme.blackTextTheme.font7.copyWith(
                          fontSize: 12,
                          color: theme.colors.chineseBlack.withValues(
                            alpha: 0.5,
                          ),
                        ),
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

  Widget _buildMobileLegalBlock(
    PrestThemeData theme,
    String title,
    List<String> paragraphs,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            title.toUpperCase(),
            style: theme.blackTextTheme.font3.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: theme.colors.chineseBlack,
            ),
          ),
          const SizedBox(height: 12),
          ...paragraphs.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SelectableText(
                p,
                style: theme.blackTextTheme.font7.copyWith(
                  fontSize: 15,
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                  color: theme.colors.chineseBlack.withValues(alpha: 0.9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
