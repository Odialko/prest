import 'package:flutter/material.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';

class HomeAboutSection extends StatelessWidget {
  final bool isMobile;
  final PrestThemeData theme;

  const HomeAboutSection({super.key, required this.isMobile, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.colors.milk,
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final children = [
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('O NAS', style: theme.goldTextTheme.font7.copyWith(letterSpacing: 4, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Text('Luksus zdefiniowany na nowo', style: theme.blackTextTheme.font1.copyWith(height: 1.2)),
            const SizedBox(height: 30),
            Text(
              'PrEST to butikowa agencja nieruchomości premium, gdzie pasja do architektury łączy się z najwyższym standardem obsługi klienta.',
              style: theme.blackTextTheme.font6.copyWith(color: Colors.black54, height: 1.8),
            ),
          ],
        ),
      ),
      SizedBox(width: isMobile ? 0 : 100, height: isMobile ? 40 : 0),
      Expanded(
        flex: 1,
        child: AspectRatio(aspectRatio: 4 / 5, child: Image.asset(ImagesConstants.aboutImage, fit: BoxFit.cover)),
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: isMobile ? Column(children: children) : Row(children: children),
        ),
      ),
    );
  }
}