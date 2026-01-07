// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferListResponse _$OfferListResponseFromJson(Map<String, dynamic> json) =>
    _OfferListResponse(
      success: json['success'] as bool? ?? false,
      count: (json['count'] as num?)?.toInt() ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => OfferResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OfferListResponseToJson(_OfferListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
