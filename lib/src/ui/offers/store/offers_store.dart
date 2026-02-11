import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/providers/offer_service_provider.dart';
import 'package:prest/src/repositories/offer_repository.dart';
// Якщо OffersState вже є в home_store.dart, переконайся, що немає конфліктів.
// Але для чистоти Legacy Freezed краще тримати структуру тут.

part 'offers_store.freezed.dart';

@freezed
abstract class OffersState with _$OffersState {
  const factory OffersState.init() = OffersStateInit;
  const factory OffersState.loading() = OffersStateLoading;
  const factory OffersState.error({String? message}) = OffersStateError;
  const factory OffersState.loaded({@Default([]) List<OfferModel> items}) = OffersStateLoaded;
}

@freezed
abstract class OfferListState with _$OfferListState {
  const factory OfferListState({
    required OffersState offersState,
    @Default('all') String currentType,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _OfferListState;
}

class OffersNotifier extends StateNotifier<OfferListState> {
  final OfferRepository _offerRepository;


  static const int _pageSize = 4;


  // static const int _pageSize = 20;

  // В ініті передаємо OfferListState, а не OffersState
  OffersNotifier(this._offerRepository)
      : super(OfferListState(offersState: const OffersState.init()));

  // ПЕРШЕ ЗАВАНТАЖЕННЯ
  Future<void> fetchOffers({String? type}) async {
    state = state.copyWith(
      offersState: const OffersState.loading(),
      currentType: type ?? 'all',
      currentPage: 1,
      hasMore: true,
    );

    final result = await _offerRepository.getOffers(take: _pageSize, skip: 0);

    result.fold(
          (error) => state = state.copyWith(
        offersState: OffersState.error(message: error.toString()),
      ),
          (listModel) {
        final filteredItems = _filterByType(listModel.offers, state.currentType);
        state = state.copyWith(
          offersState: OffersState.loaded(items: filteredItems),
          hasMore: listModel.offers.length >= _pageSize,
        );
      },
    );
  }

  // ДОЗАВАНТАЖЕННЯ
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    final nextPage = state.currentPage + 1;
    final skip = (nextPage - 1) * _pageSize;

    print('--- LOADING PAGE $nextPage | SKIP: $skip | TAKE: $_pageSize ---');

    state = state.copyWith(isLoadingMore: true);

    final result = await _offerRepository.getOffers(take: _pageSize, skip: skip);

    result.fold(
          (error) => state = state.copyWith(isLoadingMore: false),
          (listModel) {
        final newItems = _filterByType(listModel.offers, state.currentType);

        // Правильно дістаємо поточні айтеми через maybeWhen абстрактного OffersState
        final currentItems = state.offersState.maybeWhen(
          loaded: (items) => items,
          orElse: () => <OfferModel>[],
        );

        state = state.copyWith(
          offersState: OffersState.loaded(items: [...currentItems, ...newItems]),
          isLoadingMore: false,
          currentPage: nextPage,
          hasMore: listModel.offers.length >= _pageSize,
        );
      },
    );
  }

  List<OfferModel> _filterByType(List<OfferModel> list, String type) {
    if (type == 'all') return list;
    return list.where((o) =>
    o.typeName?.toLowerCase().contains(type.toLowerCase()) ?? false
    ).toList();
  }
}

// Провайдер тепер повертає OfferListState
final offersProvider = StateNotifierProvider<OffersNotifier, OfferListState>((ref) {
  final repo = ref.watch(offerRepositoryProvider);
  return OffersNotifier(repo);
});