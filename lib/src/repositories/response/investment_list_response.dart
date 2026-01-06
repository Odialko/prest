import 'package:freezed_annotation/freezed_annotation.dart';
import 'investment_response.dart';

part 'investment_list_response.freezed.dart';
part 'investment_list_response.g.dart';

@freezed
abstract class InvestmentListResponse with _$InvestmentListResponse {
  const factory InvestmentListResponse({
    required bool success,
    required int count,
    required List<InvestmentResponse> data,
  }) = _InvestmentListResponse;

  factory InvestmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$InvestmentListResponseFromJson(json);
}
