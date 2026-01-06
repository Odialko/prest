import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prest/src/api/api_client.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/models/offer_list_model.dart';
import 'package:prest/src/repositories/response/offer_list_response.dart';

typedef OfferListEither = Either<DioException, OfferListModel>;
typedef OfferEither = Either<DioException, OfferModel>;

class OfferRepository {
  final ApiClient _apiClient;

  const OfferRepository(this._apiClient);

  /// Отримання списку офферів
  Future<OfferListEither> getOffers({
    int take = 20,
    int skip = 0,
  }) async {
    try {
      // Викликаємо метод ApiClient, який повертає Response від Dio
      final response = await _apiClient.getOffersFull(
        take: take,
        skip: skip,
      );

      // Парсимо JSON у DTO
      final dto = OfferListResponse.fromJson(response.data);

      // Мапимо DTO у доменну модель
      final offerList = OfferListModel(
        success: dto.success,
        count: dto.count,
        offers: dto.data.map((offerDto) => offerDto.toDomain()).toList(),
      );

      return right(offerList);
    } on DioException catch (e) {
      return left(e);
    } catch (e) {
      // На випадок помилок парсингу JSON
      return left(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: e.toString(),
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  /// Отримання деталей одного оффера по ID
  Future<OfferEither> getOffer(int id) async {
    try {
      final response = await _apiClient.getOfferDetails(id);

      // В EstiCRM деталі зазвичай приходять у полі 'data'
      final rawData = response.data['data'];

      // Якщо дані прийшли як список (буває в деяких ендпоінтах), беремо перший елемент
      final json = (rawData is List) ? rawData.first : rawData;

      final offerDto = OfferResponse.fromJson(json as Map<String, dynamic>);

      return right(offerDto.toDomain());
    } on DioException catch (e) {
      return left(e);
    } catch (e) {
      return left(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: e.toString(),
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}