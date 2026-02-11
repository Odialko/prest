import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/contact_dialog.dart'; // Для діалогу
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/our_services/designe/design_screen.dart';

class DesignWebView extends ConsumerWidget implements DesignScreen {
  const DesignWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final double sidePadding = width < 1200 ? 24 : 40;
    final bool isMobile = width < 1100;

    final List<String> galleryImages = [
      ImagesConstants.design_1,
      ImagesConstants.design_2,
      ImagesConstants.design_3,
      ImagesConstants.design_4,
      ImagesConstants.design_5,
      ImagesConstants.design_6,
      ImagesConstants.design_7,
      ImagesConstants.design_8,
      ImagesConstants.design_9,
      ImagesConstants.design_10,
    ];

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // 1. HEADER
              _buildSection(
                color: theme.colors.white,
                sidePadding: sidePadding,
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    ScrollRevealBox(child: _buildHeader(theme, 'prEST DESIGN', isMobile)),
                    const SizedBox(height: 60),
                    _buildDesignIntro(theme),
                  ],
                ),
              ),

              // 2. COLLAGE SECTION
              _buildSection(
                color: theme.colors.white,
                sidePadding: sidePadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: _DesignImageCollage(images: galleryImages),
                ),
              ),

              // 3. CTA SECTION (ТАК САМО ЯК У ДЕВЕЛОПЕРІВ)
              _buildSection(
                color: theme.colors.milk,
                sidePadding: sidePadding,
                child: _buildCTA(context, theme, isMobile),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

  // СТАНДАРТНИЙ CTA ЯК У ДЕВЕЛОПЕРІВ
  Widget _buildCTA(BuildContext context, PrestThemeData theme, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Column(
        children: [
          ScrollRevealBox(
            child: Text(
              'PODOBAJĄ CI SIĘ NASZE WNĘTRZA?',
              textAlign: TextAlign.center,
              style: theme.blackTextTheme.font3.copyWith(
                  fontSize: isMobile ? 22 : 28,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'WYPEŁNIJ PONIŻSZY FORMULARZ, A MY SKONTAKTUJEMY SIĘ Z TOBĄ WKRÓTCE.',
            textAlign: TextAlign.center,
            style: theme.grayTextTheme.font7.copyWith(fontSize: 14, height: 1.6),
          ),
          const SizedBox(height: 60),
          SelectionContainer.disabled(
            child: PrestDarkBorderButton(
              label: 'SKONTAKTUJ SIĘ',
              onPressed: () => PrestDialog.showContact(context, title: 'ZAPYTANIE O DESIGN'),
              width: 280,
            ),
          ),
        ],
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

  Widget _buildDesignIntro(PrestThemeData theme) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Text(
        'Kupujesz. My zajmujemy się resztą. Projektujemy z pasją, dbając o każdy detal, aby stworzyć przestrzeń, która inspiruje.',
        textAlign: TextAlign.center,
        style: theme.blackTextTheme.font7.copyWith(fontSize: 18, height: 1.8, fontWeight: FontWeight.w200),
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
          child: Padding(padding: EdgeInsets.symmetric(horizontal: sidePadding), child: child),
        ),
      ),
    );
  }
}

class _DesignImageCollage extends StatefulWidget {
  final List<String> images;
  const _DesignImageCollage({required this.images});

  @override
  State<_DesignImageCollage> createState() => _DesignImageCollageState();
}

class _DesignImageCollageState extends State<_DesignImageCollage> {
  bool _isExpanded = false;

  void _openGallery(BuildContext context, int initialIndex) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Gallery',
      barrierColor: Colors.black.withOpacity(0.9),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return FadeTransition(
          opacity: anim1,
          child: _GalleryViewer(images: widget.images, initialIndex: initialIndex),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;

    return Column(
      children: [
        // БЛОК 1: ВЕЛИКА ЗЛІВА
        isMobile ? _buildMobileGrid(0, 5) : _buildWebRow(0, false),

        // АНІМОВАНЕ РОЗГОРТАННЯ
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 800),
          sizeCurve: Curves.easeInOutCubic,
          alignment: Alignment.topCenter,
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: const SizedBox(width: double.infinity),
          secondChild: Column(
            children: [
              const SizedBox(height: 15),
              // БЛОК 2: ВЕЛИКА СПРАВА (ДЗЕРКАЛЬНО)
              isMobile ? _buildMobileGrid(5, 10) : _buildWebRow(5, true),
            ],
          ),
        ),

        // КНОПКА, ЯКА ТЕПЕР НЕ ЗНИКАЄ
        const SizedBox(height: 60),
        SelectionContainer.disabled(
          child: PrestDarkBorderButton(
            // Міняємо напис залежно від стану
            label: _isExpanded ? 'ZWIŃ' : 'ZOBACZ WIĘCEJ',
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            width: 250,
          ),
        ),
      ],
    );
  }

  // Веб-версія (Рядок 16:7)
  Widget _buildWebRow(int startIdx, bool reverse) {
    final big = Expanded(
      flex: 6,
      child: _HoverImage(
          image: widget.images[startIdx],
          onTap: () => _openGallery(context, startIdx)
      ),
    );

    final smalls = Expanded(
      flex: 4,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _HoverImage(image: widget.images[startIdx + 1], onTap: () => _openGallery(context, startIdx + 1))),
                const SizedBox(width: 15),
                Expanded(child: _HoverImage(image: widget.images[startIdx + 2], onTap: () => _openGallery(context, startIdx + 2))),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _HoverImage(image: widget.images[startIdx + 3], onTap: () => _openGallery(context, startIdx + 3))),
                const SizedBox(width: 15),
                Expanded(child: _HoverImage(image: widget.images[startIdx + 4], onTap: () => _openGallery(context, startIdx + 4))),
              ],
            ),
          ),
        ],
      ),
    );

    return AspectRatio(
      aspectRatio: 16 / 7,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: reverse
            ? [smalls, const SizedBox(width: 15), big]
            : [big, const SizedBox(width: 15), smalls],
      ),
    );
  }

  // Мобільна версія (Сітка 2х2)
  Widget _buildMobileGrid(int start, int end) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: _HoverImage(image: widget.images[start], onTap: () => _openGallery(context, start))
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15
          ),
          itemBuilder: (c, i) => _HoverImage(
              image: widget.images[start + i + 1],
              onTap: () => _openGallery(context, start + i + 1)
          ),
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
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _scale = Tween<double>(begin: 1.0, end: 1.05).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

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
              ScaleTransition(scale: _scale, child: Image.asset(widget.image, fit: BoxFit.cover)),
              AnimatedBuilder(
                animation: _controller,
                builder: (c, w) => Container(color: Colors.black.withOpacity(_controller.value * 0.1)),
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
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: (widget.images.length * 1000) + widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [IconButton(icon: const Icon(Icons.close, color: Colors.white, size: 30), onPressed: () => Navigator.pop(context)), const SizedBox(width: 20)],
        ),
        body: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemBuilder: (c, i) => InteractiveViewer(child: Center(child: Image.asset(widget.images[i % widget.images.length], fit: BoxFit.contain))),
            ),
            if (MediaQuery.of(context).size.width > 800) ...[
              _nav(true), _nav(false),
            ]
          ],
        ),
      ),
    );
  }

  Widget _nav(bool left) => Positioned(
    left: left ? 20 : null, right: left ? null : 20, top: 0, bottom: 0,
    child: Center(child: IconButton(icon: Icon(left ? Icons.arrow_back_ios : Icons.arrow_forward_ios, color: Colors.white54, size: 40),
        onPressed: () => left ? _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease) : _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease))),
  );
}