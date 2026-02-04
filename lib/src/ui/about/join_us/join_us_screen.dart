import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/about/join_us/views/join_us_mobile_view.dart';
import 'package:prest/src/ui/about/join_us/views/join_us_web_view.dart';

abstract class JoinUsScreen extends ConsumerWidget {
  const JoinUsScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory JoinUsScreen.create({Key? key}) {
    if (kIsWeb) {
      return JoinUsWebView(key: key);
    }
    return JoinUsMobileView(key: key);
  }
}
