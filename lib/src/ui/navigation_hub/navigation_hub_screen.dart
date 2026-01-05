import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/navigation_hub_web_view.dart';
import 'views/navigation_hub_mobile_view.dart';

/// Base class for the Navigation Hub.
/// Decides whether to show Web or Mobile view based on the platform.
abstract class NavigationHubScreen extends ConsumerWidget {
  final Widget child;

  const NavigationHubScreen({super.key, required this.child});

  factory NavigationHubScreen.create({Key? key, required Widget child}) {
    if (kIsWeb) {
      return NavigationHubWebView(key: key, child: child);
    }
    return NavigationHubMobileView(key: key, child: child);
  }
}