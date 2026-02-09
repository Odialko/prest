import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// Провайдер для збереження поточної позиції скролу в пікселях
final scrollPositionProvider = StateProvider<double>((ref) => 0.0);

/// Провайдер, який обчислює, чи проскролив користувач достатньо для зміни хедера.
/// Повертає [true], якщо проскролено більше 50 пікселів.
// final isScrolledProvider = Provider<bool>((ref) {
//   final pixels = ref.watch(scrollPositionProvider);
//   return pixels > 50;
// });