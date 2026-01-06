import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prest/src/api/api_client.dart';
import 'package:prest/src/models/client_list_model.dart';
import 'package:prest/src/models/client_model.dart';
import 'package:prest/src/repositories/response/client_list_response.dart';
import 'package:prest/src/repositories/response/client_response.dart';

/// Typedef for convenient result handling in the UI layer
typedef ClientListEither = Either<DioException, ClientListModel>;
typedef ClientEither = Either<DioException, ClientModel>;

class ClientRepository {
  final ApiClient _apiClient;

  const ClientRepository(this._apiClient);

  /// Fetches the list of clients from the API and maps them to the domain model
  Future<ClientListEither> getClients() async {
    try {
      // 1. Fetch raw data from the API
      final response = await _apiClient.getClientsList();

      // 2. Parse raw response data into DTO using the manual factory
      final dto = ClientListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      // 3. Convert the DTO into the clean ClientListModel (Domain Model)
      final domainModel = ClientListModel(
        result: dto.result,
        message: dto.message,
        // Map each individual ClientResponse DTO to a ClientModel
        clients: dto.data
            .map((clientDto) => clientDto.toClientModel())
            .toList(),
      );

      return right(domainModel);
    } on DioException catch (e) {
      // Handle Dio-specific errors (connection, status codes, etc.)
      return left(e);
    } catch (e) {
      // Catch mapping errors or unexpected runtime exceptions
      return left(
        DioException(
          requestOptions: RequestOptions(path: 'client/list'),
          error: 'Mapping or unexpected error: ${e.toString()}',
        ),
      );
    }
  }

  /// Fetches a single client by ID
  Future<ClientEither> getClient(int id) async {
    try {
      // 1. Fetch raw data for a specific client
      final response = await _apiClient.getClient(id);

      // 2. Parse into Response DTO
      // Handling both cases: nested 'data' field or direct object
      final Map<String, dynamic> data =
          (response.data is Map && response.data.containsKey('data'))
          ? response.data['data'] as Map<String, dynamic>
          : response.data as Map<String, dynamic>;

      final clientDto = ClientResponse.fromJson(data);

      // 3. Convert to clean Domain Model
      return right(clientDto.toClientModel());
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
