import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/providers/service_providers.dart';

class PropertyCard extends ConsumerStatefulWidget {
  final OfferModel item;

  const PropertyCard({super.key, required this.item});

  @override
  ConsumerState<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends ConsumerState<PropertyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final imageService = ref.watch(imageProcessorProvider);

    // ЛОГІКА ВИБОРУ КАРТИНКИ:
    // 1. Спочатку перевіряємо, чи є список pictures і чи він не порожній
    // 2. Якщо є, беремо першу картинку (там повний URL)
    // 3. Якщо немає, пробуємо main_picture (але сервіс має вміти перетворити ID на URL)

    final String? rawImage = (widget.item.pictures != null && widget.item.pictures!.isNotEmpty)
        ? widget.item.pictures!.first
        : widget.item.mainPicture;

    final String imageUrl = imageService.getProcessedUrl(rawImage);

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
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Stack(
                    children: [
                      // ФОНОВИЙ КОЛІР (поки вантажиться картинка)
                      Container(color: const Color(0xFFF5F5F5)),

                      AnimatedScale(
                        scale: _isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutCubic,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          gaplessPlayback: true,
                          // Оптимізація: обмежуємо розмір кешу для сітки
                          cacheWidth: 800,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: theme.colors.chineseBlack.withValues(alpha: 0.03),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: theme.colors.chineseBlack.withValues(alpha: 0.05),
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  color: theme.colors.chineseBlack.withValues(alpha: 0.2),
                                ),
                              ),
                        ),
                      ),

                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        color: _isHovered
                            ? Colors.black.withValues(alpha: 0.08)
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                widget.item.portalTitle ?? widget.item.typeName ?? 'Nieruchomość',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.blackTextTheme.font4.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '${widget.item.cityName ?? ''}${widget.item.areaTotal != null ? " • ${widget.item.areaTotal} m²" : ""}'
                    .toUpperCase(),
                style: theme.grayTextTheme.font7.copyWith(
                  letterSpacing: 1.5,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 16),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: theme.blackTextTheme.font6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _isHovered
                      ? theme.colors.gold
                      : theme.colors.chineseBlack,
                ),
                child: Text(
                  widget.item.price != null
                      ? '${widget.item.price} PLN'
                      : 'Zapytaj o cenę',
                ),
              ),

              const SizedBox(height: 10),

              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                height: 1.5,
                width: _isHovered ? 60 : 0,
                color: theme.colors.gold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}