import 'package:flutter/material.dart';

class HeroArrow extends StatefulWidget {
  final bool isLeft;
  final VoidCallback onTap;

  const HeroArrow({super.key, required this.isLeft, required this.onTap});

  @override
  State<HeroArrow> createState() => _HeroArrowState();
}

class _HeroArrowState extends State<HeroArrow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          // Збільшили ширину: тепер стрілки довші й помітніші
          width: isMobile
              ? (_isHovered ? 65 : 50)
              : (_isHovered ? 120 : 85),
          height: 50, // Трохи більше висоти для кращого попадання пальцем/мишкою
          child: CustomPaint(
            painter: _ArrowPainter(
              // Робимо колір яскравішим у спокійному стані (0.8 замість 0.6)
              color: Colors.white.withOpacity(_isHovered ? 1.0 : 0.8),
              isLeft: widget.isLeft,
              // Збільшили товщину лінії з 1.0 до 1.4 для чіткості
              strokeWidth: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  final Color color;
  final bool isLeft;
  final double strokeWidth;

  _ArrowPainter({
    required this.color,
    required this.isLeft,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final ringPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Збільшили радіус кільця: було 3.5, стало 5.0
    const double ringRadius = 5.0;
    // Збільшили наконечник: було 7, стало 10
    const double headSize = 10.0;

    if (isLeft) {
      // Кільце справа
      canvas.drawCircle(Offset(size.width - ringRadius, size.height / 2), ringRadius, ringPaint);
      // Лінія
      path.moveTo(size.width - (ringRadius * 2), size.height / 2);
      path.lineTo(0, size.height / 2);
      // Наконечник
      path.moveTo(headSize, size.height / 2 - 6);
      path.lineTo(0, size.height / 2);
      path.lineTo(headSize, size.height / 2 + 6);
    } else {
      // Кільце зліва
      canvas.drawCircle(Offset(ringRadius, size.height / 2), ringRadius, ringPaint);
      // Лінія
      path.moveTo(ringRadius * 2, size.height / 2);
      path.lineTo(size.width, size.height / 2);
      // Наконечник
      path.moveTo(size.width - headSize, size.height / 2 - 6);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(size.width - headSize, size.height / 2 + 6);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ArrowPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
}