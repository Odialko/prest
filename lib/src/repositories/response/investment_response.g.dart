// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvestmentResponse _$InvestmentResponseFromJson(Map<String, dynamic> json) =>
    _InvestmentResponse(
      estateInvestment: InvestmentData.fromJson(
        json['estate_investment'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$InvestmentResponseToJson(_InvestmentResponse instance) =>
    <String, dynamic>{'estate_investment': instance.estateInvestment};

_InvestmentData _$InvestmentDataFromJson(Map<String, dynamic> json) =>
    _InvestmentData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      cityName: json['location_city_name'] as String?,
      streetName: json['location_street_name'] as String?,
      developerName: json['developer_name'] as String?,
      priceFrom: json['price_from'],
      areaFrom: json['area_from'],
      status: (json['status'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$InvestmentDataToJson(_InvestmentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location_city_name': instance.cityName,
      'location_street_name': instance.streetName,
      'developer_name': instance.developerName,
      'price_from': instance.priceFrom,
      'area_from': instance.areaFrom,
      'status': instance.status,
      'description': instance.description,
    };
