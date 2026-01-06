import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';

part 'offer_list_model.freezed.dart';

@freezed
abstract class OfferListModel with _$OfferListModel {
  const factory OfferListModel({
    required bool success,
    required int count,
    required List<OfferModel> offers,
  }) = _OfferListModel;
}