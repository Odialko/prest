import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_hub_store.freezed.dart';
part 'navigation_hub_store.g.dart';

@freezed
abstract class NavigationHubStore with _$NavigationHubStore {
  const factory NavigationHubStore({
    @Default(false) bool isScrolled,
    String? activeRoute,
  }) = _NavigationHubStore;
}

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  NavigationHubStore build() => const NavigationHubStore();

  void setScrolled(bool value) {
    if (state.isScrolled != value) {
      state = state.copyWith(isScrolled: value);
    }
  }

  void setActiveRoute(String? route) {
    if (state.activeRoute != route) {
      state = state.copyWith(activeRoute: route);
    }
  }
}