import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/home_web_view.dart';
import 'views/home_mobile_view.dart';

abstract class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory HomeScreen.create({Key? key}) {
    if (kIsWeb) {
      return HomeWebView(key: key);
    }
    return HomeMobileView(key: key);
  }
}
