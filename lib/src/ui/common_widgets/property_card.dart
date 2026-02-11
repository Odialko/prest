import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/providers/service_providers.dart';
import 'package:prest/src/services/price_formater.dart';

class PropertyCard extends StatefulWidget {
  final OfferModel item;
  const PropertyCard({super.key, required this.item});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final theme = context.prestTheme;
        final imageService = ref.watch(imageProcessorProvider);

        final String? rawImage = (widget.item.pictures != null && widget.item.pictures!.isNotEmpty)
            ? widget.item.pictures!.first
            : widget.item.mainPicture;

        final String imageUrl = imageService.getProcessedUrl(rawImage);

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => context.push(
              Routes.propertyDetails(widget.item.id.toString()),
              extra: widget.item,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. ФОТО З ЗУМОМ
                Expanded(
                  child: ClipRRect(
                    child: AnimatedScale(
                      scale: _isHovered ? 1.1 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[100],
                          child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 2. МІСТО
                Text(
                  (widget.item.cityName ?? 'WARSZAWA').toUpperCase(),
                  style: theme.blackTextTheme.font7.copyWith(
                    letterSpacing: 2,
                    fontSize: 10,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 6),

                // 3. НАЗВА
                Text(
                  (widget.item.portalTitle ?? widget.item.typeName ?? 'NIERUCHOMOŚĆ').toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.blackTextTheme.font4.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),

                // 4. ЦІНА
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 1,
                      width: _isHovered ? 40 : 25, // Додав ще й подовження лінії при ховері
                      color: theme.colors.gold,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      PriceFormatter.format(widget.item.price),
                      style: theme.blackTextTheme.font5.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}