// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) =>
    _ClientResponse(
      id: (json['id'] as num).toInt(),
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      addUserName: json['add_user_name'] as String?,
      addDate: json['add_date'] as String?,
    );

Map<String, dynamic> _$ClientResponseToJson(_ClientResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
      'add_user_name': instance.addUserName,
      'add_date': instance.addDate,
    };
