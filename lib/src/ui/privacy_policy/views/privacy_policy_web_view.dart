import 'package:flutter/material.dart';
import 'package:prest/generated/l10n.dart'; // Імпорт локзалізації
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/privacy_policy/privacy_policy_screen.dart';

class PrivacyPolicyWebView extends StatelessWidget implements PrivacyPolicyScreen {
  const PrivacyPolicyWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final s = S.of(context); // Ініціалізація перекладів
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
                            s.privacyTitle,
                            textAlign: TextAlign.center,
                            style: theme.blackTextTheme.font1.copyWith(
                              letterSpacing: 15,
                              fontSize: 45,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(height: 1, width: 80, color: theme.colors.gold),
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
                  constraints: const BoxConstraints(maxWidth: 900),
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLegalBlock(theme, s.privacySec1Title, [s.privacySec1P1, s.privacySec1P2]),
                      _buildLegalBlock(theme, s.privacySec2Title, [s.privacySec2P1, s.privacySec2P2]),
                      _buildLegalBlock(theme, s.privacySec3Title, [s.privacySec3P1]),
                      _buildLegalBlock(theme, s.privacySec4Title, [
                        s.privacySec4P1,
                        s.privacySec4P2,
                        s.privacySec4P3,
                        s.privacySec4P4,
                      ]),
                      _buildLegalBlock(theme, s.privacySec5Title, [s.privacySec5P1]),
                      _buildLegalBlock(theme, s.privacySec6Title, [s.privacySec6P1, s.privacySec6P2]),
                      _buildLegalBlock(theme, s.privacySec7Title, [s.privacySec7P1]),
                      _buildLegalBlock(theme, s.privacySec8Title, [s.privacySec8P1]),
                    ],
                  ),
                ),
              ),
              Container(height: 100, color: theme.colors.white),
            ],
          ),
        ),
      ],
    );
  }

  // --- HELPERS (лишаються як були) ---
  Widget _buildSection({required Color color, required double sidePadding, required Widget child}) {
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

  Widget _buildLegalBlock(PrestThemeData theme, String title, List<String> paragraphs) {
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
          ...paragraphs.map((p) => Padding(
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
          )),
        ],
      ),
    );
  }
}