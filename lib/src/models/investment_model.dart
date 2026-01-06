import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment_model.freezed.dart';

@freezed
abstract class InvestmentModel with _$InvestmentModel {
  const factory InvestmentModel({
    required int id,
    required String name,
    String? cityName,
    String? streetName,
    String? developerName,
    String? priceFrom,
    String? areaFrom,
    int? status,
    String? description,
    // over 100 rows:)
  }) = _InvestmentModel;
}
