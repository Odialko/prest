import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prest/src/api/api_client.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/models/offer_list_model.dart';
// ПЕРЕКОНАЙТЕСЯ, ЩО ЦІ ДВА ІМПОРТИ ПРАВИЛЬНІ:
import 'package:prest/src/repositories/response/offer_list_response.dart';
import 'package:prest/src/repositories/response/offer_response.dart';

typedef OfferListEither = Either<DioException, OfferListModel>;
typedef OfferEither = Either<DioException, OfferModel>;

class OfferRepository {
  final ApiClient _apiClient;

  const OfferRepository(this._apiClient);

  Future<OfferListEither> getOffers({
    int take = 20,
    int skip = 0,
  }) async {
    try {
      final response = await _apiClient.getOffersFull(
        take: take,
        skip: skip,
      );

      final dto = OfferListResponse.fromJson(response.data);

      final offerList = OfferListModel(
        success: dto.success,
        count: dto.count,
        // Тепер .toDomain() буде доступний завдяки імпорту offer_response.dart
        offers: dto.data.map((offerDto) => offerDto.toDomain()).toList(),
      );

      return right(offerList);
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

  Future<OfferEither> getOffer(int id) async {
    try {
      final response = await _apiClient.getOfferDetails(id);
      final rawData = response.data['data'];
      final json = (rawData is List) ? rawData.first : rawData;

      // OfferResponse тепер видимий тут
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