import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/our_services/advice/views/advice_mobile_view.dart';
import 'package:prest/src/ui/our_services/advice/views/advice_web_view.dart';

abstract class AdviceScreen extends ConsumerWidget {
  const AdviceScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory AdviceScreen.create({Key? key}) {
    if (kIsWeb) {
      return AdviceWebView(key: key);
    }
    return AdviceMobileView(key: key);
  }
}
