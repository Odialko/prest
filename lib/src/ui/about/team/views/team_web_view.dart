import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/about/team/models/team_member.dart';
import 'package:prest/src/ui/about/team/store/team_store.dart';
import 'package:prest/src/ui/about/team/team_screen.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_section_header.dart'; // Імпортуємо заголовок
import 'package:prest/src/services/url_launcher.dart';

class TeamScreenWebView extends TeamScreen {
  const TeamScreenWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final teamState = ref.watch(teamProvider);

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: theme.colors.white,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double width = constraints.maxWidth;
                // СИНХРОНІЗАЦІЯ: 1150px як у NavigationAppBar
                final bool isMobile = width < 1150;
                final double sidePadding = isMobile ? 24 : 40;

                return SelectionArea(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: LayoutsConstants.maxContentWidth,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: isMobile ? 80 : 140),

                          // НОВИЙ ЗАГОЛОВОК (Центрований для цієї сторінки)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: sidePadding),
                            child: Center(
                              child: ScrollRevealBox(
                                child: PrestSectionHeader(
                                  linePosition: HeaderLinePosition.bottom,
                                  title: Text(
                                    'ZESPÓŁ',
                                    style: theme.blackTextTheme.font2.copyWith(
                                      letterSpacing: 4,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 60),

                          teamState.when(
                            loading: () => const Padding(
                              padding: EdgeInsets.all(100.0),
                              child: Center(child: CircularProgressIndicator(strokeWidth: 1)),
                            ),
                            error: (message) => Center(child: SelectableText(message ?? 'Error')),
                            loaded: (members) => _TeamGrid(
                              members: members,
                              sidePadding: sidePadding,
                            ),
                          ),
                          const SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _TeamGrid extends StatelessWidget {
  final List<TeamMember> members;
  final double sidePadding;

  const _TeamGrid({
    required this.members,
    required this.sidePadding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        int crossAxisCount = 3;
        if (width < 850) {
          crossAxisCount = 1;
        } else if (width < 1200) {
          crossAxisCount = 2;
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 40,
              mainAxisSpacing: 80,
              childAspectRatio: 0.82, // Оптимально для фото + контакти
            ),
            itemCount: members.length,
            itemBuilder: (context, index) {
              return ScrollRevealBox(
                delay: Duration(milliseconds: (index % crossAxisCount) * 150),
                child: _TeamMemberCard(member: members[index]),
              );
            },
          ),
        );
      },
    );
  }
}

class _TeamMemberCard extends StatefulWidget {
  final TeamMember member;
  const _TeamMemberCard({required this.member});

  @override
  State<_TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<_TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final m = widget.member;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ЗОБРАЖЕННЯ З ЕФЕКТОМ МАСШТАБУВАННЯ
        Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            cursor: SystemMouseCursors.click,
            child: ClipRRect(
              child: AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutQuart,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(m.imagePath),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),

        SelectableText(
          m.name.toUpperCase(),
          style: theme.blackTextTheme.font3.copyWith(
            letterSpacing: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        SelectableText(
          m.role,
          style: theme.blackTextTheme.font6.copyWith(
            color: theme.colors.gold,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),

        _buildContactLink(m.phone, theme, isEmail: false),
        const SizedBox(height: 8),
        _buildContactLink(m.email, theme, isEmail: true),
      ],
    );
  }

  Widget _buildContactLink(String text, PrestThemeData theme, {required bool isEmail}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isEmail) {
            UrlLauncherService.sendEmail(text);
          } else {
            UrlLauncherService.makeCall(text);
          }
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: 0.8,
          child: Text(
            text,
            style: theme.blackTextTheme.font7.copyWith(
              fontSize: 13,
              letterSpacing: 0.5,
              color: isEmail ? theme.colors.gold : theme.colors.chineseBlack,
            ),
          ),
        ),
      ),
    );
  }
}