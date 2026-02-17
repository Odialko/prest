import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:prest/generated/l10n.dart';

// Провайдер, який зберігає поточну локаль. За замовчуванням — польська.
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('pl'));

  // Метод для зміни мови
  void setLocale(String languageCode) {
    state = Locale(languageCode);
  }
}


final l10nProvider = Provider<S>((ref) {
  // Ми використовуємо S.current, який автоматично оновлюється системою
  return S.current;
});