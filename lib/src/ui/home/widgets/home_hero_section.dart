import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/home/store/home_store.dart';
import 'package:prest/src/ui/home/widgets/zooming_image.dart';

class HomeHeroSection extends ConsumerWidget {
  final double height;

  const HomeHeroSection({super.key, required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Слухаємо список слайдів (динамічні + статика)
    final slides = ref.watch(heroSlidesProvider);
    // 2. Слухаємо поточний індекс сторінки
    final currentPage = ref.watch(homeProvider.select((s) => s.currentPage));

    // Якщо слайдів ще немає (завантаження), показуємо пустий контейнер або скелетон
    if (slides.isEmpty) return SizedBox(height: height);

    final currentSlide = slides[currentPage];

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            children: [
              // 1. CAROUSEL
              Positioned.fill(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 8),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 1500,
                    ),
                    enableInfiniteScroll: true,
                    // ОНОВЛЮЄМО СТАН ПРИ ЗМІНІ СЛАЙДА
                    onPageChanged: (index, reason) {
                      ref.read(homeProvider.notifier).setCurrentPage(index);
                    },
                  ),
                  items: slides
                      .map(
                        (slide) => ZoomingImage(
                          path: slide.imagePath,
                          isNetwork: slide.isNetwork,
                        ),
                      )
                      .toList(),
                ),
              ),

              // 2. GRADIENT OVERLAY
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

              // 3. ACTION BUTTON
              Positioned(
                right: isMobile ? null : 80,
                left: isMobile ? 0 : null,
                bottom: isMobile ? 60 : 80,
                child: Container(
                  width: isMobile ? constraints.maxWidth : null,
                  alignment: isMobile
                      ? Alignment.center
                      : Alignment.centerRight,
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
}
