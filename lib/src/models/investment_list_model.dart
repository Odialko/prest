import 'package:freezed_annotation/freezed_annotation.dart';
import 'investment_model.dart';

part 'investment_list_model.freezed.dart';

@freezed
abstract class InvestmentListModel with _$InvestmentListModel {
  const factory InvestmentListModel({
    required bool success,
    required int count,
    required List<InvestmentModel> investments,
  }) = _InvestmentListModel;
}
