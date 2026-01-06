import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/api/dio_service.dart';

final dioServiceProvider = Provider<DioService>((ref) => DioService());
