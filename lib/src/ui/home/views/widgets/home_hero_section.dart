import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';

class HomeHeroSection extends StatelessWidget {
  final double height;
  final PrestThemeData theme;

  const HomeHeroSection({
    super.key,
    required this.height,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            children: [
              // 1. CAROUSEL (Нижній шар, тепер жести пройдуть до нього)
              Positioned.fill(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 8),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                    enableInfiniteScroll: true,
                    // Дозволяємо ручне керування
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                  items: ImagesConstants.heroImages
                      .map((path) => _ZoomingImage(path: path))
                      .toList(),
                ),
              ),

              // 2. GRADIENT OVERLAY
              // IgnorePointer дозволяє пропускати натискання крізь градієнт до каруселі
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.2),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 3. ТЕКСТ ПОВНІСТЮ ВИДАЛЕНО (Блок Center видалено)

              // 4. BUTTON (Кнопка залишається, вона має бути клікабельною)
              Positioned(
                right: isMobile ? null : 80,
                left: isMobile ? 0 : null,
                bottom: isMobile ? 60 : 80,
                child: Container(
                  width: isMobile ? constraints.maxWidth : null,
                  alignment: isMobile ? Alignment.center : Alignment.centerRight,
                  child: _AnimatedHeroButton(theme: theme),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ------------------------------------------------------------
// ZOOMING IMAGE (KEN BURNS EFFECT)
// ------------------------------------------------------------
class _ZoomingImage extends StatefulWidget {
  final String path;
  const _ZoomingImage({required this.path});

  @override
  State<_ZoomingImage> createState() => _ZoomingImageState();
}

class _ZoomingImageState extends State<_ZoomingImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Transform.scale(
          scale: 1.0 + (_controller.value * 0.08),
          child: Image.asset(
            widget.path,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.2),
          ),
        );
      },
    );
  }
}

// ------------------------------------------------------------
// ANIMATED FILL BUTTON
// ------------------------------------------------------------
class _AnimatedHeroButton extends StatefulWidget {
  final PrestThemeData theme;
  const _AnimatedHeroButton({required this.theme});

  @override
  State<_AnimatedHeroButton> createState() => _AnimatedHeroButtonState();
}

class _AnimatedHeroButtonState extends State<_AnimatedHeroButton> {
  bool _isHovered = false;
  final double _btnWidth = 220.0;
  final double _btnHeight = 55.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Дія при натисканні
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: _btnWidth,
          height: _btnHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHovered ? widget.theme.colors.chineseBlack : Colors.white,
              width: 0.8,
            ),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                width: _isHovered ? _btnWidth : 0,
                height: _btnHeight,
                color: widget.theme.colors.chineseBlack,
              ),
              Center(
                child: Text(
                  'ZOBACZ OFERTY',
                  style: widget.theme.whiteTextTheme.font7.copyWith(
                    letterSpacing: 2.5,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
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