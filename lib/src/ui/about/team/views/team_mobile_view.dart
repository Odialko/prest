import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import '../team_screen.dart';

class TeamScreenMobileView extends TeamScreen {
  const TeamScreenMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;

    // Дані безпосередньо з файлу замовника
    final teamMembers = [
      {
        'name': 'ANNA WSZELAKA', // [cite: 13]
        'role': 'Senior Real Estate Advisor', // [cite: 14]
        'license': 'Nr licencji 28360', // [cite: 15]
        'phone': '+ 48 690 175 317', // [cite: 16]
        'email': 'anna.wszelaka@prestestate.pl', // [cite: 17]
        'image': 'assets/images/team/anna_wszelaka.jpg',
      },
      // Тут додаси інших, коли будуть фото
    ];

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 140),
              // Заголовок секції [cite: 11]
              ScrollRevealBox(
                child: _buildHeader(theme, 'ZESPÓŁ'),
              ),
              const SizedBox(height: 100),

              // Сітка як на vilea.pl (2 в ряд для преміального вигляду)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 100,
                    childAspectRatio: 0.75, // Високі вертикальні фото
                  ),
                  itemCount: teamMembers.length,
                  itemBuilder: (context, index) {
                    final member = teamMembers[index];
                    return ScrollRevealBox(
                      delay: Duration(milliseconds: (index % 2) * 200),
                      child: _TeamMemberCard(
                        name: member['name']!,
                        role: member['role']!,
                        license: member['license']!,
                        phone: member['phone']!,
                        email: member['email']!,
                        imageUrl: member['image']!,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(PrestThemeData theme, String title) {
    return Column(
      children: [
        Text(
          title,
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

class _TeamMemberCard extends StatefulWidget {
  final String name;
  final String role;
  final String license;
  final String phone;
  final String email;
  final String imageUrl;

  const _TeamMemberCard({
    required this.name,
    required this.role,
    required this.license,
    required this.phone,
    required this.email,
    required this.imageUrl,
  });

  @override
  State<_TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<_TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Блок з фото та ZOOM ефектом
          Expanded(
            child: ClipRRect(
              child: AnimatedScale(
                scale: _isHovered ? 1.06 : 1.0,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutQuart,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Текстова інформація з файлу [cite: 13, 14, 15]
          Text(
            widget.name,
            style: theme.blackTextTheme.font3.copyWith(
              letterSpacing: 2,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.role,
            style: theme.blackTextTheme.font6.copyWith(
              color: theme.colors.gold,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.license,
            style: theme.grayTextTheme.font8,
          ),
          const SizedBox(height: 15),

          // Контакти [cite: 16, 17]
          Text(widget.phone, style: theme.blackTextTheme.font7),
          const SizedBox(height: 4),
          Text(
            widget.email,
            style: theme.blackTextTheme.font7.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}