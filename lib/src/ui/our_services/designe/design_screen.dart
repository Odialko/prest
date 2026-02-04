import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/our_services/designe/views/design_mobile_view.dart';
import 'package:prest/src/ui/our_services/designe/views/design_web_view.dart';

abstract class DesignScreen extends ConsumerWidget {
  const DesignScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory DesignScreen.create({Key? key}) {
    if (kIsWeb) {
      return DesignWebView(key: key);
    }
    return DesignMobileView(key: key);
  }
}
