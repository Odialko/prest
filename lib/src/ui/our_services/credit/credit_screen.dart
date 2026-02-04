import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/our_services/credit/views/credit_mobile_view.dart';
import 'package:prest/src/ui/our_services/credit/views/credit_web_view.dart';


abstract class CreditScreen extends ConsumerWidget {
  const CreditScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory CreditScreen.create({Key? key}) {
    if (kIsWeb) {
      return CreditWebView(key: key);
    }
    return CreditMobileView(key: key);
  }
}
