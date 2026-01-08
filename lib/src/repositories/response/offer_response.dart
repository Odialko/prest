import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/offer_model.dart';

part 'offer_response.freezed.dart';

@freezed
abstract class OfferResponse with _$OfferResponse {
  const factory OfferResponse({
    required dynamic id,
    String? estateOfferUuid,
    String? number,
    String? typeName,
    String? price,
    int? priceCurrency,
    String? pricePermeter,
    String? areaTotal,
    String? description,
    String? portalTitle,
    String? cityName,
    String? streetName,
    String? districtName,
    String? provinceName,
    String? lat,
    String? lon,
    int? floor,
    int? rooms,
    int? totalFloors,
    int? year,
    String? firstName,
    String? lastName,
    String? contactEmail,
    String? contactPhone,
    int? airConditioning,
    int? parking,
    String? mainPicture,
    List<String>? pictures,
  }) = _OfferResponse;

  // Ручний парсинг JSON для Offer
  factory OfferResponse.fromJson(Map<String, dynamic> json) {
    return OfferResponse(
      id: json['id'],
      estateOfferUuid: json['estateOfferUuid'] as String?,
      number: json['number'] as String?,
      typeName: json['typeName'] as String?,
      price: json['price']?.toString(),
      priceCurrency: json['priceCurrency'] as int?,
      pricePermeter: json['pricePermeter']?.toString(),
      areaTotal: json['areaTotal']?.toString(),
      description: json['description'] as String?,
      portalTitle: json['portalTitle'] as String?,
      // Мапінг локації з ключів EstiCRM
      cityName: json['locationCityName'] as String?,
      streetName: json['locationStreetName'] as String?,
      districtName: json['locationDistrictName'] as String?,
      provinceName: json['locationProvinceName'] as String?,
      lat: json['locationLatitude']?.toString(),
      lon: json['locationLongitude']?.toString(),
      // Характеристики
      floor: json['apartmentFloor'] as int?,
      rooms: json['apartmentRoomNumber'] as int?,
      totalFloors: json['buildingFloornumber'] as int?,
      year: json['buildingYear'] as int?,
      // Контакти
      firstName: json['contactFirstname'] as String?,
      lastName: json['contactLastname'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      // Технічні параметри
      airConditioning: json['buildingAirConditioning'] as int?,
      parking: json['additionalParking'] as int?,
      // Медіа
      mainPicture: json['main_picture'] as String?,
      pictures: (json['pictures'] as List?)?.map((e) => e.toString()).toList(),
    );
  }
}

extension OfferResponseX on OfferResponse {
  OfferModel toDomain() {
    return OfferModel(
      id: int.tryParse(id.toString()) ?? 0,
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