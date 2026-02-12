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
    String? areaUsable,
    String? areaPlot,
    String? description,
    String? descriptionWebsite,
    String? portalTitle,
    // Локація
    String? locationCityName,
    String? locationStreetName,
    String? locationDistrictName,
    String? locationProvinceName,
    String? locationLatitude,
    String? locationLongitude,
    // Характеристики (EstiCRM naming)
    int? apartmentFloor,
    int? apartmentRoomNumber,
    int? apartmentLevelNumber, // Total floors
    int? apartmentBathroomNumber,
    int? apartmentBedroomNumber,
    int? buildingYear,
    int? market,
    int? transaction,
    // Контакти
    String? contactFirstname,
    String? contactLastname,
    String? contactEmail,
    String? contactPhone,
    // Технічні
    dynamic buildingAirConditioning, // Може бути int або bool
    dynamic additionalParking,
    dynamic additionalGarden,
    dynamic additionalTerrace,
    // Медіа
    String? mainPicture,
    List<String>? pictures,
  }) = _OfferResponse;

  factory OfferResponse.fromJson(Map<String, dynamic> json) {
    return OfferResponse(
      id: json['id'],
      estateOfferUuid: json['estateOfferUuid'] as String?,
      number: json['number']?.toString(),
      typeName: json['typeName'] as String?,
      price: json['price']?.toString(),
      priceCurrency: json['priceCurrency'] as int?,
      pricePermeter: json['pricePermeter']?.toString(),
      areaTotal: json['areaTotal']?.toString(),
      areaUsable: json['areaUsable']?.toString(),
      areaPlot: json['areaPlot']?.toString(),
      description: json['description'] as String?,
      descriptionWebsite: json['descriptionWebsite'] as String?,
      portalTitle: json['portalTitle'] as String?,
      locationCityName: json['locationCityName'] as String?,
      locationStreetName: json['locationStreetName'] as String?,
      locationDistrictName: json['locationDistrictName'] as String?,
      locationProvinceName: json['locationProvinceName'] as String?,
      locationLatitude: json['locationLatitude']?.toString(),
      locationLongitude: json['locationLongitude']?.toString(),
      apartmentFloor: json['apartmentFloor'] as int?,
      apartmentRoomNumber: json['apartmentRoomNumber'] as int?,
      apartmentLevelNumber: json['apartmentLevelNumber'] as int?,
      apartmentBathroomNumber: json['apartmentBathroomNumber'] as int?,
      apartmentBedroomNumber: json['apartmentBedroomNumber'] as int?,
      buildingYear: json['buildingYear'] as int?,
      market: json['market'] as int?,
      transaction: json['transaction'] as int?,
      contactFirstname: json['contactFirstname'] as String?,
      contactLastname: json['contactLastname'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      buildingAirConditioning: json['additionalIsLux'], // В логах це додатковий комфорт
      additionalParking: json['additionalParking'],
      additionalGarden: json['additionalGarden'],
      additionalTerrace: json['additionalTerrace'],
      mainPicture: json['mainPicture'] as String?,
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
      areaUsable: areaUsable,
      description: descriptionWebsite ?? description,
      portalTitle: portalTitle,
      cityName: locationCityName,
      streetName: locationStreetName,
      districtName: locationDistrictName,
      provinceName: locationProvinceName,
      lat: locationLatitude,
      lon: locationLongitude,
      floor: apartmentFloor,
      rooms: apartmentRoomNumber,
      totalFloors: apartmentLevelNumber,
      bathrooms: apartmentBathroomNumber,
      buildingYear: buildingYear,
      market: market,
      contactName: '${contactFirstname ?? ''} ${contactLastname ?? ''}'.trim(),
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      mainPicture: mainPicture,
      pictures: pictures,
      // Конвертація int/dynamic в bool для доменної моделі
      isAirConditioned: buildingAirConditioning == 1 || buildingAirConditioning == true,
      hasParking: additionalParking != null && additionalParking != 0,
      hasGarden: additionalGarden == 1 || additionalGarden == true,
      hasTerrace: additionalTerrace == 1 || additionalTerrace == true,
    );
  }
}