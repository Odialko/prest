import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import '../../store/home_store.dart';

class HomePropertiesSection extends ConsumerWidget {
  final bool isMobile;
  final PrestThemeData theme;

  const HomePropertiesSection({
    super.key,
    required this.isMobile,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesState = ref.watch(homeProvider.select((s) => s.propertiesState));

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text(
                  'OFERTY SPECJALNE',
                  style: theme.goldTextTheme.font7.copyWith(letterSpacing: 4, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text('NIERUCHOMOŚCI', style: theme.blackTextTheme.font1),
                const SizedBox(height: 80),

                propertiesState.when(
                  init: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator(color: Colors.black)),
                  error: (msg) => Center(child: Text('Error: $msg')),
                  loaded: (items) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 3,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 60,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) => _PropertyCard(item: items[index], theme: theme),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PropertyCard extends StatefulWidget {
  final dynamic item;
  final PrestThemeData theme;

  const _PropertyCard({required this.item, required this.theme});

  @override
  State<_PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<_PropertyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container with Zoom Effect
          Expanded(
            child: ClipRRect(
              child: Stack(
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutCubic,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        widget.item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Subtle Overlay on hover
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    color: _isHovered
                        ? Colors.black.withValues(alpha: 0.1)
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Content
          Text(
            widget.item.title,
            style: widget.theme.blackTextTheme.font4.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.item.location.toUpperCase(),
            style: widget.theme.grayTextTheme.font7.copyWith(letterSpacing: 1.5),
          ),
          const SizedBox(height: 16),

          // Price with animated underline or slight shift
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: widget.theme.goldTextTheme.font6.copyWith(
              fontWeight: FontWeight.bold,
              color: _isHovered ? Colors.black : widget.theme.colors.chineseBlack,
            ),
            child: Text(widget.item.price),
          ),

          // Bottom line indicator
          const SizedBox(height: 10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: 1,
            width: _isHovered ? 60 : 0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}