import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prest/src/ui/offers/offer/views/offer_web_view.dart';
// import 'package:prest/src/ui/offers/offer/views/offer_mobile_view.dart';

abstract class OfferScreen extends Widget {
  factory OfferScreen({required int offerId, Key? key}) {
    if (kIsWeb) {
      return OfferWebView(offerId: offerId, key: key);
    }
    // Поки немає мобільної версії, повертаємо веб
    return OfferWebView(offerId: offerId, key: key);
  }
}