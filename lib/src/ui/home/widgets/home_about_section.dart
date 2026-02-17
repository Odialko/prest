import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/generated/l10n.dart'; // Додано імпорт локалізації

class HomeAboutSection extends StatefulWidget {
  final bool isMobile;
  const HomeAboutSection({super.key, required this.isMobile});

  @override
  State<HomeAboutSection> createState() => _HomeAboutSectionState();
}

class _HomeAboutSectionState extends State<HomeAboutSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;
  late Animation<double> _opacityAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _leftAnimation = Tween<Offset>(begin: const Offset(-0.02, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart),
    );

    _rightAnimation = Tween<Offset>(begin: const Offset(0.02, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 0.5, curve: Curves.easeIn)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;

    return VisibilityDetector(
      key: const Key('home-about-section-key'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2 && !_hasAnimated) {
          _controller.forward();
          _hasAnimated = true;
        }
      },
      child: Container(
        color: theme.colors.milk,
        padding: const EdgeInsets.symmetric(vertical: 120),
        width: double.infinity,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.isMobile ? 24 : 40),
              child: _buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = context.prestTheme;
    final s = S.of(context); // Ініціалізація локалізації

    final textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.aboutSectionLabel.toUpperCase(), // "O NAS"
          style: theme.goldTextTheme.font7.copyWith(letterSpacing: 4, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Text(
          s.aboutSectionTitle, // "Luksus zdefiniowany na nowo"
          style: theme.blackTextTheme.font1.copyWith(height: 1.2),
        ),
        const SizedBox(height: 30),
        Text(
          s.aboutSectionDesc, // Довгий опис про бутікову агенцію
          style: theme.blackTextTheme.font6.copyWith(color: Colors.black54, height: 1.8),
        ),
      ],
    );

    if (widget.isMobile) {
      return Column(
        children: [
          _wrap(textContent, _leftAnimation),
          const SizedBox(height: 60),
          _wrap(_buildImage(), _rightAnimation),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _wrap(textContent, _leftAnimation),
        ),
        const SizedBox(width: 100),
        Expanded(
          flex: 4,
          child: _wrap(_buildImage(), _rightAnimation),
        ),
      ],
    );
  }

  Widget _wrap(Widget child, Animation<Offset> anim) => FadeTransition(
    opacity: _opacityAnimation,
    child: SlideTransition(position: anim, child: child),
  );

  Widget _buildImage() => AspectRatio(
    aspectRatio: 4 / 5,
    child: Image.asset(ImagesConstants.aboutImage, fit: BoxFit.cover),
  );
}