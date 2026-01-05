import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart'; // Using legacy as requested
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/models/property.dart';

part 'home_store.freezed.dart';

// ---------------------------------------------------------------------------
// CRM DATA STATES
// ---------------------------------------------------------------------------
@freezed
sealed class PropertiesState with _$PropertiesState {
  const factory PropertiesState.init() = PropertiesStateInit;
  const factory PropertiesState.loading() = PropertiesStateLoading;
  const factory PropertiesState.error({String? message}) = PropertiesStateError;
  const factory PropertiesState.loaded({@Default([]) List<Property> items}) =
  PropertiesStateLoaded;
}

// ---------------------------------------------------------------------------
// HOME SCREEN GLOBAL STATE
// ---------------------------------------------------------------------------
@freezed
abstract class HomeStoreState with _$HomeStoreState {
  /// propertiesState: CRM data loading status
  /// pageController: Viewport scroll controller
  /// isScrolled: Header animation trigger
  /// currentPage: Active section index
  const factory HomeStoreState({
    required PropertiesState propertiesState,
    required PageController pageController,
    @Default(false) bool isScrolled,
    @Default(0) int currentPage,
  }) = _HomeStoreState;
}

// ---------------------------------------------------------------------------
// HOME NOTIFIER
// ---------------------------------------------------------------------------
class HomeNotifier extends StateNotifier<HomeStoreState> {
  HomeNotifier()
      : super(
    HomeStoreState(
      propertiesState: const PropertiesState.init(),
      pageController: PageController(),
    ),
  ) {
    _initializeListeners();
    fetchProperties();
  }

  /// Sets up scroll monitoring for UI state changes
  void _initializeListeners() {
    state.pageController.addListener(() {
      if (state.pageController.hasClients) {
        final offset = state.pageController.offset;
        setScrolled(offset > 10);
      }
    });
  }

  /// Fetches property data with a simulated network delay
  Future<void> fetchProperties() async {
    state = state.copyWith(propertiesState: const PropertiesState.loading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      final mockItems = [
        const Property(
          id: '1',
          title: 'VILLA MODERN LUX',
          location: 'Warszawa, Wilanów',
          price: '8 500 000 PLN',
          imageUrl: ImagesConstants.house1,
          area: 350.5,
          rooms: 6,
        ),
        const Property(
          id: '2',
          title: 'PENTHOUSE PANORAMA',
          location: 'Warszawa, Śródmieście',
          price: '12 000 000 PLN',
          imageUrl: ImagesConstants.house2,
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

  /// Updates the scrolled flag based on scroll offset
  void setScrolled(bool scrolled) {
    if (state.isScrolled != scrolled) {
      state = state.copyWith(isScrolled: scrolled);
    }
  }

  /// Handles smooth navigation to a specific section
  void scrollToPage(int index) {
    if (state.pageController.hasClients) {
      state.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}

// ---------------------------------------------------------------------------
// PROVIDER
// ---------------------------------------------------------------------------
final homeProvider = StateNotifierProvider<HomeNotifier, HomeStoreState>((ref) {
  return HomeNotifier();
});