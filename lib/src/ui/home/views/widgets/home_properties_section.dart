import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/ui/home/store/home_store.dart';

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
    // Correctly watching the offersState via ref
    final offersState = ref.watch(homeProvider.select((s) => s.offersState));

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text(
                  'SPECIAL OFFERS',
                  style: theme.goldTextTheme.font7.copyWith(
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Text('PROPERTIES', style: theme.blackTextTheme.font1),
                const SizedBox(height: 80),

                offersState.when(
                  init: () => const SizedBox.shrink(),
                  // Custom skeleton loader using the project theme
                  loading: () => _buildCustomLoadingGrid(),
                  error: (msg) => Center(
                    child: Text('Error: $msg', style: theme.blackTextTheme.font5),
                  ),
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
                    itemBuilder: (context, index) => _PropertyCard(
                      item: items[index],
                      theme: theme,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Skeleton loading grid implementation
  Widget _buildCustomLoadingGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 60,
        childAspectRatio: 0.75,
      ),
      itemCount: 3,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: theme.colors.chineseBlack.withOpacity(0.05),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 180,
            height: 20,
            color: theme.colors.chineseBlack.withOpacity(0.05),
          ),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 14,
            color: theme.colors.chineseBlack.withOpacity(0.05),
          ),
        ],
      ),
    );
  }
}

class _PropertyCard extends StatefulWidget {
  final OfferModel item;
  final PrestThemeData theme;

  const _PropertyCard({required this.item, required this.theme});

  @override
  State<_PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<_PropertyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Sanitizing the URL from the pictures array provided by the API
    final String imageUrl = (widget.item.pictures != null && widget.item.pictures!.isNotEmpty)
        ? widget.item.pictures!.first.trim()
        : 'https://via.placeholder.com/600x800?text=No+Image';

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Stack(
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutCubic,
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: widget.theme.colors.chineseBlack.withOpacity(0.05),
                          child: Icon(
                            Icons.broken_image,
                            color: widget.theme.colors.chineseBlack.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    color: _isHovered
                        ? Colors.black.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            widget.item.portalTitle ?? widget.item.typeName ?? 'Property',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: widget.theme.blackTextTheme.font4.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.item.cityName ?? ''}, ${widget.item.areaTotal ?? ''} m²'.toUpperCase(),
            style: widget.theme.grayTextTheme.font7.copyWith(letterSpacing: 1.5),
          ),
          const SizedBox(height: 16),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: widget.theme.goldTextTheme.font6.copyWith(
              fontWeight: FontWeight.bold,
              color: _isHovered ? Colors.black : widget.theme.colors.chineseBlack,
            ),
            child: Text('${widget.item.price ?? '---'} PLN'),
          ),
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