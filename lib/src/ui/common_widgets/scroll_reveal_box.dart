import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollRevealBox extends StatefulWidget {
  final Widget child;
  final Duration delay;        // Затримка появи
  final Duration duration;     // Тривалість анімації
  final Offset slideOffset;    // Напрямок руху (звідки випливає)

  const ScrollRevealBox({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1000),
    this.slideOffset = const Offset(0, 0.05), // Легкий рух знизу вгору
  });

  @override
  State<ScrollRevealBox> createState() => _ScrollRevealBoxState();
}

class _ScrollRevealBoxState extends State<ScrollRevealBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  bool _hasAppeared = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _slide = Tween<Offset>(begin: widget.slideOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      // Використовуємо hashCode віджета як унікальний ключ
      key: ValueKey(widget.child.hashCode),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_hasAppeared) {
          Future.delayed(widget.delay, () {
            if (mounted) {
              _controller.forward();
              setState(() => _hasAppeared = true);
            }
          });
        }
      },
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(position: _slide, child: widget.child),
      ),
    );
  }
}