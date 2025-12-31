// lib/src/ui/home/views/home_web_view.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import '../home_screen.dart';
import '../store/home_store.dart';

class HomeWebView extends ConsumerWidget implements HomeScreen {
  const HomeWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        _buildSection(screenHeight, _buildHero(context, theme)),
        _buildSection(screenHeight, _buildAbout(context, theme)),
        _buildSection(screenHeight, _buildProperties(context, ref, theme)),
      ],
    );
  }

  Widget _buildSection(double height, Widget child) {
    return SizedBox(height: height, child: child);
  }

  Widget _buildHero(BuildContext context, PrestThemeData theme) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 2000),
          ),
          items: ImagesConstants.heroImages.map((path) {
            return Image.asset(path, width: double.infinity, fit: BoxFit.cover);
          }).toList(),
        ),
        // ВИКОРИСТОВУЄМО .withValues ЗАМІСТЬ .withOpacity
        Container(color: Colors.black.withValues(alpha: 0.3)),
        // Center(
        //   child: Text(
        //     'PRESTIGIOUS ESTATE',
        //     style: theme.whiteTextTheme.font0.copyWith(
        //       letterSpacing: 15,
        //       fontSize: 80,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildAbout(BuildContext context, PrestThemeData theme) {
    return Container(
      color: theme.colors.milk,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('O NAS', style: theme.grayTextTheme.font2),
                const SizedBox(height: 20),
                Text('Luksus na wyciągnięcie ręki', style: theme.blackTextTheme.font1),
              ],
            ),
          ),
          Expanded(child: Image.asset(ImagesConstants.aboutImage)),
        ],
      ),
    );
  }

  Widget _buildProperties(BuildContext context, WidgetRef ref, PrestThemeData theme) {
    final propertiesState = ref.watch(homeProvider.select((s) => s.propertiesState));

    return Container(
      color: Colors.white,
      child: propertiesState.when(
        init: () => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (msg) => Center(child: Text('CRM Error: $msg')),
        loaded: (items) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NIERUCHOMOŚCI', style: theme.blackTextTheme.font2),
            const SizedBox(height: 40),
            Text('Знайдено об’єктів у CRM: ${items.length}'),
          ],
        ),
      ),
    );
  }
}