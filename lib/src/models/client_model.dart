import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';

@freezed
abstract class ClientModel with _$ClientModel {
  const factory ClientModel({
    required int id,
    required String fullName,
    String? phone,
    String? email,
    String? addUserName,
    String? addDate,
  }) = _ClientModel;
}
