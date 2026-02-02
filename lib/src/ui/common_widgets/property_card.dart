import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/routing/routes.dart';
// Імпортуй свій сервіс та провайдер
import 'package:prest/src/providers/service_providers.dart';

class PropertyCard extends ConsumerStatefulWidget {
  final OfferModel item;

  // Тему (theme) видалили з конструктора
  const PropertyCard({super.key, required this.item});

  @override
  ConsumerState<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends ConsumerState<PropertyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Отримуємо тему та сервіс через контекст і реф
    final theme = context.prestTheme;
    final imageService = ref.read(imageProcessorProvider);

    // Використовуємо сервіс для отримання безпечного URL
    // Беремо mainPicture, а якщо її немає — першу з pictures
    final String imageUrl = imageService.getProcessedUrl(
      widget.item.mainPicture ??
          (widget.item.pictures?.isNotEmpty == true
              ? widget.item.pictures!.first
              : null),
    );

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
              // СЕКЦІЯ ЗОБРАЖЕННЯ
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    2,
                  ), // Легке закруглення для преміальності
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
                          // Використовуємо withValues як ти і хотів
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: theme.colors.chineseBlack.withValues(
                                  alpha: 0.05,
                                ),
                                child: Icon(
                                  Icons.broken_image,
                                  color: theme.colors.chineseBlack.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                              ),
                        ),
                      ),
                      // Темний оверлей при наведенні
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

              // ЗАГОЛОВОК
              Text(
                widget.item.portalTitle ??
                    widget.item.typeName ??
                    'Nieruchomość',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.blackTextTheme.font4.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 8),

              // ЛОКАЦІЯ ТА ПЛОЩА
              Text(
                '${widget.item.cityName ?? ''}${widget.item.areaTotal != null ? " • ${widget.item.areaTotal} m²" : ""}'
                    .toUpperCase(),
                style: theme.grayTextTheme.font7.copyWith(
                  letterSpacing: 1.5,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 16),

              // ЦІНА
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
                      : 'Zapytaj про cenę',
                ),
              ),

              const SizedBox(height: 10),

              // ДИНАМІЧНА ЛІНІЯ (Underline)
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
