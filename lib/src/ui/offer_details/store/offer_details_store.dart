import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/providers/offer_service_provider.dart';
import 'package:prest/src/repositories/offer_repository.dart';

part 'offer_details_store.freezed.dart';

// --- STATE ---

@freezed
sealed class OfferDetailsState with _$OfferDetailsState {
  const factory OfferDetailsState.init() = OfferDetailsStateInit;
  const factory OfferDetailsState.loading() = OfferDetailsStateLoading;
  const factory OfferDetailsState.error({String? message}) = OfferDetailsStateError;
  const factory OfferDetailsState.loaded({required OfferModel item}) = OfferDetailsStateLoaded;
}

// --- PROVIDER ---

final offerDetailsProvider = StateNotifierProvider.family<OfferDetailsStore, OfferDetailsState, String>((ref, id) {
  final repository = ref.read(offerRepositoryProvider);
  return OfferDetailsStore(id: id, repository: repository);
});

// --- STORE ---

class OfferDetailsStore extends StateNotifier<OfferDetailsState> {
  final String id;
  final OfferRepository repository;

  OfferDetailsStore({
    required this.id,
    required this.repository,
  }) : super(const OfferDetailsState.init());

  // Перейменував на loadOffer для відповідності виклику в екрані
  Future<void> loadOffer() async {
    // Якщо дані вже завантажені, не перериваємо стан
    if (state is OfferDetailsStateLoaded) return;

    state = const OfferDetailsState.loading();

    final intId = int.tryParse(id) ?? 0;
    if (intId == 0) {
      state = const OfferDetailsState.error(message: 'Invalid property ID');
      return;
    }

    final result = await repository.getOffer(intId);

    result.fold(
          (dioException) {
        state = OfferDetailsState.error(
          message: dioException.message ?? 'Unknown error occurred',
        );
      },
          (offerModel) {
        state = OfferDetailsState.loaded(item: offerModel);
      },
    );
  }

  // Метод для примусового оновлення (якщо потрібно)
  Future<void> refreshOffer() async {
    final intId = int.tryParse(id) ?? 0;
    final result = await repository.getOffer(intId);
    result.fold(
          (_) => null, // При помилці рефрешу нічого не робимо
          (offer) => state = OfferDetailsState.loaded(item: offer),
    );
  }
}