import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/investment_model.dart';

part 'investment_response.freezed.dart';
part 'investment_response.g.dart';

@freezed
abstract class InvestmentResponse with _$InvestmentResponse {
  const factory InvestmentResponse({
    @JsonKey(name: 'estate_investment')
    required InvestmentData estateInvestment,
  }) = _InvestmentResponse;

  factory InvestmentResponse.fromJson(Map<String, dynamic> json) =>
      _$InvestmentResponseFromJson(json);
}

@freezed
abstract class InvestmentData with _$InvestmentData {
  const factory InvestmentData({
    required int id,
    required String name,
    @JsonKey(name: 'location_city_name') String? cityName,
    @JsonKey(name: 'location_street_name') String? streetName,
    @JsonKey(name: 'developer_name') String? developerName,
    @JsonKey(name: 'price_from') dynamic priceFrom,
    @JsonKey(name: 'area_from') dynamic areaFrom,
    int? status,
    String? description,
  }) = _InvestmentData;

  factory InvestmentData.fromJson(Map<String, dynamic> json) =>
      _$InvestmentDataFromJson(json);
}

extension InvestmentResponseX on InvestmentResponse {
  InvestmentModel toDomain() {
    final data = estateInvestment;
    return InvestmentModel(
      id: data.id,
      name: data.name,
      cityName: data.cityName,
      streetName: data.streetName,
      developerName: data.developerName,
      priceFrom: data.priceFrom?.toString(),
      areaFrom: data.areaFrom?.toString(),
      status: data.status,
      description: data.description,
    );
  }
}
