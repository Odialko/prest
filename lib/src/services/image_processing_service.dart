class ImageProcessingService {
  static const String _placeholderUrl =
      'https://via.placeholder.com/600x800?text=No+Image';

  // Базовий URL вашого сховища картинок (перевір, чи він такий у EstiCRM)
  static const String _baseCrmUrl = 'https://static.esticrm.pl/foto/';
  static const String _proxyPrefix = 'https://images.weserv.nl/?url=';

  String getProcessedUrl(String? originalUrl) {
    if (originalUrl == null || originalUrl.trim().isEmpty) {
      return _placeholderUrl;
    }

    String finalUrl = originalUrl.trim();

    // 1. Якщо це просто ID (наприклад "12345") або шлях без домену
    if (!finalUrl.startsWith('http')) {
      // Склеюємо базовий домен CRM та ID/шлях
      // Можливо, треба додати розширення .jpg, якщо CRM його не дає
      finalUrl = '$_baseCrmUrl$finalUrl';
    }

    // 2. Якщо це асет — повертаємо без проксі
    if (finalUrl.startsWith('assets/')) {
      return finalUrl;
    }

    // 3. Додаємо проксі для обходу CORS
    return '$_proxyPrefix${Uri.encodeComponent(finalUrl)}&default=$_placeholderUrl';
  }
}