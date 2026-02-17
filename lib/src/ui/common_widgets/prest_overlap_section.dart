import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/layouts_constants.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';

/// A responsive content section with overlapping background and optional image-text grid.
///
/// Key features:
/// * [variant] - determines the layout (text only, image left/right, or background image).
/// * Matches the alignment of the site's Navigation Bar (max width + 40px padding).
///
/// Example Usage:
/// ```dart
/// // Image on the left, text on the right
/// PrestOverlapSection(
///   variant: PrestSectionVariant.imageLeft,
///   imagePath: 'assets/images/team.jpg',
///   textContent: MyTextWidget(),
/// )
///
/// // Centered text only
/// PrestOverlapSection(
///   variant: PrestSectionVariant.onlyText,
///   textContent: Text('Large Centered Heading'),
/// )
/// ```

enum PrestSectionVariant { onlyText, imageRight, imageLeft, imageBackground }

class PrestOverlapSection extends StatelessWidget {
  final Widget textContent;
  final String? imagePath;
  final PrestSectionVariant variant;
  final Color? backgroundColor;
  final double height;

  const PrestOverlapSection({
    super.key,
    required this.textContent,
    this.imagePath,
    this.variant = PrestSectionVariant.imageLeft,
    this.backgroundColor,
    this.height = 650,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 1150; // Синхронно з AppBar
    final Color bgColor = backgroundColor ?? theme.colors.milk;

    if (isMobile) {
      return Container(
        color: variant == PrestSectionVariant.onlyText ? theme.colors.white : bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          children: [
            if (imagePath != null && variant != PrestSectionVariant.onlyText) ...[
              ScrollRevealBox(child: Image.asset(imagePath!, fit: BoxFit.cover)),
              const SizedBox(height: 40),
            ],
            ScrollRevealBox(child: textContent),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: height,
      color: theme.colors.white,
      child: Stack(
        children: [
          // Фонова плашка
          if (variant == PrestSectionVariant.imageLeft || variant == PrestSectionVariant.imageRight)
            Align(
              alignment: variant == PrestSectionVariant.imageLeft ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(width: width * 0.65, color: bgColor),
            ),

          // КОНТЕНТ (Точна копія логіки NavigationAppBar)
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40), // ЯК У ХЕДЕРІ
                child: _buildDesktopContent(theme),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopContent(PrestThemeData theme) {
    if (variant == PrestSectionVariant.onlyText) {
      return Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 800), child: textContent));
    }

    final bool imgOnLeft = variant == PrestSectionVariant.imageLeft;
    return Row(
      children: [
        Expanded(flex: imgOnLeft ? 6 : 4, child: imgOnLeft ? _buildImage() : textContent),
        const SizedBox(width: 80), // Проміжок
        Expanded(flex: imgOnLeft ? 4 : 6, child: imgOnLeft ? textContent : _buildImage()),
      ],
    );
  }

  Widget _buildImage() {
    return ScrollRevealBox(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 40, offset: const Offset(0, 20))
        ]),
        child: Image.asset(imagePath!, fit: BoxFit.cover, height: 480, width: double.infinity),
      ),
    );
  }
}