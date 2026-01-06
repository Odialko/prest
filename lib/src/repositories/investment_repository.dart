import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prest/src/api/api_client.dart';
import 'package:prest/src/models/investment_model.dart';
import 'package:prest/src/models/investment_list_model.dart';
import 'package:prest/src/repositories/response/investment_response.dart';
import 'package:prest/src/repositories/response/investment_list_response.dart';

typedef InvestmentListEither = Either<DioException, InvestmentListModel>;
typedef InvestmentEither = Either<DioException, InvestmentModel>;

class InvestmentRepository {
  final ApiClient _apiClient;
  const InvestmentRepository(this._apiClient);

  /// Отримати список інвестицій
  Future<InvestmentListEither> getInvestments() async {
    try {
      final response = await _apiClient.getInvestmentsList();
      final dto = InvestmentListResponse.fromJson(response.data);

      final domainModel = InvestmentListModel(
        success: dto.success,
        count: dto.count,
        investments: dto.data.map((item) => item.toDomain()).toList(),
      );

      return right(domainModel);
    } on DioException catch (e) {
      return left(e);
    }
  }

  /// Отримати одну інвестицію (ID зазвичай передається в params)
  Future<InvestmentEither> getInvestment(int id) async {
    try {
      // Припускаю, що в ApiClient є метод getInvestmentDetails або подібний
      final response = await _apiClient.getInvestmentBasic(); // або свій метод
      final dto = InvestmentResponse.fromJson(response.data['data'][0]);

      return right(dto.toDomain());
    } on DioException catch (e) {
      return left(e);
    }
  }
}
