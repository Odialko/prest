import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/designe/design_screen.dart';

class DesignWebView extends DesignScreen {
  const DesignWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final double sidePadding = width < 1200 ? 24 : 40;

    final List<String> galleryImages = [
      ImagesConstants.house5,
      ImagesConstants.aboutImage,
      ImagesConstants.house5,
      ImagesConstants.aboutImage,
      ImagesConstants.house5,
    ];

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              _buildSection(
                color: theme.colors.white,
                sidePadding: sidePadding,
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    ScrollRevealBox(child: _buildDesignHeader(theme)),
                    const SizedBox(height: 60),
                    _buildDesignIntro(theme),
                  ],
                ),
              ),

              // --- АДАПТИВНИЙ КОЛАЖ ---
              _buildSection(
                color: theme.colors.white,
                sidePadding: sidePadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: _DesignImageCollage(images: galleryImages),
                ),
              ),

              _buildSection(
                color: theme.colors.milk,
                sidePadding: sidePadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    children: [
                      ScrollRevealBox(
                        child: SelectableText(
                          'PODOBAJĄ CI SIĘ NASZE WNĘTRZA?',
                          style: theme.blackTextTheme.font3.copyWith(
                            fontSize: 28,
                            letterSpacing: 4,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SelectableText(
                        'WYPEŁNIJ PONIŻSZY FORMULARZ, A MY SKONTAKTUJEMY SIĘ Z TOBĄ WKRÓTCE.',
                        textAlign: TextAlign.center,
                        style: theme.grayTextTheme.font7.copyWith(fontSize: 14, height: 1.6),
                      ),
                      const SizedBox(height: 60),
                      _buildDesignForm(theme),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesignHeader(PrestThemeData theme) {
    return Column(
      children: [
        SelectableText(
          'prEST DESIGN',
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font1.copyWith(
            letterSpacing: 25,
            fontSize: 55,
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(height: 30),
        Container(height: 1, width: 80, color: theme.colors.gold),
      ],
    );
  }

  Widget _buildDesignIntro(PrestThemeData theme) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        children: [
          SelectableText(
            'Kupujesz. My zajmujemy się resztą.',
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font3.copyWith(fontSize: 32, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 30),
          SelectableText(
            'Nie kupujesz nieruchomości, ale podobają Ci się wnętrza wykonane przy współpracy z nami? Projektujemy з pasją, dbając o każdy detal, aby stworzyć przestrzeń, która inspiruje.',
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font7.copyWith(fontSize: 18, height: 1.8),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required Color color, required double sidePadding, required Widget child}) {
    return Container(
      width: double.infinity,
      color: color,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _buildDesignForm(PrestThemeData theme) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colors.gold.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          const Text("FORMULARZ DESIGN (Wkrótce)"),
          const SizedBox(height: 30),
          PrestDarkBorderButton(
            label: 'WYŚLIJ ZAPYTANIE',
            onPressed: () {},
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class _DesignImageCollage extends StatelessWidget {
  final List<String> images;
  const _DesignImageCollage({required this.images});

  void _openGallery(BuildContext context, int initialIndex) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Gallery',
      barrierColor: Colors.black.withValues(alpha: 0.3),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return FadeTransition(
          opacity: anim1,
          child: _GalleryViewer(images: images, initialIndex: initialIndex),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;

    return ScrollRevealBox(
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildWebLayout(context),
    );
  }

  // Десктоп версія: пропорції зберігаються через AspectRatio
  Widget _buildWebLayout(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 7, // Колаж завжди тримає форму кіноекрану
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: _HoverImage(image: images[0], onTap: () => _openGallery(context, 0)),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _HoverImage(image: images[1], onTap: () => _openGallery(context, 1))),
                      const SizedBox(width: 15),
                      Expanded(child: _HoverImage(image: images[2], onTap: () => _openGallery(context, 2))),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _HoverImage(image: images[3], onTap: () => _openGallery(context, 3))),
                      const SizedBox(width: 15),
                      Expanded(child: _HoverImage(image: images[4], onTap: () => _openGallery(context, 4))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Мобільна версія: картинки стають в стовпчик або сітку 2x2
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1, // Головна картинка — квадрат
          child: _HoverImage(image: images[0], onTap: () => _openGallery(context, 0)),
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: images.length - 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return _HoverImage(
              image: images[index + 1],
              onTap: () => _openGallery(context, index + 1),
            );
          },
        ),
      ],
    );
  }
}

class _HoverImage extends StatefulWidget {
  final String image;
  final VoidCallback onTap;
  const _HoverImage({required this.image, required this.onTap});

  @override
  State<_HoverImage> createState() => _HoverImageState();
}

class _HoverImageState extends State<_HoverImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ClipRRect(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    color: Colors.black.withValues(alpha: _controller.value * 0.1),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GalleryViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  const _GalleryViewer({required this.images, required this.initialIndex});

  @override
  State<_GalleryViewer> createState() => _GalleryViewerState();
}

class _GalleryViewerState extends State<_GalleryViewer> {
  late PageController _controller;
  static const int _loopFactor = 10000;

  @override
  void initState() {
    super.initState();
    final int middleIndex = (widget.images.length * _loopFactor) ~/ 2;
    _controller = PageController(initialPage: middleIndex + widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: Scaffold(
        backgroundColor: Colors.black.withValues(alpha: 0.4),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 35),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemBuilder: (context, index) {
                final int realIndex = index % widget.images.length;
                return InteractiveViewer(
                  maxScale: 4.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(widget.images[realIndex], fit: BoxFit.contain),
                    ),
                  ),
                );
              },
            ),
            if (MediaQuery.of(context).size.width > 800) ...[
              _buildNavButton(
                left: 30,
                icon: Icons.arrow_back_ios_new,
                onPressed: () => _controller.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                ),
              ),
              _buildNavButton(
                right: 30,
                icon: Icons.arrow_forward_ios,
                onPressed: () => _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton({double? left, double? right, required IconData icon, required VoidCallback onPressed}) {
    return Positioned(
      left: left,
      right: right,
      top: 0,
      bottom: 0,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
          ),
        ),
      ),
    );
  }
}