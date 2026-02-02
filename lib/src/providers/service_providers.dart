import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/services/image_processing_service.dart';

final imageProcessorProvider = Provider((ref) => ImageProcessingService());