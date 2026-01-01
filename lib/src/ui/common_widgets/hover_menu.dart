import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/constants.dart';

class HoverMenu extends StatefulWidget {
  final String title;
  final List<String> items;
  final PrestThemeData theme;
  final Function(String) onSelected;
  final bool isStaticLink;

  const HoverMenu({
    super.key,
    required this.title,
    this.items = const [],
    required this.theme,
    required this.onSelected,
    this.isStaticLink = false,
  });

  @override
  State<HoverMenu> createState() => _HoverMenuState();
}

class _HoverMenuState extends State<HoverMenu> with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  Timer? _closeTimer;
  late AnimationController _controller;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _insertOverlay();
    });
  }

  void _insertOverlay() {
    if (widget.isStaticLink || widget.items.isEmpty) return;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _handleEnter() {
    _closeTimer?.cancel();
    if (mounted) _controller.forward();
  }

  void _handleExit() {
    _closeTimer?.cancel();
    _closeTimer = Timer(const Duration(milliseconds: 100), () {
      if (mounted && _controller.status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: LayoutsConstants.hoverMenuWidth,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, LayoutsConstants.hoverMenuOffset),
          child: MouseRegion(
            onEnter: (_) => _handleEnter(),
            onExit: (_) => _handleExit(),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // Використовуємо Visibility для повного приховування, коли анімація в 0
                return Visibility(
                  visible: _controller.value > 0,
                  child: ClipRect(
                    child: SlideTransition(
                      position: _slide,
                      child: child,
                    ),
                  ),
                );
              },
              child: Material(
                elevation: 0, // ПОВНІСТЮ ПРИБРАНО РИСКУ
                color: widget.theme.colors.white,
                shadowColor: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.items.map((item) => _buildItem(item)).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String item) {
    return _HoverMenuItem(
      title: item,
      theme: widget.theme,
      onTap: () {
        widget.onSelected(item);
        _closeTimer?.cancel();
        if (mounted) _controller.reverse();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => _handleEnter(),
        onExit: (_) => _handleExit(),
        child: InkWell(
          onTap: widget.isStaticLink ? () => widget.onSelected(widget.title) : null,
          mouseCursor: SystemMouseCursors.click,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final isActive = _controller.value > 0.01;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: isActive ? widget.theme.colors.milk : Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: widget.theme.blackTextTheme.font7.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isActive ? widget.theme.colors.gold : widget.theme.colors.black,
                      ),
                    ),
                    if (!widget.isStaticLink) ...[
                      const SizedBox(width: 4),
                      RotationTransition(
                        turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: isActive ? widget.theme.colors.gold : widget.theme.colors.black,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    _controller.stop(); // ЖОРСТКА ЗУПИНКА ПЕРЕД ВИДАЛЕННЯМ
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
    _controller.dispose();
    super.dispose();
  }
}

class _HoverMenuItem extends StatefulWidget {
  final String title;
  final PrestThemeData theme;
  final VoidCallback onTap;
  const _HoverMenuItem({required this.title, required this.theme, required this.onTap});

  @override
  State<_HoverMenuItem> createState() => _HoverMenuItemState();
}

class _HoverMenuItemState extends State<_HoverMenuItem> {
  bool _isItemHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isItemHovered = true),
      onExit: (_) => setState(() => _isItemHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          color: _isItemHovered ? widget.theme.colors.milk : Colors.transparent,
          child: Text(
            widget.title,
            style: widget.theme.blackTextTheme.font7.copyWith(
              color: _isItemHovered ? widget.theme.colors.gold : widget.theme.colors.black,
              fontWeight: _isItemHovered ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:prest/src/prest_theme.dart';
// import 'package:prest/src/constants/constants.dart';
//
// class HoverMenu extends StatefulWidget {
//   final String title;
//   final List<String> items;
//   final PrestThemeData theme;
//   final Function(String) onSelected;
//   final bool isStaticLink;
//
//   const HoverMenu({
//     super.key,
//     required this.title,
//     this.items = const [],
//     required this.theme,
//     required this.onSelected,
//     this.isStaticLink = false,
//   });
//
//   @override
//   State<HoverMenu> createState() => _HoverMenuState();
// }
//
// class _HoverMenuState extends State<HoverMenu> {
//   bool _isHovered = false;
//   final LayerLink _layerLink = LayerLink();
//   OverlayEntry? _overlayEntry;
//   Timer? _closeTimer;
//
//   void _handleEnter() {
//     _closeTimer?.cancel();
//     if (!_isHovered) {
//       setState(() => _isHovered = true);
//       _showOverlay();
//     }
//   }
//
//   void _handleExit() {
//     _closeTimer?.cancel();
//     _closeTimer = Timer(LayoutsConstants.hoverMenuExitDelay, () {
//       if (mounted) {
//         setState(() => _isHovered = false);
//         _hideOverlay();
//       }
//     });
//   }
//
//   void _showOverlay() {
//     if (widget.isStaticLink || widget.items.isEmpty) return;
//     _hideOverlay();
//     _overlayEntry = _createOverlayEntry();
//     Overlay.of(context).insert(_overlayEntry!);
//   }
//
//   void _hideOverlay() {
//     if (_overlayEntry != null) {
//       _overlayEntry?.remove();
//       _overlayEntry = null;
//     }
//   }
//
//   OverlayEntry _createOverlayEntry() {
//     return OverlayEntry(
//       builder: (context) => Positioned(
//         width: LayoutsConstants.hoverMenuWidth,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: const Offset(0, LayoutsConstants.hoverMenuOffset),
//           child: MouseRegion(
//             onEnter: (_) => _handleEnter(),
//             onExit: (_) => _handleExit(),
//             child: Material(
//               elevation: 8,
//               color: widget.theme.colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: widget.items.map((item) => _buildItem(item)).toList(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildItem(String item) {
//     return _HoverMenuItem(
//       title: item,
//       theme: widget.theme,
//       onTap: () {
//         widget.onSelected(item);
//         _closeTimer?.cancel();
//         setState(() => _isHovered = false);
//         _hideOverlay();
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: MouseRegion(
//         onEnter: (_) => _handleEnter(),
//         onExit: (_) => _handleExit(),
//         child: InkWell(
//           onTap: widget.isStaticLink
//               ? () => widget.onSelected(widget.title)
//               : null,
//           mouseCursor: SystemMouseCursors.click,
//           hoverColor: Colors.transparent,
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             color: _isHovered ? widget.theme.colors.milk : Colors.transparent,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   widget.title,
//                   style: widget.theme.blackTextTheme.font7.copyWith(
//                     fontWeight: FontWeight.w600,
//                     color: _isHovered
//                         ? widget.theme.colors.gold
//                         : widget.theme.colors.black,
//                   ),
//                 ),
//                 if (!widget.isStaticLink) ...[
//                   const SizedBox(width: 4),
//                   AnimatedRotation(
//                     duration: LayoutsConstants.hoverMenuItemAnimationDuration,
//                     turns: _isHovered ? 0.5 : 0,
//                     child: Icon(
//                       Icons.keyboard_arrow_down,
//                       size: 16,
//                       color: _isHovered
//                           ? widget.theme.colors.gold
//                           : widget.theme.colors.black,
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _closeTimer?.cancel();
//     _hideOverlay();
//     super.dispose();
//   }
// }
//
// class _HoverMenuItem extends StatefulWidget {
//   final String title;
//   final PrestThemeData theme;
//   final VoidCallback onTap;
//
//   const _HoverMenuItem({
//     required this.title,
//     required this.theme,
//     required this.onTap,
//   });
//
//   @override
//   State<_HoverMenuItem> createState() => _HoverMenuItemState();
// }
//
// class _HoverMenuItemState extends State<_HoverMenuItem> {
//   bool _isItemHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isItemHovered = true),
//       onExit: (_) => setState(() => _isItemHovered = false),
//       child: InkWell(
//         onTap: widget.onTap,
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           color: _isItemHovered ? widget.theme.colors.milk : Colors.transparent,
//           child: Text(
//             widget.title,
//             style: widget.theme.blackTextTheme.font7.copyWith(
//               color: _isItemHovered
//                   ? widget.theme.colors.gold
//                   : widget.theme.colors.black,
//               fontWeight: _isItemHovered ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
