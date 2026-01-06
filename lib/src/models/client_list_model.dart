import 'package:freezed_annotation/freezed_annotation.dart';
import 'client_model.dart';

part 'client_list_model.freezed.dart';

@freezed
abstract class ClientListModel with _$ClientListModel {
  const factory ClientListModel({
    required bool result,
    String? message,
    @Default([]) List<ClientModel> clients,
  }) = _ClientListModel;
}
