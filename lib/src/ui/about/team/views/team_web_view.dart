import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/about/team/models/team_member.dart';
import 'package:prest/src/ui/about/team/store/team_store.dart';
import 'package:prest/src/ui/about/team/team_screen.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/services/url_launcher.dart'; // Імпортуємо сервіс

class TeamScreenWebView extends TeamScreen {
  const TeamScreenWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final teamState = ref.watch(teamProvider);

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: LayoutsConstants.maxContentWidth,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  ScrollRevealBox(
                    child: _buildHeader(theme, 'ZESPÓŁ'),
                  ),
                  const SizedBox(height: 25),
                  teamState.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(100.0),
                      child: Center(child: CircularProgressIndicator(strokeWidth: 1)),
                    ),
                    error: (message) => Center(child: SelectableText(message ?? 'Error')),
                    loaded: (members) => _TeamGrid(members: members),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(PrestThemeData theme, String title) {
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
}

class _TeamGrid extends StatelessWidget {
  final List<TeamMember> members;
  const _TeamGrid({required this.members});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        int crossAxisCount = 3;
        double sidePadding = 40;

        if (width < 850) {
          crossAxisCount = 1;
          sidePadding = 24;
        } else if (width < 1200) {
          crossAxisCount = 2;
          sidePadding = 40;
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 40,
              mainAxisSpacing: 60,
              // Змінюємо AspectRatio з 0.62 на 0.8 чи більше, щоб фото стали меншими по висоті
              childAspectRatio: 0.85,
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
        // ЗОБРАЖЕННЯ (Тепер займає менше місця через AspectRatio сітки)
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
        const SizedBox(height: 20),

        SelectableText(
          m.name,
          style: theme.blackTextTheme.font3.copyWith(
            letterSpacing: 1.5,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        SelectableText(
          m.role,
          style: theme.blackTextTheme.font6.copyWith(
            color: theme.colors.gold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),

        // КЛІКАБЕЛЬНІ КОНТАКТИ
        _buildClickableLink(m.phone, theme, isEmail: false),
        const SizedBox(height: 6),
        _buildClickableLink(m.email, theme, isEmail: true),
      ],
    );
  }

  Widget _buildClickableLink(String text, PrestThemeData theme, {required bool isEmail}) {
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
        child: Text(
          text,
          style: theme.blackTextTheme.font7.copyWith(
            fontSize: 13,
            letterSpacing: 0.5,
            // Для імейла можна залишити золото, для телефону — чорний
            color: isEmail ? theme.colors.gold : theme.colors.chineseBlack.withValues(alpha: 0.7),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}