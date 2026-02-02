class ImageProcessingService {
  static const String _placeholderUrl =
      'https://via.placeholder.com/600x800?text=No+Image';

  // Використовуємо weserv.nl для обходу CORS та оптимізації
  static const String _proxyPrefix = 'https://images.weserv.nl/?url=';

  /// Обробляє сире посилання, додає проксі та обробляє плейсхолдери
  String getProcessedUrl(String? originalUrl) {
    if (originalUrl == null || originalUrl.trim().isEmpty) {
      return _placeholderUrl;
    }

    final trimmedUrl = originalUrl.trim();

    // Якщо це вже плейсхолдер або локальний асет — повертаємо як є
    if (trimmedUrl.contains('placeholder') ||
        trimmedUrl.startsWith('assets/')) {
      return trimmedUrl;
    }

    // Додаємо проксі та енкодимо компонент
    return '$_proxyPrefix${Uri.encodeComponent(trimmedUrl)}';
  }
}
