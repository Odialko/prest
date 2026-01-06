import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/ui/navigation_hub/store/navigation_hub_store.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    ref.listen(navigationProvider, (previous, next) {
      notifyListeners();
    });
  }

  final Ref ref;
}
