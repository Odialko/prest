import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import 'package:prest/src/ui/home/widgets/home_about_section.dart';
import 'package:prest/src/ui/home/widgets/home_hero_section.dart';
import 'package:prest/src/ui/home/widgets/home_properties_section.dart';

class HomeWebView extends ConsumerWidget implements HomeScreen {
  const HomeWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < LayoutsConstants.brakePointToMobile;

    return PrestPage(
      slivers: [
        SliverToBoxAdapter(child: HomeHeroSection(height: screenHeight)),
        SliverToBoxAdapter(child: HomeAboutSection(isMobile: isMobile)),
        HomePropertiesSection(isMobile: isMobile),
      ],
    );
  }
}
