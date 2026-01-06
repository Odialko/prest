import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/models/client_model.dart';

part 'client_response.freezed.dart';
part 'client_response.g.dart';

@freezed
abstract class ClientResponse with _$ClientResponse {
  const factory ClientResponse({
    required int id,
    @JsonKey(name: 'fullname') String? fullname,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'add_user_name') String? addUserName,
    @JsonKey(name: 'add_date') String? addDate,
  }) = _ClientResponse;

  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);
}

extension ClientResponseX on ClientResponse {
  ClientModel toClientModel() {
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
