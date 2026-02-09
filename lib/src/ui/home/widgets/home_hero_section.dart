import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/home/store/home_store.dart';
import 'package:prest/src/ui/home/widgets/hero_arrow.dart'; // Твій новий файл
import 'package:prest/src/ui/home/widgets/zooming_image.dart';

class HomeHeroSection extends ConsumerStatefulWidget {
  final double height;

  const HomeHeroSection({super.key, required this.height});

  @override
  ConsumerState<HomeHeroSection> createState() => _HomeHeroSectionState();
}

class _HomeHeroSectionState extends ConsumerState<HomeHeroSection> {
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final slides = ref.watch(heroSlidesProvider);
    final currentPage = ref.watch(homeProvider.select((s) => s.currentPage));

    if (slides.isEmpty) return SizedBox(height: widget.height);

    final currentSlide = slides[currentPage];

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return SizedBox(
          height: widget.height,
          width: double.infinity,
          child: Stack(
            children: [
              // 1. CAROUSEL (Фон)
              Positioned.fill(
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: widget.height,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 8),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                    enableInfiniteScroll: true,
                    // Забороняємо свайп мишею, щоб не ламати вертикальний скрол сторінки
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index, _) {
                      ref.read(homeProvider.notifier).setCurrentPage(index);
                    },
                  ),
                  items: slides.map((slide) {
                    return ZoomingImage(
                      path: slide.imagePath,
                      isNetwork: slide.isNetwork,
                    );
                  }).toList(),
                ),
              ),

              // 2. GRADIENT OVERLAY (Для читабельності контенту)
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.4, 1.0],
                        colors: [
                          Colors.black.withValues(alpha: 0.25),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 3. ПРОГРАМНО НАМАЛЬОВАНІ СТРІЛКИ (Тільки десктоп)
              if (!isMobile) ...[
                _buildArrow(isLeft: true),
                _buildArrow(isLeft: false),
              ],

              // 4. ACTION BUTTON
              Positioned(
                right: isMobile ? null : 80,
                left: isMobile ? 20 : null,
                bottom: isMobile ? 60 : 80,
                child: Container(
                  width: isMobile ? constraints.maxWidth - 40 : null,
                  alignment: isMobile ? Alignment.center : Alignment.centerRight,
                  child: PrestTransparentButton(
                    label: currentSlide.title,
                    onPressed: () => context.go(currentSlide.route),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Метод виклику твого нового віджета HeroArrow
  Widget _buildArrow({required bool isLeft}) {
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: HeroArrow( // <--- Це має бути назва класу з файлу hero_arrow.dart
          isLeft: isLeft,
          onTap: () {
            if (isLeft) {
              _carouselController.previousPage();
            } else {
              _carouselController.nextPage();
            }
          },
        ),
      ),
    );
  }
}