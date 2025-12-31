import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/navigation_web_view.dart';
import 'views/navigation_mobile_view.dart';

/// BASE CLASS
/// We use ConsumerWidget as a base to allow ref access in sub-classes
abstract class NavigationHubScreen extends ConsumerWidget {
  final Widget child;

  const NavigationHubScreen({super.key, required this.child});

  /// FACTORY
  /// This is the entry point that decides which platform view to return
  factory NavigationHubScreen.create({Key? key, required Widget child}) {
    if (kIsWeb) {
      return NavigationHubWebScreen(key: key, child: child);
    }
    return NavigationHubMobileScreen(key: key, child: child);
  }
}