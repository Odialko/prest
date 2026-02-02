import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/providers/offer_service_provider.dart';
import 'package:prest/src/providers/service_providers.dart';
import 'package:prest/src/repositories/offer_repository.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/ui/home/models/hero_slide.dart';

part 'home_store.freezed.dart';

@freezed
class OffersState with _$OffersState {
  const factory OffersState.init() = OffersStateInit;
  const factory OffersState.loading() = OffersStateLoading;
  const factory OffersState.error({String? message}) = OffersStateError;
  const factory OffersState.loaded({@Default([]) List<OfferModel> items}) =
      OffersStateLoaded;
}

@freezed
abstract class HomeStoreState with _$HomeStoreState {
  const factory HomeStoreState({
    required OffersState offersState,
    required PageController pageController, // Обов'язкове поле
    @Default(false) bool isScrolled,
    @Default(0) int currentPage,
  }) = _HomeStoreState;
}

class HomeNotifier extends StateNotifier<HomeStoreState> {
  final OfferRepository _offerRepository;

  // Використовуємо фабричний конструктор стейту правильно
  HomeNotifier(this._offerRepository)
    : super(
        HomeStoreState(
          offersState: const OffersState.init(),
          pageController: PageController(),
        ),
      ) {
    fetchOffers();
  }

  Future<void> fetchOffers() async {
    state = state.copyWith(offersState: const OffersState.loading());
    final result = await _offerRepository.getOffers(take: 15);

    result.fold(
      (error) => state = state.copyWith(
        offersState: OffersState.error(message: error.toString()),
      ),
      (listModel) => state = state.copyWith(
        offersState: OffersState.loaded(items: listModel.offers),
      ),
    );
  }

  void setCurrentPage(int index) {
    state = state.copyWith(currentPage: index);
  }

  void setScrolled(bool scrolled) {
    if (state.isScrolled != scrolled) {
      state = state.copyWith(isScrolled: scrolled);
    }
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}

// ПРОВАЙДЕРИ
final homeProvider = StateNotifierProvider<HomeNotifier, HomeStoreState>((ref) {
  final repo = ref.watch(offerRepositoryProvider);
  return HomeNotifier(repo);
});

final heroSlidesProvider = Provider<List<HeroSlide>>((ref) {
  final homeState = ref.watch(homeProvider);
  final imageProcessor = ref.watch(imageProcessorProvider);

  // 1. Створюємо список із захардкоджених слайдів (вони будуть завжди)
  final staticSlides = [
    HeroSlide(
      imagePath: ImagesConstants.heroImages[1],
      title: 'ZOBACZ OFERTĘ',
      route: Routes.team,
      isNetwork: false,
    ),
    HeroSlide(
      imagePath: ImagesConstants.heroImages[2],
      title: 'ZOBACZ OFERTĘ',
      route: Routes.team,
      isNetwork: false,
    ),
    HeroSlide(
      imagePath: ImagesConstants.heroImages[3],
      title: 'ZOBACZ OFERTĘ',
      route: Routes.team,
      isNetwork: false,
    ),

    HeroSlide(
      imagePath: ImagesConstants.heroImages.last,
      title: 'POZNAJ NAS',
      route: Routes.team,
      isNetwork: false,
    ),
  ];

  // 2. Додаємо оферти, ТІЛЬКИ якщо вони завантажились
  final dynamicSlides = homeState.offersState.maybeWhen(
    loaded: (items) => items
        .take(3)
        .map(
          (offer) => HeroSlide(
            imagePath: imageProcessor.getProcessedUrl(offer.mainPicture),
            title: 'ZOBACZ OFERTĘ',
            route: '${Routes.offers}/${offer.id}',
            isNetwork: true,
          ),
        )
        .toList(),
    orElse: () =>
        [], // Якщо вантажиться або помилка — динамічних слайдів просто 0
  );

  // 3. Склеюємо їх (оферти спочатку, статика в кінці)
  return [...dynamicSlides, ...staticSlides];
});
