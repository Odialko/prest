import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';

/// A stylish section header with an animated decorative line and custom title widget.
///
/// Features:
/// * [title] - now accepts a [Widget] for maximum flexibility (custom size, fonts, etc.).
/// * [linePosition] - place the line on the `left` or `right` of the title.
/// * [lineWidth] - the starting width of the line.
/// * [hoverLineWidth] - the line expands to this width on mouse hover.
///
/// Example:
/// ```dart
/// PrestSectionHeader(
///   title: Text('POZNAJ NAS', style: TextStyle(fontSize: 24)),
///   linePosition: HeaderLinePosition.left,
/// )
/// ```
enum HeaderLinePosition { left, right, bottom }

class PrestSectionHeader extends StatefulWidget {
  final Widget title; // Тепер це віджет
  final HeaderLinePosition linePosition;
  final double lineWidth;
  final double hoverLineWidth;
  final Color? lineColor; // Колір суто для лінії

  const PrestSectionHeader({
    super.key,
    required this.title,
    this.linePosition = HeaderLinePosition.left,
    this.lineWidth = 100.0,
    this.hoverLineWidth = 130.0,
    this.lineColor,
  });

  @override
  State<PrestSectionHeader> createState() => _PrestSectionHeaderState();
}

class _PrestSectionHeaderState extends State<PrestSectionHeader> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final Color effectiveLineColor =
        widget.lineColor ?? theme.colors.chineseBlack;

    final Widget line = AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      width: _isHovered ? widget.hoverLineWidth : widget.lineWidth,
      height: 1,
      color: effectiveLineColor.withValues(alpha: 0.3),
    );

    // Якщо лінія знизу — використовуємо Column, інакше Row
    if (widget.linePosition == HeaderLinePosition.bottom) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.title,
            const SizedBox(height: 12), // Відступ між текстом і лінією
            line,
          ],
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.linePosition == HeaderLinePosition.left) ...[
            line,
            const SizedBox(width: 20),
          ],
          widget.title,
          if (widget.linePosition == HeaderLinePosition.right) ...[
            const SizedBox(width: 20),
            line,
          ],
        ],
      ),
    );
  }
}
