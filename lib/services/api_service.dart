import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http3/services/dio_service.dart';

import '../models/article_model.dart';

final apiProvider = Provider<ApiService>((ref) {
  final dioServiceRef = ref.watch(dioProvider);
  return ApiService(dioServiceRef);
});

class ApiService {
  Dio _dio;
  ApiService(this._dio);

  Future<List<ArticleModel>> getArticles() async {
    final String uriString =
        Uri.https('dautzenberg.europabasen.no', 'api/v2/article').toString();
    final response = await _dio.get(uriString);
    final results = List<Map<String, dynamic>>.from(response.data);
    List<ArticleModel> state = results
        .map((articleData) => ArticleModel.fromMap(articleData))
        .toList(growable: false);
    return state;
  }
}
