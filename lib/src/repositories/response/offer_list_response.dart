import 'package:freezed_annotation/freezed_annotation.dart';
// Important: Importing the single source of truth for OfferResponse
import 'offer_response.dart';

part 'offer_list_response.freezed.dart';
part 'offer_list_response.g.dart';

@freezed
abstract class OfferListResponse with _$OfferListResponse {
  const factory OfferListResponse({
    // Using @Default to prevent 'null is not a subtype of bool' in release builds
    @Default(false) bool success,
    @Default(0) int count,
    @Default([]) List<OfferResponse> data,
  }) = _OfferListResponse;

  factory OfferListResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferListResponseFromJson(json);
}