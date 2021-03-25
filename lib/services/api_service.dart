import 'package:dio/dio.dart';

import '../models/article_model.dart';

class ApiService {
  // The "._()" makes the DioService class non-instantiable. The class can
  // therefore only be instanciated once using the static variable named
  // ".instance". Example "ApiService.instance" used by the provider/riverpod
  ApiService._();
  static final instance = ApiService._();
  //TODO Robert, what do you think of this private non-instantiable pattern? From your perspective, what are the advantageous vs. disadvantageous?

  Future<List<ArticleModel>> getArticles(Dio dio) async {
    final String uriString =
        Uri.https('dautzenberg.europabasen.no', 'api/v2/article').toString();
    final response = await dio.get(uriString);
    final results = List<Map<String, dynamic>>.from(response.data);
    List<ArticleModel> articles = results
        .map((articleData) => ArticleModel.fromMap(articleData))
        .toList(growable: false);
    return articles;
  }
}
