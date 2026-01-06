// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferListResponse _$OfferListResponseFromJson(Map<String, dynamic> json) =>
    _OfferListResponse(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => OfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfferListResponseToJson(_OfferListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };

_OfferResponse _$OfferResponseFromJson(Map<String, dynamic> json) =>
    _OfferResponse(
      id: (json['id'] as num).toInt(),
      number: json['number'] as String?,
      typeName: json['typeName'] as String?,
      price: json['price'] as String?,
      priceCurrency: (json['priceCurrency'] as num?)?.toInt(),
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
      mainPicture: json['main_picture'] as String?,
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OfferResponseToJson(_OfferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'typeName': instance.typeName,
      'price': instance.price,
      'priceCurrency': instance.priceCurrency,
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
      'main_picture': instance.mainPicture,
      'pictures': instance.pictures,
    };
