import 'package:intl/intl.dart';

class PriceFormatter {
  // Міняємо тип аргументу на dynamic, щоб приймати і String, і double
  static String format(dynamic price, {String currency = 'PLN'}) {
    double? numericPrice;

    if (price is double) {
      numericPrice = price;
    } else if (price is int) {
      numericPrice = price.toDouble();
    } else if (price is String) {
      // Видаляємо пробіли та міняємо кому на крапку перед парсингом
      numericPrice = double.tryParse(price.replaceAll(RegExp(r'[^0-9.,]'), '').replaceAll(',', '.'));
    }

    if (numericPrice == null || numericPrice == 0) return 'Zapytaj o cenę';

    final formatter = NumberFormat.currency(
      locale: 'pl_PL',
      symbol: currency,
      decimalDigits: 0,
    );

    return formatter.format(numericPrice).trim();
  }
}