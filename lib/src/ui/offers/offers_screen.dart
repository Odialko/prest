import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prest/src/ui/offers/views/offers_mobile_view.dart';
import 'package:prest/src/ui/offers/views/offers_web_view.dart';

abstract class OffersScreen extends Widget {
  factory OffersScreen({Key? key}) {
    if (kIsWeb) {
      return const OffersWebView();
    }
    return OffersMobileView(key: key);
  }

/// FACTORY
/// This is the entry point that decides which platform view to return
}
