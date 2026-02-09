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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        // Огортаємо в Padding, щоб кружечок не обрізався краєм контейнера
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isHovered ? 100 : 70, // Стрілка видовжується трохи більше
            height: 40,
            child: CustomPaint(
              painter: _ArrowPainter(
                color: Colors.white.withOpacity(_isHovered ? 1.0 : 0.6),
                isLeft: widget.isLeft,
                strokeWidth: 1.0,
              ),
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
    // Стиль для лінії та наконечника
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Стиль для КІЛЬЦЯ (порожнє всередині)
    final ringPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth // Товщина кільця така ж, як у лінії
      ..style = PaintingStyle.stroke;

    final path = Path();
    const double ringRadius = 4.0; // Трохи збільшив радіус, щоб кільце було помітним

    if (isLeft) {
      // КІЛЬЦЕ СПРАВА
      canvas.drawCircle(Offset(size.width - ringRadius, size.height / 2), ringRadius, ringPaint);

      // ЛІНІЯ (починається від краю кільця)
      path.moveTo(size.width - (ringRadius * 2), size.height / 2);
      path.lineTo(0, size.height / 2);

      // НАКОНЕЧНИК ЗЛІВА
      path.moveTo(8, size.height / 2 - 5);
      path.lineTo(0, size.height / 2);
      path.lineTo(8, size.height / 2 + 5);
    } else {
      // КІЛЬЦЕ ЗЛІВА
      canvas.drawCircle(Offset(ringRadius, size.height / 2), ringRadius, ringPaint);

      // ЛІНІЯ (починається від краю кільця)
      path.moveTo(ringRadius * 2, size.height / 2);
      path.lineTo(size.width, size.height / 2);

      // НАКОНЕЧНИК СПРАВА
      path.moveTo(size.width - 8, size.height / 2 - 5);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(size.width - 8, size.height / 2 + 5);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ArrowPainter oldDelegate) =>
      oldDelegate.color != color;
}