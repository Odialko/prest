import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';

@freezed
abstract class OfferModel with _$OfferModel {
  const factory OfferModel({
    required int id,
    String? estateOfferUuid,
    required String number,
    String? typeName,
    String? price,
    int? priceCurrency,
    String? pricePermeter,
    String? areaTotal,
    String? areaUsable,    // <--- ДОДАНО
    int? rooms,
    int? floor,
    int? totalFloors,
    int? bathrooms,      // <--- ДОДАНО
    int? buildingYear,
    int? market,         // <--- ДОДАНО (int, бо в API це 11/12)
    String? cityName,
    String? streetName,
    String? districtName,
    String? provinceName,
    String? lat,
    String? lon,
    String? portalTitle,
    String? description,
    String? contactEmail,
    String? contactPhone,
    String? contactName,
    String? mainPicture,
    List<String>? pictures,

    // ДОДАТКОВІ ПОЛЯ
    String? deposit,
    String? rentExtra,
    String? availableDate,
    String? buildingMaterial,
    String? heating,
    String? condition,
    bool? hasGarden,
    bool? hasTerrace,
    bool? hasElevator,
    bool? hasParking,
    bool? isAirConditioned,
  }) = _OfferModel;
}