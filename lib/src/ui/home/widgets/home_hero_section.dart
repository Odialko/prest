import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/generated/l10n.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/home/store/home_store.dart';
import 'package:prest/src/ui/home/widgets/hero_arrow.dart';
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
    // 1. Слухаємо слайди та поточну сторінку
    final slides = ref.watch(heroSlidesProvider);
    final currentPage = ref.watch(homeProvider.select((s) => s.currentPage));

    // 2. Слухаємо локалізацію безпосередньо в build
    final s = S.of(context);

    if (slides.isEmpty) return SizedBox(height: widget.height);

    // Отримуємо поточний слайд
    final currentSlide = slides[currentPage];

    // Визначаємо текст кнопки залежно від типу слайда "на льоту"
    final String buttonLabel = currentSlide.title == 'view_offer'
        ? s.btnZobaczOferte
        : s.navPoznajNas;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return SizedBox(
          height: widget.height,
          width: double.infinity,
          child: Stack(
            children: [
              // КАРУСЕЛЬ (Зображення)
              Positioned.fill(
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: slides.length,
                  itemBuilder: (context, index, realIndex) {
                    return ZoomingImage(
                      // Використовуємо ключ, щоб картинка не перевантажувалася при зміні мови
                      key: ValueKey(slides[index].imagePath),
                      path: slides[index].imagePath,
                      isNetwork: slides[index].isNetwork,
                    );
                  },
                  options: CarouselOptions(
                    height: widget.height,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 8),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                    enableInfiniteScroll: true,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index, _) {
                      ref.read(homeProvider.notifier).setCurrentPage(index);
                    },
                  ),
                ),
              ),

              // ГРАДІЄНТ
              _buildOverlayGradient(),

              // СТРІЛКИ
              _buildArrow(isLeft: true, isMobile: isMobile),
              _buildArrow(isLeft: false, isMobile: isMobile),

              // DOTS
              Positioned(
                left: 0,
                right: 0,
                bottom: isMobile ? 25 : 40,
                child: _buildDotsIndicator(slides.length, currentPage),
              ),

              // КНОПКА (Оновлюється миттєво)
              Positioned(
                right: isMobile ? null : 80,
                left: isMobile ? 20 : null,
                bottom: isMobile ? 60 : 80,
                child: Container(
                  width: isMobile ? constraints.maxWidth - 40 : null,
                  alignment: isMobile ? Alignment.center : Alignment.centerRight,
                  child: PrestTransparentButton(
                    // Використовуємо buttonLabel, який ми вирахували вище через S.of(context)
                    label: buttonLabel.toUpperCase(),
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

  Widget _buildOverlayGradient() {
    return Positioned.fill(
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.45, 1.0],
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDotsIndicator(int count, int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool isActive = currentIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 6,
          height: 2,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(isActive ? 0.9 : 0.3),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }

  Widget _buildArrow({required bool isLeft, required bool isMobile}) {
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 40),
        child: HeroArrow(
          isLeft: isLeft,
          onTap: () {
            isLeft
                ? _carouselController.previousPage()
                : _carouselController.nextPage();
          },
        ),
      ),
    );
  }
}