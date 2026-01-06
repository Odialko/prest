// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvestmentListResponse _$InvestmentListResponseFromJson(
  Map<String, dynamic> json,
) => _InvestmentListResponse(
  success: json['success'] as bool,
  count: (json['count'] as num).toInt(),
  data: (json['data'] as List<dynamic>)
      .map((e) => InvestmentResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InvestmentListResponseToJson(
  _InvestmentListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'count': instance.count,
  'data': instance.data,
};
