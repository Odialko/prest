import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/our_services/abroad/views/abroad_mobile_wiev.dart';
import 'package:prest/src/ui/our_services/abroad/views/abroad_web_view.dart';

abstract class AbroadScreen extends ConsumerWidget {
  const AbroadScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory AbroadScreen.create({Key? key}) {
    if (kIsWeb) {
      return AbroadWebView(key: key);
    }
    return AbroadMobileView(key: key);
  }
}
