import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prest/src/repositories/response/client_response.dart';
import 'package:prest/src/models/client_list_model.dart';

part 'client_list_response.freezed.dart';

@freezed
abstract class ClientListResponse with _$ClientListResponse {
  const factory ClientListResponse({
    required bool result,
    String? message,
    @Default([]) List<ClientResponse> data,
  }) = _ClientListResponse;

  factory ClientListResponse.fromJson(Map<String, dynamic> json) {
    final dataList = (json['data'] as List?) ?? [];

    return ClientListResponse(
      result: json['result'] as bool? ?? false,
      message: json['message'] as String?,
      data: dataList
          .map((item) => ClientResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

extension ClientListResponseX on ClientListResponse {
  ClientListModel toDomain() {
    return ClientListModel(
      result: result,
      message: message,
      clients: data.map((clientDto) => clientDto.toDomain()).toList(),
    );
  }
}