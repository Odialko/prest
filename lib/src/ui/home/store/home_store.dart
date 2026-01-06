import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/providers/offer_service_provider.dart';
import 'package:prest/src/repositories/offer_repository.dart';

part 'home_store.freezed.dart';

@freezed
sealed class OffersState with _$OffersState {
  const factory OffersState.init() = OffersStateInit;
  const factory OffersState.loading() = OffersStateLoading;
  const factory OffersState.error({String? message}) = OffersStateError;
  const factory OffersState.loaded({@Default([]) List<OfferModel> items}) = OffersStateLoaded;
}

@freezed
abstract class HomeStoreState with _$HomeStoreState {
  const factory HomeStoreState({
    required OffersState offersState,
    required PageController pageController,
    @Default(false) bool isScrolled,
    @Default(0) int currentPage,
  }) = _HomeStoreState;
}

class HomeNotifier extends StateNotifier<HomeStoreState> {
  final OfferRepository _offerRepository;

  HomeNotifier(this._offerRepository)
      : super(HomeStoreState(
    offersState: const OffersState.init(),
    pageController: PageController(),
  )) {
    _initializeListeners();
    fetchOffers();
  }

  void _initializeListeners() {
    state.pageController.addListener(() {
      if (state.pageController.hasClients) {
        setScrolled(state.pageController.offset > 10);
      }
    });
  }

  Future<void> fetchOffers() async {
    state = state.copyWith(offersState: const OffersState.loading());
    final result = await _offerRepository.getOffers(take: 15);

    result.fold(
          (error) => state = state.copyWith(
        offersState: OffersState.error(message: error.toString()),
      ),
          (listModel) => state = state.copyWith(
        offersState: OffersState.loaded(items: listModel.offers), // Дістаємо список з моделі
      ),
    );
  }

  void setScrolled(bool scrolled) {
    if (state.isScrolled != scrolled) state = state.copyWith(isScrolled: scrolled);
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeStoreState>((ref) {
  final repo = ref.watch(offerRepositoryProvider);
  return HomeNotifier(repo);
});