import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:prest/src/ui/our_services/for_developers/views/for_developers_mobile_view.dart';
import 'package:prest/src/ui/our_services/for_developers/views/for_developers_web_view.dart';

/// Base class for the Navigation Hub.
/// Decides whether to show Web or Mobile view based on the platform.
abstract class ForDevelopersScreen extends Widget {

  factory ForDevelopersScreen({Key? key}) {
    if (kIsWeb) {
      return ForDevelopersWebView(key: key);
    }
    return ForDevelopersMobileView(key: key);
  }
}