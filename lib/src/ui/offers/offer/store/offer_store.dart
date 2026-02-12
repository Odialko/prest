import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/providers/offer_service_provider.dart';
import 'package:prest/src/repositories/offer_repository.dart';

part 'offer_store.freezed.dart';

@freezed
abstract class OfferState with _$OfferState {
  const factory OfferState.loading() = _Loading;
  const factory OfferState.error(String message) = _Error;
  const factory OfferState.loaded(OfferModel offer) = _Loaded;
}

class OfferNotifier extends StateNotifier<OfferState> {
  final OfferRepository _repository;

  OfferNotifier(this._repository) : super(const OfferState.loading());

  Future<void> fetchOffer(int id) async {
    state = const OfferState.loading();
    final result = await _repository.getOffer(id);

    result.fold(
          (error) => state = OfferState.error(error.toString()),
          (offer) => state = OfferState.loaded(offer),
    );
  }
}

final offerProvider = StateNotifierProvider.family.autoDispose<OfferNotifier, OfferState, int>((ref, id) {
  final repo = ref.watch(offerRepositoryProvider);
  final notifier = OfferNotifier(repo);

  // Викликаємо завантаження ОДРАЗУ при створенні провайдера
  notifier.fetchOffer(id);

  return notifier;
});