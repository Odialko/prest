import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'constants/constants.dart';

// final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final themeProvider = StateProvider<ThemeMode>((ref) => TmpConstants.lightMode);
