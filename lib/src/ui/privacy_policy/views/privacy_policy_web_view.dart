import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/privacy_policy/privacy_policy_screen.dart';

class PrivacyPolicyWebView extends StatelessWidget
    implements PrivacyPolicyScreen {
  const PrivacyPolicyWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final double sidePadding = width < 1200 ? 24 : 40;

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // --- HEADER SECTION ---
              _buildSection(
                color: theme.colors.milk,
                sidePadding: sidePadding,
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    ScrollRevealBox(
                      child: Column(
                        children: [
                          SelectableText(
                            'POLITYKA PRYWATNOŚCI',
                            textAlign: TextAlign.center,
                            style: theme.blackTextTheme.font1.copyWith(
                              letterSpacing: 15,
                              fontSize: 45,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 1,
                            width: 80,
                            color: theme.colors.gold,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),

              // --- CONTENT SECTION ---
              _buildSection(
                color: theme.colors.white,
                sidePadding: sidePadding,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 900,
                  ), // Обмежуємо ширину тексту для зручності читання
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLegalBlock(theme, '1. Informacje ogólne', [
                        'Dbamy o Twoją prywatność oraz bezpieczeństwo danych osobowych. Niniejsza Polityka Prywatności określa zasady przetwarzania danych osobowych przez PREST spółka z ograniczoną odpowiedzialnością, w związku z prowadzeniem działalności w zakresie pośrednictwa w obrocie nieruchomościami, zgodnie z obowiązującymi przepisami prawa.',
                        'Polityka została sporządzona w szczególności na podstawie: RODO, ustawy o ochronie danych osobowych, ustawy o gospodarce nieruchomościami, ustawy o świadczeniu usług drogą elektroniczną та ustawy o przeciwdziałaniu praniu pieniędzy (AML).',
                      ]),

                      _buildLegalBlock(theme, '2. Administrator danych osobowych', [
                        'Administratorem danych osobowych jest: PREST spółka z ograniczoną odpowiedzialnością z siedzibą w Polsce (dalej: „Administrator”).',
                        'Administrator przetwarza dane osobowe z należytą starannością, stosując odpowiednie środki techniczne i organizacyjne zapewniające ich ochronę.',
                      ]),

                      _buildLegalBlock(theme, '3. Zakres przetwarzanych danych', [
                        'W zależności od relacji, Administrator może przetwarzać w szczególności: imię i nazwisko, adres e-mail, numer telefonu, adres zamieszkania, dane dotyczące nieruchomości (księga wieczysta, powierzchnia), dane transakcyjne та dane wymagane przepisami AML.',
                      ]),

                      _buildLegalBlock(
                        theme,
                        '4. Cele, podstawy prawne i okres przetwarzania',
                        [
                          '4.1. Pośrednictwo: art. 6 ust. 1 lit. b RODO (wykonanie umowy). Przetwarzane przez czas trwania umowy oraz okres przedawnienia roszczeń.',
                          '4.2. Komunikacja: art. 6 ust. 1 lit. f RODO (uzasadniony interes). Do czasu zakończenia komunikacji lub sprzeciwu.',
                          '4.3. Obowiązki prawne i AML: art. 6 ust. 1 lit. c RODO. Dokumenty księgowe – 6 lat, dane AML – 5 lat.',
                          '4.4. Marketing: art. 6 ust. 1 lit. f RODO + zgoda użytkownika. Do momentu cofnięcia zgody.',
                        ],
                      ),

                      _buildLegalBlock(theme, '5. Odbiorcy danych', [
                        'Dane mogą być przekazywane: notariuszom, kancelariom prawnym, biurom rachunkowym, dostawcom usług IT oraz organom publicznym на podstawie przepisów prawa.',
                      ]),

                      _buildLegalBlock(
                        theme,
                        '6. Prawa osób, których dane dotyczą',
                        [
                          'Każdej osobie przysługuje prawo do: dostępu do danych, sprostowania, usunięcia, ograniczenia przetwarzania, wniesienia sprzeciwu, przenoszenia danych та cofnięcia zgody.',
                          'Przysługuje również prawo wniesienia skargi do Prezesa Urzędu Ochrony Danych Osobowych.',
                        ],
                      ),

                      _buildLegalBlock(theme, '7. Pliki cookies', [
                        'Strona wykorzystuje pliki cookies w celach technicznych, statystycznych (Google Analytics) oraz marketingowych. Użytkownik może samodzielnie zarządzać cookies w ustawieniach przeglądarki.',
                      ]),

                      _buildLegalBlock(theme, '8. Postanowienia końcowe', [
                        'Administrator zastrzega sobie prawo do aktualizacji Polityki Prywatności w przypadku zmiany przepisów prawa lub sposobu działania strony internetowej.',
                      ]),
                    ],
                  ),
                ),
              ),

              // Bottom Spacer
              Container(height: 100, color: theme.colors.white),
            ],
          ),
        ),
      ],
    );
  }

  // --- HELPERS ---

  Widget _buildSection({
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

  Widget _buildLegalBlock(
    PrestThemeData theme,
    String title,
    List<String> paragraphs,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            title.toUpperCase(),
            style: theme.blackTextTheme.font3.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: theme.colors.chineseBlack,
            ),
          ),
          const SizedBox(height: 20),
          ...paragraphs.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SelectableText(
                p,
                style: theme.blackTextTheme.font7.copyWith(
                  fontSize: 16,
                  height: 1.8,
                  fontWeight: FontWeight.w300,
                  color: theme.colors.chineseBlack.withValues(alpha: 0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
