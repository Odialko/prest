import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';

class HoverMenu extends StatefulWidget {
  final String title;
  final List<dynamic>? items;
  final PrestThemeData theme;
  final Function(String)? onSelected;
  final bool isStaticLink;

  const HoverMenu({
    super.key,
    required this.title,
    this.items,
    required this.theme,
    this.onSelected,
    this.isStaticLink = false,
  });

  @override
  State<HoverMenu> createState() => _HoverMenuState();
}

class _HoverMenuState extends State<HoverMenu> with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isHovered = false;

  // Додаємо контролер для анімації розгортання
  late final AnimationController _expandController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );
  late final Animation<double> _expandAnimation = CurvedAnimation(
    parent: _expandController,
    curve: Curves.easeInOut,
  );

  void _showOverlay() {
    if (widget.isStaticLink || widget.items == null) return;
    _overlayEntry?.remove();
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _expandController.forward(); // Запуск розгортання
  }

  void _hideOverlay() async {
    await _expandController.reverse(); // Згортання перед видаленням
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 180,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) {
              setState(() => _isHovered = false);
              _hideOverlay();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                FadeTransition(
                  opacity: _expandAnimation,
                  child: CustomPaint(
                    size: const Size(14, 8),
                    painter: TrianglePainter(
                      color: widget.theme.colors.background.withValues(alpha: 0.9), // Один шар кольору для трикутника
                    ),
                  ),
                ),
                SizeTransition(
                  sizeFactor: _expandAnimation,
                  axisAlignment: -1.0,
                  child: FadeTransition(
                    opacity: _expandAnimation,
                    child: Material(
                      elevation: 8,
                      color: Colors.transparent, // ПРИБРАНО: Material тепер прозорий
                      child: Container(
                        // ОСНОВНИЙ І ЄДИНИЙ ФОН
                        decoration: BoxDecoration(
                          color: widget.theme.colors.background.withValues(alpha: 0.95),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: widget.items!.map((item) {
                            // ТУТ ЗМІНА: викликаємо getTitle з передачею context
                            final String label = item is NavItem ? item.getTitle(context) : item.toString();

                            return _MenuItem(
                              label: label,
                              theme: widget.theme,
                              onTap: () {
                                widget.onSelected?.call(label);
                                _hideOverlay();
                              },
                            );
                          }).toList(),
                        ),
                      ),
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

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
          setState(() => _isHovered = true);
          _showOverlay();
        },
        onExit: (_) {
          Future.delayed(const Duration(milliseconds: 50), () {
            if (!_isHovered) _hideOverlay();
          });
          setState(() => _isHovered = false);
        },
        child: InkWell(
          onTap: () => widget.isStaticLink ? widget.onSelected?.call(widget.title) : null,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            // ФІКС: Використовуємо SizedBox з чіткою висотою, щоб Row не панікував
            child: SizedBox(
              height: 30,
              child: IntrinsicWidth(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: widget.theme.neonBlueTextTheme.font7.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Підкреслення
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 1.5,
                      width: _isHovered ? 30 : 0,
                      color: widget.theme.colors.chineseBlack,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MenuItem extends StatefulWidget {
  final String label;
  final PrestThemeData theme;
  final VoidCallback onTap;

  const _MenuItem({required this.label, required this.theme, required this.onTap});

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isItemHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isItemHovered = true),
      onExit: (_) => setState(() => _isItemHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        // ПРИБИРАЄМО ВСІ ЕФЕКТИ НАВЕДЕННЯ ДЛЯ ПУНКТІВ МЕНЮ
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: double.infinity,
          color: Colors.transparent, // Гарантуємо відсутність фону тут
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: widget.theme.blackTextTheme.font6.copyWith(
                  fontWeight: FontWeight.w500,
                  color: widget.theme.colors.chineseBlack,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 1.5,
                width: _isItemHovered ? 25 : 0,
                color: widget.theme.colors.chineseBlack.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}