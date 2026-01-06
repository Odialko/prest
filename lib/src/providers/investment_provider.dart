import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/providers/api_client_provider.dart';
import 'package:prest/src/repositories/investment_repository.dart';

final investmentRepositoryProvider = Provider<InvestmentRepository>(
  (ref) => InvestmentRepository(ref.watch(apiClientProvider)),
);
