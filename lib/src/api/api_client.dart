import 'package:dio/dio.dart';
import 'package:prest/src/constants/constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  // ---------------------------------------------------------------------------
  // CLIENT FOLDER
  // ---------------------------------------------------------------------------
  Future<Response> getClient(int id) =>
      _get(ApiClientConstants.clientGet, params: {'id': id});

  Future<Response> getClientsList() => _get(ApiClientConstants.clientList);

  Future<Response> updateClient(Map<String, dynamic> data) =>
      _post(ApiClientConstants.clientUpdate, data: data);

  // ---------------------------------------------------------------------------
  // OFFER FOLDER
  // ---------------------------------------------------------------------------
  Future<Response> getOffersFull({int take = 10, int skip = 0}) =>
      _get(ApiClientConstants.offerList, params: {'take': take, 'skip': skip});

  Future<Response> getOfferDetails(int id) =>
      _get(ApiClientConstants.offerDetails, params: {'id': id});

  Future<Response> getOfferDictionary() =>
      _get(ApiClientConstants.offerDictionary);

  Future<Response> addOffer(Map<String, dynamic> data) =>
      _post(ApiClientConstants.offerAdd, data: data);

  // ---------------------------------------------------------------------------
  // INVESTMENT FOLDER
  // ---------------------------------------------------------------------------
  Future<Response> getInvestmentsList() =>
      _get(ApiClientConstants.investmentListFull);

  Future<Response> getInvestmentBasic() =>
      _get(ApiClientConstants.investmentListBasic);

  // ---------------------------------------------------------------------------
  // USER FOLDER
  // ---------------------------------------------------------------------------
  Future<Response> getUserProfile() => _get(ApiClientConstants.userGet);

  Future<Response> getUsersList() => _get(ApiClientConstants.userList);

  // ---------------------------------------------------------------------------
  // HELPER METHODS
  // ---------------------------------------------------------------------------

  Future<Response> _get(String path, {Map<String, dynamic>? params}) async {
    return await _dio.get(path, queryParameters: params);
  }

  Future<Response> _post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
}
