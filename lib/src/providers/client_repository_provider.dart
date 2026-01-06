import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/providers/api_client_provider.dart';
import 'package:prest/src/repositories/client_repository.dart';

final clientRepositoryProvider = Provider<ClientRepository>(
  (ref) => ClientRepository(
    ref.watch(apiClientProvider), // Assuming your Dio client provider name
  ),
);
