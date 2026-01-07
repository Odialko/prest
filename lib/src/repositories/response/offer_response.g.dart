// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferResponse _$OfferResponseFromJson(Map<String, dynamic> json) =>
    _OfferResponse(
      id: (json['id'] as num).toInt(),
      estateOfferUuid: json['estateOfferUuid'] as String?,
      number: json['number'] as String?,
      typeName: json['typeName'] as String?,
      price: json['price'] as String?,
      priceCurrency: (json['priceCurrency'] as num?)?.toInt(),
      pricePermeter: json['pricePermeter'] as String?,
      areaTotal: json['areaTotal'] as String?,
      description: json['description'] as String?,
      portalTitle: json['portalTitle'] as String?,
      cityName: json['locationCityName'] as String?,
      streetName: json['locationStreetName'] as String?,
      districtName: json['locationDistrictName'] as String?,
      provinceName: json['locationProvinceName'] as String?,
      lat: json['locationLatitude'] as String?,
      lon: json['locationLongitude'] as String?,
      floor: (json['apartmentFloor'] as num?)?.toInt(),
      rooms: (json['apartmentRoomNumber'] as num?)?.toInt(),
      totalFloors: (json['buildingFloornumber'] as num?)?.toInt(),
      year: (json['buildingYear'] as num?)?.toInt(),
      firstName: json['contactFirstname'] as String?,
      lastName: json['contactLastname'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      airConditioning: (json['buildingAirConditioning'] as num?)?.toInt(),
      parking: (json['additionalParking'] as num?)?.toInt(),
      mainPicture: json['main_picture'] as String?,
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OfferResponseToJson(_OfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estateOfferUuid': instance.estateOfferUuid,
      'number': instance.number,
      'typeName': instance.typeName,
      'price': instance.price,
      'priceCurrency': instance.priceCurrency,
      'pricePermeter': instance.pricePermeter,
      'areaTotal': instance.areaTotal,
      'description': instance.description,
      'portalTitle': instance.portalTitle,
      'locationCityName': instance.cityName,
      'locationStreetName': instance.streetName,
      'locationDistrictName': instance.districtName,
      'locationProvinceName': instance.provinceName,
      'locationLatitude': instance.lat,
      'locationLongitude': instance.lon,
      'apartmentFloor': instance.floor,
      'apartmentRoomNumber': instance.rooms,
      'buildingFloornumber': instance.totalFloors,
      'buildingYear': instance.year,
      'contactFirstname': instance.firstName,
      'contactLastname': instance.lastName,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'buildingAirConditioning': instance.airConditioning,
      'additionalParking': instance.parking,
      'main_picture': instance.mainPicture,
      'pictures': instance.pictures,
    };
