import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prest/src/api/api_client.dart';
import 'package:prest/src/models/client_list_model.dart';
import 'package:prest/src/models/client_model.dart';
import 'package:prest/src/repositories/response/client_list_response.dart';
import 'package:prest/src/repositories/response/client_response.dart';

typedef ClientListEither = Either<DioException, ClientListModel>;
typedef ClientEither = Either<DioException, ClientModel>;

class ClientRepository {
  final ApiClient _apiClient;

  const ClientRepository(this._apiClient);

  Future<ClientListEither> getClients() async {
    try {
      final response = await _apiClient.getClientsList();

      final dto = ClientListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      // Використовуємо метод toDomain() з ClientListResponseX
      return right(dto.toDomain());

    } on DioException catch (e) {
      return left(e);
    } catch (e) {
      return left(
        DioException(
          requestOptions: RequestOptions(path: 'client/list'),
          error: 'Mapping or unexpected error: ${e.toString()}',
        ),
      );
    }
  }

  Future<ClientEither> getClient(int id) async {
    try {
      final response = await _apiClient.getClient(id);

      final Map<String, dynamic> data =
      (response.data is Map && response.data.containsKey('data'))
          ? response.data['data'] as Map<String, dynamic>
          : response.data as Map<String, dynamic>;

      final clientDto = ClientResponse.fromJson(data);

      return right(clientDto.toDomain());
    } on DioException catch (e) {
      return left(e);
    } catch (e) {
      return left(
        DioException(
          requestOptions: RequestOptions(path: 'client/get/$id'),
          error: 'Single client mapping error: ${e.toString()}',
        ),
      );
    }
  }
}