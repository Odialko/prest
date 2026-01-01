import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import '../store/home_store.dart';

class HomeWebView extends ConsumerWidget implements HomeScreen {
  const HomeWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < LayoutsConstants.brakePointToMobile;

    return ScrollConfiguration(
      // 1. ДОЗВОЛЯЄМО ГОРТАТИ МИШКОЮ (Drag)
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      child: Column(
        children: [
          // Hero на всю ширину і висоту
          _buildHero(context, theme, screenHeight),

          // Решта контенту в спільній сітці
          _buildAbout(context, theme, isMobile),

          _buildProperties(context, ref, theme, isMobile),
        ],
      ),
    );
  }

  // HERO: Завжди на всю ширину
  Widget _buildHero(BuildContext context, PrestThemeData theme, double height) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              autoPlay: true,
              // Дозволяємо ручне гортання
              enableInfiniteScroll: true,
              // Чутливість до мишки та свайпів
              pageSnapping: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              // Зупиняємо автоплей, коли користувач тримає картинку мишкою
              pauseAutoPlayOnTouch: true,
            ),
            items: ImagesConstants.heroImages.map((path) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    path,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    // Для вебу іноді краще додати FilterQuality
                    filterQuality: FilterQuality.high,
                  );
                },
              );
            }).toList(),
          ),
          // Тут можна додати градієнт або текст поверх
        ],
      ),
    );
  }

  // Спільний метод для центрування контенту (як у футері)
  Widget _buildContentWrapper({required Widget child, required bool isMobile}) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? LayoutsConstants.horizontalPaddingMobile
                  : LayoutsConstants.horizontalPaddingDesktop
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildAbout(BuildContext context, PrestThemeData theme, bool isMobile) {
    return Container(
      color: theme.colors.milk,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: _buildContentWrapper(
        isMobile: isMobile,
        child: isMobile
            ? Column(children: _aboutContent(theme)) // На мобілці вертикально
            : Row(children: _aboutContent(theme)),   // На десктопі горизонтально
      ),
    );
  }

  List<Widget> _aboutContent(PrestThemeData theme) {
    return [
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('O NAS', style: theme.grayTextTheme.font2),
            const SizedBox(height: 20),
            Text(
              'Luksus na wyciągnięcie ręki',
              style: theme.blackTextTheme.font1,
            ),
            const SizedBox(height: 30),
            Text(
              'Ваш надійний партнер у світі нерухомості преміум-класу...',
              style: theme.blackTextTheme.font6,
            ),
          ],
        ),
      ),
      const SizedBox(width: 60, height: 40),
      Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(ImagesConstants.aboutImage, fit: BoxFit.cover),
          )
      ),
    ];
  }

  Widget _buildProperties(BuildContext context, WidgetRef ref, PrestThemeData theme, bool isMobile) {
    final propertiesState = ref.watch(homeProvider.select((s) => s.propertiesState));

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: _buildContentWrapper(
        isMobile: isMobile,
        child: propertiesState.when(
          init: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text('Error: $msg')),
          loaded: (items) => Column(
            children: [
              Text('NIERUCHOMOŚCI', style: theme.blackTextTheme.font2),
              const SizedBox(height: 60),
              // Тут згодом буде Gridview з картками об'єктів
              Text('Об’єктів у базі: ${items.length}', style: theme.blackTextTheme.font4),
            ],
          ),
        ),
      ),
    );
  }
}