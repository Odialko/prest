import 'package:freezed_annotation/freezed_annotation.dart';
import 'offer_response.dart';
import 'package:prest/src/models/offer_list_model.dart';

part 'offer_list_response.freezed.dart';

@freezed
abstract class OfferListResponse with _$OfferListResponse {
  const factory OfferListResponse({
    @Default(false) bool success,
    @Default(0) int count,
    @Default([]) List<OfferResponse> data,
  }) = _OfferListResponse;

  factory OfferListResponse.fromJson(Map<String, dynamic> json) {
    // Обробка списку даних
    final list = (json['data'] as List?) ?? [];

    return OfferListResponse(
      // EstiCRM іноді використовує 'result' замість 'success',
      // тут можна додати перевірку обох ключів для безпеки
      success: (json['success'] as bool?) ?? (json['result'] as bool?) ?? false,
      count: (json['count'] as int?) ?? list.length,
      data: list
          .map((e) => OfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

extension OfferListResponseX on OfferListResponse {
  OfferListModel toDomain() {
    return OfferListModel(
      success: success,
      count: count,
      offers: data.map((e) => e.toDomain()).toList(),
    );
  }
}