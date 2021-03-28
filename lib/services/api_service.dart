import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/article_model.dart';

class ApiService extends StateNotifier {
  ApiService(state) : super([]);

  // The "._()" makes the DioService class non-instantiable. The class can
  // therefore only be instanciated once using the static variable named
  // ".instance". Example "ApiService.instance" used by the provider/riverpod

  // static final instance = ApiService._();
  //TODO Robert, what do you think of this private non-instantiable pattern? From your perspective, what are the advantageous vs. disadvantageous?

  Future<List<ArticleModel>> getArticles(Dio dio) async {
    final String uriString =
        Uri.https('dautzenberg.europabasen.no', 'api/v2/article').toString();
    final response = await dio.get(uriString);
    final results = List<Map<String, dynamic>>.from(response.data);
    List<ArticleModel> state = results
        .map((articleData) => ArticleModel.fromMap(articleData))
        .toList(growable: false);
    return state;
  }

  sortByNid() {
    //TODO I'm confused by how to controll the state of my list of articles. I want to create a statenotiferprovider, but how do I do that based on a FutureProvider? I'm inspired by Reso Coders video on State Notifer (https://youtu.be/3OdciTLjSNA?t=698), but don't know how to combine it with a future provider.
    state.sort((a, b) {
      return a.nodeId!.compareTo(b.nodeId!);
    });
  }

  sortTitleLength() {
    state.sort((a, b) {
      return a.title!.length.compareTo(b.title!.length);
    });
  }
}
