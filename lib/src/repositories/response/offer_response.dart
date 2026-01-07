import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';

part 'offer_response.freezed.dart';
part 'offer_response.g.dart';

@freezed
abstract class OfferResponse with _$OfferResponse {
  const factory OfferResponse({
    required int id,
    String? estateOfferUuid,
    String? number,
    String? typeName,
    String? price,
    int? priceCurrency,
    String? pricePermeter,
    String? areaTotal,
    String? description,
    String? portalTitle,

    // Location
    @JsonKey(name: 'locationCityName') String? cityName,
    @JsonKey(name: 'locationStreetName') String? streetName,
    @JsonKey(name: 'locationDistrictName') String? districtName,
    @JsonKey(name: 'locationProvinceName') String? provinceName,
    @JsonKey(name: 'locationLatitude') String? lat,
    @JsonKey(name: 'locationLongitude') String? lon,

    // Characteristics
    @JsonKey(name: 'apartmentFloor') int? floor,
    @JsonKey(name: 'apartmentRoomNumber') int? rooms,
    @JsonKey(name: 'buildingFloornumber') int? totalFloors,
    @JsonKey(name: 'buildingYear') int? year,

    // Contacts
    @JsonKey(name: 'contactFirstname') String? firstName,
    @JsonKey(name: 'contactLastname') String? lastName,
    String? contactEmail,
    String? contactPhone,

    // Technical features
    @JsonKey(name: 'buildingAirConditioning') int? airConditioning,
    @JsonKey(name: 'additionalParking') int? parking,

    // Media
    @JsonKey(name: 'main_picture') String? mainPicture,
    List<String>? pictures,
  }) = _OfferResponse;

  factory OfferResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferResponseFromJson(json);
}

extension OfferResponseX on OfferResponse {
  OfferModel toDomain() {
    return OfferModel(
      id: id,
      estateOfferUuid: estateOfferUuid,
      number: number ?? '',
      typeName: typeName,
      price: price,
      priceCurrency: priceCurrency,
      pricePermeter: pricePermeter,
      areaTotal: areaTotal,
      description: description,
      portalTitle: portalTitle,
      cityName: cityName,
      streetName: streetName,
      districtName: districtName,
      provinceName: provinceName,
      lat: lat,
      lon: lon,
      floor: floor,
      rooms: rooms,
      totalFloors: totalFloors,
      buildingYear: year,
      contactName: '${firstName ?? ''} ${lastName ?? ''}'.trim(),
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      mainPicture: mainPicture,
      pictures: pictures,
      isAirConditioned: airConditioning == 1,
      hasParking: parking != null,
    );
  }
}