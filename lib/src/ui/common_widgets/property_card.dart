import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/routing/routes.dart';

class PropertyCard extends StatefulWidget {
  final OfferModel item;
  final PrestThemeData theme;

  const PropertyCard({super.key, required this.item, required this.theme});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Process image URL with placeholder fallback
    final String rawImageUrl =
    (widget.item.pictures != null && widget.item.pictures!.isNotEmpty)
        ? widget.item.pictures!.first.trim()
        : 'https://via.placeholder.com/600x800?text=No+Image';

    // Image proxy or direct link
    final String imageUrl = rawImageUrl.contains('placeholder')
        ? rawImageUrl
        : 'https://images.weserv.nl/?url=${Uri.encodeComponent(rawImageUrl)}';

    return SelectionContainer.disabled(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            context.push(
              Routes.propertyDetails(widget.item.id.toString()),
              extra: widget.item,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // IMAGE SECTION with hover zoom effect
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  child: Stack(
                    children: [
                      AnimatedScale(
                        scale: _isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutCubic,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Container(
                            // Fixed: using withValues instead of withOpacity
                            color: widget.theme.colors.chineseBlack.withValues(alpha: 0.05),
                            child: Icon(
                              Icons.broken_image,
                              color: widget.theme.colors.chineseBlack.withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                      ),
                      // Subtle dark overlay on hover
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

              // PROPERTY TITLE
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

              // LOCATION AND AREA
              Text(
                '${widget.item.cityName ?? ''}, ${widget.item.areaTotal ?? ''} m²'
                    .toUpperCase(),
                style: widget.theme.grayTextTheme.font7.copyWith(
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              // PRICE with color transition
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: widget.theme.blackTextTheme.font6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _isHovered
                      ? widget.theme.colors.gold
                      : widget.theme.colors.chineseBlack,
                ),
                child: Text('${widget.item.price ?? '---'} PLN'),
              ),

              const SizedBox(height: 10),

              // ANIMATED UNDERLINE
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                height: 1.5,
                width: _isHovered ? 80 : 0,
                color: widget.theme.colors.gold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}