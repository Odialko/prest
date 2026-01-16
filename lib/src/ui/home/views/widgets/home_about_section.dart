import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart'; // Додаємо цей імпорт
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';

class HomeAboutSection extends StatefulWidget {
  final bool isMobile;
  final PrestThemeData theme;

  const HomeAboutSection({
    super.key,
    required this.isMobile,
    required this.theme,
  });

  @override
  State<HomeAboutSection> createState() => _HomeAboutSectionState();
}

class _HomeAboutSectionState extends State<HomeAboutSection>
    with SingleTickerProviderStateMixin {
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
      duration: const Duration(
        milliseconds: 1200,
      ),
    );

    _leftAnimation = Tween<Offset>(
      begin: const Offset(-0.15, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));

    _rightAnimation = Tween<Offset>(
      begin: const Offset(0.15, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('home-about-section-key'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2 && !_hasAnimated) {
          _controller.forward();
          _hasAnimated = true;
        }
      },
      child: Container(
        color: widget.theme.colors.milk,
        padding: const EdgeInsets.symmetric(vertical: 120),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'O NAS',
          style: widget.theme.goldTextTheme.font7.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Luksus zdefiniowany na nowo',
          style: widget.theme.blackTextTheme.font1.copyWith(height: 1.2),
        ),
        const SizedBox(height: 30),
        Text(
          'PrEST to butikowa agencja nieruchomości premium, gdzie pasja do architektury łączy się z najwyższym standardem obsługi klienta.',
          style: widget.theme.blackTextTheme.font6.copyWith(
            color: Colors.black54,
            height: 1.8,
          ),
        ),
      ],
    );

    final imageContent = AspectRatio(
      aspectRatio: 4 / 5,
      child: Image.asset(ImagesConstants.aboutImage, fit: BoxFit.cover),
    );

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: LayoutsConstants.maxContentWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: widget.isMobile
              ? Column(
                  children: [
                    FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _leftAnimation,
                        child: textContent,
                      ),
                    ),
                    const SizedBox(height: 60),
                    FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _rightAnimation,
                        child: imageContent,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: FadeTransition(
                        opacity: _opacityAnimation,
                        child: SlideTransition(
                          position: _leftAnimation,
                          child: textContent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    Expanded(
                      flex: 1,
                      child: FadeTransition(
                        opacity: _opacityAnimation,
                        child: SlideTransition(
                          position: _rightAnimation,
                          child: imageContent,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
