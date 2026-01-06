import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/providers/api_client_provider.dart';
import 'package:prest/src/repositories/offer_repository.dart';

final offerRepositoryProvider = Provider<OfferRepository>(
  (ref) => OfferRepository(ref.watch(apiClientProvider)),
);
