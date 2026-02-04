import 'package:flutter/material.dart';

class ZoomingImage extends StatefulWidget {
  final String path;
  final bool isNetwork; // Додали цей параметр

  const ZoomingImage({
    super.key,
    required this.path,
    this.isNetwork = false, // За замовчуванням false (асети)
  });

  @override
  State<ZoomingImage> createState() => _ZoomingImageState();
}

class _ZoomingImageState extends State<ZoomingImage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isPortrait = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);

    // Викликаємо перевірку, але не даємо їй блокувати рендер
    _checkImageSize();
  }

  void _checkImageSize() {
    try {
      final ImageProvider provider = widget.isNetwork
          ? NetworkImage(widget.path)
          : AssetImage(widget.path) as ImageProvider;

      final ImageStream stream = provider.resolve(const ImageConfiguration());

      stream.addListener(
        ImageStreamListener(
              (ImageInfo info, bool synchronousCall) {
            if (mounted) {
              setState(() {
                _isPortrait = info.image.height > info.image.width;
              });
            }
          },
          onError: (dynamic exception, StackTrace? stackTrace) {
            // Якщо не вдалося прочитати розмір — просто ігноруємо,
            // щоб не "повісити" весь віджет
            debugPrint('Could not check image size: $exception');
          },
        ),
      );
    } catch (e) {
      debugPrint('Image check error: $e');
    }
  }

  @override
  void dispose() {
    // ЦЕЙ РЯДОК ВИПРАВЛЯЄ ВАШУ ПОМИЛКУ
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Transform.scale(
          scale: 1.0 + (_controller.value * 0.1),
          child: widget.isNetwork
              ? Image.network(
            widget.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            // Якщо ми ще не знаємо розмір, ставимо дефолт
            alignment: _isPortrait
                ? const Alignment(0, -0.3)
                : const Alignment(0, -0.2),
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          )
              : Image.asset(
            widget.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: _isPortrait
                ? const Alignment(0, -0.3)
                : const Alignment(0, -0.2),
          ),
        );
      },
    );
  }
}
