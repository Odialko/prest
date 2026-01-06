import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/api/api_client.dart';
import 'dio_service_provider.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(dioServiceProvider);
  return ApiClient(dio.client);
});
