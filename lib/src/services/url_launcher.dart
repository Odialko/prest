import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  // Приватний конструктор, щоб не створювати екземпляри (робимо методи статичними)
  UrlLauncherService._();

  static Future<void> openInstagram() async {
    const url = 'https://www.instagram.com/prest_estate/';
    await _launch(url, isExternal: true);
  }

  static Future<void> makeCall(String phoneNumber) async {
    final url = 'tel:${phoneNumber.replaceAll(' ', '')}';
    await _launch(url);
  }

  static Future<void> sendEmail(String email) async {
    final url = 'mailto:$email';
    await _launch(url);
  }

  static Future<void> openMaps(String address) async {
    // Кодуємо адресу для безпечного використання в URL
    final encodedAddress = Uri.encodeComponent(address);
    final url = 'https://www.google.com/maps/search/?api=1&query=$encodedAddress';

    await _launch(url, isExternal: true);
  }

  // Універсальний внутрішній метод
  static Future<void> _launch(String urlString, {bool isExternal = false}) async {
    final Uri url = Uri.parse(urlString);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          // Режим externalApplication відкриває саме додаток (Insta, Tel), а не браузер
          mode: isExternal
              ? LaunchMode.externalApplication
              : LaunchMode.platformDefault,
        );
      }
    } catch (e) {
      debugPrint('Could not launch $urlString: $e');
    }
  }
}