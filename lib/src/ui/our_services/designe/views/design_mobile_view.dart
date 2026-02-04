import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/our_services/designe/design_screen.dart';

class DesignMobileView extends DesignScreen {
  const DesignMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            children: [
              _buildMobileHeader(theme),
              const SizedBox(height: 40),
              SelectableText(
                'Kupujesz. My zajmujemy się resztą.',
                textAlign: TextAlign.center,
                style: theme.blackTextTheme.font3.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 40),
              // Мобільна сітка - картинки одна під одною
              _HoverImage(image: ImagesConstants.house5, height: 300),
              const SizedBox(height: 15),
              _HoverImage(image: ImagesConstants.aboutImage, height: 300),
              const SizedBox(height: 60),
              SelectableText(
                'PODOBAJĄ CI SIĘ NASZE WNĘTRZA?',
                textAlign: TextAlign.center,
                style: theme.blackTextTheme.font3.copyWith(fontSize: 20, letterSpacing: 2),
              ),
              const SizedBox(height: 40),
              _buildMobileForm(theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHeader(PrestThemeData theme) {
    return Column(
      children: [
        SelectableText(
          'prEST DESIGN',
          style: theme.blackTextTheme.font1.copyWith(letterSpacing: 8, fontSize: 28),
        ),
        const SizedBox(height: 15),
        Container(height: 1, width: 40, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildMobileForm(PrestThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(border: Border.all(color: theme.colors.gold.withOpacity(0.3))),
      child: Column(
        children: [
          const Text("FORMULARZ DESIGN"),
          const SizedBox(height: 20),
          PrestDarkBorderButton(label: 'WYŚLIJ', onPressed: () {}, width: double.infinity),
        ],
      ),
    );
  }
}


class _HoverImage extends StatefulWidget {
  final String image;
  final double height;
  const _HoverImage({required this.image, required this.height});

  @override
  State<_HoverImage> createState() => _HoverImageState();
}

class _HoverImageState extends State<_HoverImage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: ScrollRevealBox(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          height: widget.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
              scale: isHovered ? 1.05 : 1.0, // Ефект легкого зуму
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: isHovered ? Colors.black.withOpacity(0.1) : Colors.transparent,
          ),
        ),
      ),
    );
  }
}