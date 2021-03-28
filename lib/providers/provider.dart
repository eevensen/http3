import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/dio_service.dart';
import '../services/api_service.dart';
import '../models/article_model.dart';

final dioProvider = Provider<DioService>((ref) {
  return DioService.instance;
});

final apiProvider = Provider<ApiService>((ref) {
  return ApiService([]);
});

final articleProvider = FutureProvider<List<ArticleModel>>((ref) async {
  final DioService dioService = ref.read(dioProvider);
  final ApiService apiService = ref.read(apiProvider);
  final List<ArticleModel> articles =
      await apiService.getArticles(dioService.initDio());
  return articles;
});
