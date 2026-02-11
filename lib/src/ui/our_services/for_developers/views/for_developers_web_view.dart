import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/contact_dialog.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/for_developers/for_developers_screen.dart';

class ForDevelopersWebView extends ConsumerWidget implements ForDevelopersScreen {
  const ForDevelopersWebView({super.key});

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
              final bool isMobile = width < 1100;

              return SelectionArea(
                child: Column(
                  children: [
                    // 1. HEADER (MILK)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.milk,
                      sidePadding: sidePadding,
                      child: Column(
                        children: [
                          SizedBox(height: isMobile ? 80 : 140),
                          ScrollRevealBox(child: _buildHeader(theme, 'DLA DEWELOPERÓW', isMobile)),
                          const SizedBox(height: 40),
                          ScrollRevealBox(
                            delay: const Duration(milliseconds: 200),
                            child: _buildIntro(theme, width),
                          ),
                          SizedBox(height: isMobile ? 60 : 100),
                        ],
                      ),
                    ),

                    // 2. BLOCK 1: IMAGE LEFT (WHITE)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.white,
                      sidePadding: sidePadding,
                      child: _DeveloperRow(
                        title: 'Sprzedaż jako system, nie improwizacja',
                        text: 'Wspieramy deweloperów kompleksowo: od konsultacji koncepcji inwestycji, przez stworzenie strategii marketingowej i sprzedażowej, po pełną realizację procesu.',
                        imageUrl: ImagesConstants.developer_1,
                        isImageLeft: true, // Картинка зліва
                        screenWidth: width,
                      ),
                    ),

                    // 3. BLOCK 2: OVERLAP (MILK BACKGROUND) - IMAGE RIGHT (НАЇЖДЖАЄ)
                    _buildOverlapSection(
                      theme: theme,
                      width: width,
                      sidePadding: sidePadding,
                      title: 'Bez kosztownych struktur. Bez chaosu.',
                      text: 'Nie ma potrzeby budować wewnętrznych zespołów. Przejmujemy odpowiedzialność za cały obszar sprzedaży — od zarządzania procesem po codzienną pracę z klientem.',
                      imageUrl: ImagesConstants.developer_2,
                      isImageLeft: false, // Тепер картинка справа, щоб наповзати на фон
                    ),

                    // 4. BLOCK 3: IMAGE LEFT (WHITE)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.white,
                      sidePadding: sidePadding,
                      child: _DeveloperRow(
                        title: 'Zespół, który rozumie decyzje klientów',
                        text: 'Klienci obsługiwani są w profesjonalnie przygotowanym biurze sprzedaży. Tworzymy zespół obejmujący marketingowca, prawnika oraz doświadczonych specjalistów.',
                        imageUrl: ImagesConstants.developer_3,
                        isImageLeft: true, // Картинка зліва
                        screenWidth: width,
                      ),
                    ),

                    // 5. FEATURES (MILK)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.milk,
                      sidePadding: sidePadding,
                      child: _buildFeaturesList(theme, width),
                    ),

                    // 6. CTA (WHITE)
                    _buildSection(
                      theme: theme,
                      color: theme.colors.white,
                      sidePadding: sidePadding,
                      child: _buildCTA(context, theme, isMobile),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- UI COMPONENTS ---

  Widget _buildOverlapSection({
    required PrestThemeData theme,
    required double width,
    required double sidePadding,
    required String title,
    required String text,
    required String imageUrl,
    required bool isImageLeft,
  }) {
    final bool isMobile = width < 1100;

    if (isMobile) {
      return _buildSection(
        theme: theme,
        color: theme.colors.milk,
        sidePadding: sidePadding,
        child: _DeveloperRow(
          title: title,
          text: text,
          imageUrl: imageUrl,
          isImageLeft: isImageLeft,
          screenWidth: width,
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 700,
      child: Stack(
        children: [
          // БЕЖЕВИЙ ФОН СПРАВА (якщо картинка справа)
          Align(
            alignment: isImageLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: width * 0.5,
              color: theme.colors.milk,
            ),
          ),

          // КОНТЕНТ
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Row(
                  children: [
                    if (!isImageLeft) ...[
                      // ТЕКСТ ЗЛІВА (на білому фоні)
                      Expanded(
                        flex: 5,
                        child: _buildBlockText(theme, title, text),
                      ),
                      const SizedBox(width: 80),
                      // КАРТИНКА СПРАВА (наповзає з бежевого на білий)
                      Expanded(
                        flex: 6,
                        child: ScrollRevealBox(
                          child: Transform.translate(
                            offset: const Offset(-60, 0), // Зміщення ВЛІВО, на білий фон
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 30,
                                    offset: const Offset(-10, 10),
                                  )
                                ],
                              ),
                              child: Image.asset(imageUrl, fit: BoxFit.cover, height: 500),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      // КАРТИНКА ЗЛІВА (наповзає на білий)
                      Expanded(
                        flex: 6,
                        child: ScrollRevealBox(
                          child: Transform.translate(
                            offset: const Offset(60, 0),
                            child: Image.asset(imageUrl, fit: BoxFit.cover, height: 500),
                          ),
                        ),
                      ),
                      const SizedBox(width: 80),
                      Expanded(
                        flex: 5,
                        child: _buildBlockText(theme, title, text),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlockText(PrestThemeData theme, String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: theme.blackTextTheme.font3.copyWith(fontSize: 32, fontWeight: FontWeight.w600)),
        const SizedBox(height: 30),
        Text(text, style: theme.blackTextTheme.font7.copyWith(fontSize: 18, height: 1.8, fontWeight: FontWeight.w200)),
      ],
    );
  }

  Widget _buildSection({required PrestThemeData theme, required Color color, required double sidePadding, required Widget child}) {
    return Container(
      width: double.infinity,
      color: color,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: sidePadding), child: child),
        ),
      ),
    );
  }

  Widget _buildHeader(PrestThemeData theme, String title, bool isMobile) {
    return Column(
      children: [
        Text(title, textAlign: TextAlign.center,
            style: theme.blackTextTheme.font1.copyWith(
              letterSpacing: isMobile ? 12 : 25,
              fontWeight: FontWeight.w100,
              fontSize: isMobile ? 32 : 55,
            )),
        const SizedBox(height: 30),
        Container(height: 1, width: 80, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildIntro(PrestThemeData theme, double width) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Text(
        'Rynek pierwotny nie sprzedaje się już „sam”. Dzisiejszy rynek wymaga precyzji, rytmu i konsekwencji. My projektujemy ten proces świadomie.',
        textAlign: TextAlign.center,
        style: theme.blackTextTheme.font7.copyWith(fontSize: 17, height: 1.6, fontWeight: FontWeight.w200),
      ),
    );
  }

  Widget _buildFeaturesList(PrestThemeData theme, double width) {
    final bool isMobile = width < 800;
    final List<String> features = [
      'Konsultacje projektu na etapie koncepcji.',
      'Wsparcie w przygotowaniu bezpiecznych umów.',
      'Kompleksowy marketing inwestycji.',
      'Dostęp do aktywnej bazy klientów.',
      'Pełne przejęcie procesu sprzedaży.',
      'Projektowanie apartamentów pokazowych.',
      'Elastyczny model współpracy.'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          Text('KOMPLEKSOWA OBSŁUGA', style: theme.blackTextTheme.font3.copyWith(fontSize: 24, letterSpacing: 3, fontWeight: FontWeight.w600)),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: features.map((f) => SizedBox(
              width: isMobile ? double.infinity : (LayoutsConstants.maxContentWidth / 2) - 100,
              child: Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Icon(Icons.fiber_manual_record, color: theme.colors.gold),
                  const SizedBox(width: 15),
                  Expanded(child: Text(f, style: theme.blackTextTheme.font5)),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCTA(BuildContext context, PrestThemeData theme, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Column(
        children: [
          Text('CHCESZ POROZMAWIAĆ O WSPÓŁPRACY?',
              textAlign: TextAlign.center,
              style: theme.blackTextTheme.font3.copyWith(fontSize: isMobile ? 22 : 28, letterSpacing: 4, fontWeight: FontWeight.w600)),
          const SizedBox(height: 60),
          PrestDarkBorderButton(
            label: 'SKONTAKTUJ SIĘ',
            onPressed: () => PrestDialog.showContact(context, title: 'WSPÓŁPRACA DEWELOPERSKA'),
            width: 280,
          ),
        ],
      ),
    );
  }
}

class _DeveloperRow extends StatelessWidget {
  final String title;
  final String text;
  final String imageUrl;
  final bool isImageLeft;
  final double screenWidth;

  const _DeveloperRow({
    required this.title,
    required this.text,
    required this.imageUrl,
    required this.isImageLeft,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final bool isMobile = screenWidth < 1100;

    final imageWidget = Image.asset(imageUrl, fit: BoxFit.cover, height: isMobile ? 350 : 500);
    final textWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: theme.blackTextTheme.font3.copyWith(fontSize: 28, fontWeight: FontWeight.w600)),
        const SizedBox(height: 25),
        Text(text, style: theme.blackTextTheme.font7.copyWith(fontSize: 17, height: 1.8, fontWeight: FontWeight.w200)),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: isMobile
          ? Column(children: [imageWidget, const SizedBox(height: 40), textWidget])
          : Row(children: [
        Expanded(flex: 5, child: isImageLeft ? imageWidget : textWidget),
        const SizedBox(width: 80),
        Expanded(flex: 5, child: isImageLeft ? textWidget : imageWidget),
      ]),
    );
  }
}