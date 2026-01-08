import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/client_model.dart';

part 'client_response.freezed.dart';

@freezed
abstract class ClientResponse with _$ClientResponse {
  const factory ClientResponse({
    required int id,
    String? fullname,
    String? phone,
    String? email,
    String? addUserName,
    String? addDate,
  }) = _ClientResponse;

  // Ручний парсинг JSON для одного клієнта
  factory ClientResponse.fromJson(Map<String, dynamic> json) {
    return ClientResponse(
      id: json['id'] as int? ?? 0,
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      addUserName: json['add_user_name'] as String?,
      addDate: json['add_date'] as String?,
    );
  }
}

extension ClientResponseX on ClientResponse {
  ClientModel toDomain() {
    return ClientModel(
      id: id,
      fullName: fullname ?? 'Brak danych',
      phone: phone,
      email: email,
      addUserName: addUserName,
      addDate: addDate,
    );
  }
}