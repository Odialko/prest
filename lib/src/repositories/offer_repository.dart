import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:prest/src/api/api_client.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/models/offer_list_model.dart';
import 'package:prest/src/repositories/response/offer_list_response.dart';
import 'package:prest/src/repositories/response/offer_response.dart';

typedef OfferListEither = Either<DioException, OfferListModel>;
typedef OfferEither = Either<DioException, OfferModel>;

class OfferRepository {
  final ApiClient _apiClient;

  const OfferRepository(this._apiClient);

  Future<OfferListEither> getOffers({int take = 20, int skip = 0}) async {
    try {
      final response = await _apiClient.getOffersFull(take: take, skip: skip);

      print('--- [DEBUG] START PARSING OFFERS ---');
      print('--- [DEBUG] DATA TYPE: ${response.data.runtimeType}');
      // print('--- [DEBUG] RAW DATA: ${response.data}');

      // 1. Парсимо JSON у DTO за допомогою ручного fromJson
      final dto = OfferListResponse.fromJson(response.data as Map<String, dynamic>);

      print('--- [DEBUG] DTO PARSED SUCCESSFULLY ---');

      // 2. Перетворюємо DTO в доменну модель за допомогою toDomain()
      // Цей метод тепер включає конвертацію всього списку Offers
      final domainModel = dto.toDomain();

      return right(domainModel);
    } on DioException catch (e) {
      return left(e);
    } catch (e, stack) {
      print('❌❌❌ JSON PARSING ERROR (getOffers): $e');
      print('❌ ERROR TYPE: ${e.runtimeType}');
      print('❌ STACKTRACE: $stack');

      return left(
        DioException(
          requestOptions: RequestOptions(path: 'getOffers'),
          error: 'Parsing error: $e',
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  Future<OfferEither> getOffer(int id) async {
    try {
      final response = await _apiClient.getOfferDetails(id);

      print('--- [DEBUG] START PARSING SINGLE OFFER ---');

      final rawData = response.data['data'];
      final json = (rawData is List) ? rawData.first : rawData;

      // Використовуємо ручний fromJson
      final offerDto = OfferResponse.fromJson(json as Map<String, dynamic>);

      print('--- [DEBUG] SINGLE OFFER DTO PARSED ---');

      // Повертаємо доменну модель
      return right(offerDto.toDomain());
    } on DioException catch (e) {
      return left(e);
    } catch (e, stack) {
      print('❌❌❌ JSON PARSING ERROR (getOffer): $e');
      print('❌ STACKTRACE: $stack');

      return left(
        DioException(
          requestOptions: RequestOptions(path: 'getOffer'),
          error: 'Parsing error: $e',
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}