import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/property.dart';

part 'home_store.freezed.dart';

// --- СТАНИ ДЛЯ CRM ДАНИХ ---
@freezed
sealed class PropertiesState with _$PropertiesState {
  const factory PropertiesState.init() = PropertiesStateInit;
  const factory PropertiesState.loading() = PropertiesStateLoading;
  const factory PropertiesState.error({String? message}) = PropertiesStateError;
  const factory PropertiesState.loaded({@Default([]) List<Property> items}) =
      PropertiesStateLoaded;
}

// --- ЗАГАЛЬНИЙ СТАН HOME SCREEN ---
@freezed
abstract class HomeStoreState with _$HomeStoreState {
  const factory HomeStoreState({
    // Стан завантаження з CRM
    required PropertiesState propertiesState,
    // Навігація
    required PageController pageController,
    @Default(false) bool isScrolled,
    @Default(0) int currentPage,
  }) = _HomeStoreState;
}

// --- НОТИФІКАТОР ---
// lib/src/ui/home/store/home_store.dart

// ... твої імпорти та стани PropertiesState ...

class HomeNotifier extends StateNotifier<HomeStoreState> {
  HomeNotifier()
      : super(HomeStoreState(
    propertiesState: const PropertiesState.init(),
    pageController: PageController(),
  )) {
    // Слухаємо потік скролу постійно
    state.pageController.addListener(() {
      final offset = state.pageController.offset;
      // Якщо відійшли від самого верху хоча б на 10 пікселів — зменшуємо хедер
      setScrolled(offset > 10);
    });
    fetchProperties();
  }

  Future<void> fetchProperties() async {
    state = state.copyWith(propertiesState: const PropertiesState.loading());

    try {
      // Імітуємо затримку мережі
      await Future.delayed(const Duration(seconds: 2));

      // Тестові дані, які ми потім замінимо на реальний CRM API
      final mockItems = [
        const Property(
          id: '1',
          title: 'VILLA MODERN LUX',
          location: 'Warszawa, Wilanów',
          price: '8 500 000 PLN',
          imageUrl: 'assets/images/house1.webp',
          area: 350.5,
          rooms: 6,
        ),
        const Property(
          id: '2',
          title: 'PENTHOUSE PANORAMA',
          location: 'Warszawa, Śródmieście',
          price: '12 000 000 PLN',
          imageUrl: 'assets/images/house2.webp',
          area: 180.0,
          rooms: 4,
        ),
      ];

      state = state.copyWith(
        propertiesState: PropertiesState.loaded(items: mockItems),
      );
    } catch (e) {
      state = state.copyWith(
        propertiesState: PropertiesState.error(message: e.toString()),
      );
    }
  }
  void setScrolled(bool scrolled) {
    if (state.isScrolled != scrolled) {
      state = state.copyWith(isScrolled: scrolled);
    }
  }

  // --- ДОДАЙ ТАКОЖ ЦЕЙ МЕТОД ДЛЯ ЯКОРІВ ---
  void scrollToPage(int index) {
    state.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }
}

// ПРОВАЙДЕР
final homeProvider = StateNotifierProvider<HomeNotifier, HomeStoreState>((ref) {
  return HomeNotifier();
});
