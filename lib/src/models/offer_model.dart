import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';

@freezed
abstract class OfferModel with _$OfferModel {
  const factory OfferModel({
    required int id,
    String? estateOfferUuid,
    required String number,
    String? typeName,

    // Цінові показники
    String? price,
    int? priceCurrency,
    String? pricePermeter,

    // Площа та стан
    String? areaTotal,
    int? rooms,
    int? floor,
    int? totalFloors,
    int? buildingYear,

    // Локація
    String? cityName,
    String? streetName,
    String? districtName,
    String? provinceName,
    String? lat,
    String? lon,

    // Опис та контакти
    String? portalTitle,
    String? description,
    String? contactEmail,
    String? contactPhone,
    String? contactName,

    // Медіа
    String? mainPicture,
    List<String>? pictures,

    // Додаткові технічні прапорці (можна розширювати за потребою)
    bool? hasElevator,
    bool? hasParking,
    bool? isAirConditioned,
  }) = _OfferModel;
}