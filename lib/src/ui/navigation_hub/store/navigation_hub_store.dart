import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_hub_store.freezed.dart';

@freezed
abstract class NavigationHubState with _$NavigationHubState {
  const factory NavigationHubState({
    @Default(false) bool isScrolled,
    String? activeRoute,
  }) = _NavigationHubState;
}

class NavigationNotifier extends StateNotifier<NavigationHubState> {
  NavigationNotifier() : super(const NavigationHubState());

  // void setScrolled(bool value) {
  //   if (state.isScrolled != value) {
  //     state = state.copyWith(isScrolled: value);
  //   }
  // }

  void setActiveRoute(String? route) {
    if (state.activeRoute != route) {
      state = state.copyWith(activeRoute: route);
    }
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationHubState>((ref) {
      return NavigationNotifier();
    });
