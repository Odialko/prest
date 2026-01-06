import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

String? authRedirect(BuildContext context, GoRouterState state, Ref ref) {
  log('current location---->: ${state.uri}', name: 'router check');
  debugPrint('current location---->: ${state.uri}');
  return null;
}
