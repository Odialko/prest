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
    // БЕЗПЕЧНА ПЕРЕВІРКА:
    // Перевіряємо, чи є під ключем 'data' саме список.
    // Якщо там false, null або щось інше — повертаємо порожній масив.
    final rawData = json['data'];
    final list = (rawData is List) ? rawData : [];

    return OfferListResponse(
      // Перевіряємо успіх: шукаємо в success або result
      success: (json['success'] as bool?) ?? (json['result'] as bool?) ?? false,

      // Кількість: беремо з count або просто довжину отриманого списку
      count: (json['count'] as int?) ?? list.length,

      // Мапимо дані тільки якщо ми впевнені, що це список
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