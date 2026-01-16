// offer_list_store.dart
import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/providers/offer_service_provider.dart';
import 'package:prest/src/repositories/offer_repository.dart';
import 'package:prest/src/ui/home/store/home_store.dart';

part 'offer_list_store.freezed.dart';

@freezed
abstract class OfferListState with _$OfferListState {
  const factory OfferListState({
    required OffersState offersState,
    @Default('all') String currentType,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,      // Чи є ще дані для завантаження
    @Default(false) bool isLoadingMore, // Стан для довантаження внизу
  }) = _OfferListState;
}

class OfferListNotifier extends StateNotifier<OfferListState> {
  final OfferRepository _offerRepository;
  static const int _pageSize = 20; // Кількість об'єктів на сторінку

  OfferListNotifier(this._offerRepository)
      : super(OfferListState(offersState: const OffersState.init()));

  // ПЕРШЕ ЗАВАНТАЖЕННЯ (або зміна фільтра)
  Future<void> fetchOffers({String? type}) async {
    state = state.copyWith(
      offersState: const OffersState.loading(),
      currentType: type ?? 'all',
      currentPage: 1,
      hasMore: true,
    );

    final result = await _offerRepository.getOffers(take: _pageSize, skip: 0);

    result.fold(
          (error) => state = state.copyWith(offersState: OffersState.error(message: error.toString())),
          (listModel) {
        final items = _filterByType(listModel.offers, type);
        state = state.copyWith(
          offersState: OffersState.loaded(items: items),
          hasMore: listModel.offers.length >= _pageSize,
        );
      },
    );
  }

  // ЗАВАНТАЖЕННЯ НАСТУПНОЇ СТОРІНКИ
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true);

    final nextPage = state.currentPage + 1;
    final skip = (nextPage - 1) * _pageSize;

    final result = await _offerRepository.getOffers(take: _pageSize, skip: skip);

    result.fold(
          (error) => state = state.copyWith(isLoadingMore: false), // Можна додати обробку помилки
          (listModel) {
        final newItems = _filterByType(listModel.offers, state.currentType);

        // Дістаємо поточні айтеми
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

  List<OfferModel> _filterByType(List<OfferModel> list, String? type) {
    if (type == null || type == 'all') return list;
    return list.where((o) => o.typeName?.toLowerCase().contains(type.toLowerCase()) ?? false).toList();
  }
}

final offerListProvider = StateNotifierProvider<OfferListNotifier, OfferListState>((ref) {
  final repo = ref.watch(offerRepositoryProvider);
  return OfferListNotifier(repo);
});