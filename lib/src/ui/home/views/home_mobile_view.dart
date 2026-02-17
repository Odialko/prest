import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import '../store/home_store.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prest/src/constants/constants.dart';

class HomeMobileView extends ConsumerWidget implements HomeScreen {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final theme = context.prestTheme;

    return SizedBox(
      // Set explicit screen dimensions
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: state.pageController,
        scrollDirection: Axis.vertical,
        children: [
          _buildHeroMobile(context, theme),
          _buildAboutMobile(context, theme),
          _buildPropertiesMobile(context, ref, theme),
        ],
      ),
    );
  }

  Widget _buildHeroMobile(BuildContext context, PrestThemeData theme) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            autoPlay: true,
          ),
          items: [
            Image.asset(
              ImagesConstants.house5,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ],
        ),
        // Overlay Title
        Center(
          child: Text(
            'PREST',
            style: theme.whiteTextTheme.font0.copyWith(
              letterSpacing: 8,
              fontSize: 40,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutMobile(BuildContext context, PrestThemeData theme) {
    return Container(
      color: theme.colors.milk,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ABOUT US', style: theme.grayTextTheme.font4),
          const SizedBox(height: 20),
          Image.asset(
            ImagesConstants.aboutImage,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),
          Text(
            'Your dreams,\nour passion',
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font2,
          ),
          const SizedBox(height: 20),
          Text(
            'Luxury redefined.',
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font6,
          ),
        ],
      ),
    );
  }

  Widget _buildPropertiesMobile(
    BuildContext context,
    WidgetRef ref,
    PrestThemeData theme,
  ) {
    // This section will be populated with the properties list/grid
    return const Center(child: Text('Properties Mobile'));
  }
}
