import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/repositories/response/client_response.dart';

part 'client_list_response.freezed.dart';
// part 'client_list_response.g.dart';

@freezed
abstract class ClientListResponse with _$ClientListResponse {
  const factory ClientListResponse({
    required bool result,
    String? message,
    @Default([]) List<ClientResponse> data,
  }) = _ClientListResponse;

  factory ClientListResponse.fromJson(Map<String, dynamic> json) {
    var dataFromJson = (json['data'] as List?) ?? [];
    List<ClientResponse> clientsList = dataFromJson
        .map(
          (client) => ClientResponse.fromJson(client as Map<String, dynamic>),
        )
        .toList();

    return ClientListResponse(
      result: json['result'] as bool? ?? false,
      message: json['message'] as String?,
      data: clientsList,
    );
  }
}
