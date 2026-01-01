import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:prest/src/prestApp.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    const ProviderScope(child: PrestApp())
  );
}
