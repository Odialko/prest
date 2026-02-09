import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prest/src/ui/privacy_policy/views/privacy_policy_mobile_view.dart';
import 'package:prest/src/ui/privacy_policy/views/privacy_policy_web_view.dart';

abstract class PrivacyPolicyScreen extends Widget {
  factory PrivacyPolicyScreen({Key? key}) {
    if (kIsWeb) {
      return const PrivacyPolicyWebView();
    }
    return PrivacyPolicyMobileView(key: key);
  }

  /// FACTORY
  /// This is the entry point that decides which platform view to return
}
