import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/about/prest/views/about_prest_mobile_view.dart';
import 'package:prest/src/ui/about/prest/views/about_prest_web_view.dart';


abstract class AboutPrestScreen extends ConsumerWidget {
  const AboutPrestScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory AboutPrestScreen.create({Key? key}) {
    if (kIsWeb) {
      return AboutPrestWebView(key: key);
    }
    return AboutPrestMobileView(key: key);
  }
}
