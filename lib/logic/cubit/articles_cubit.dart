import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/article_model.dart';
import '../../services/api_service.dart';
import '../../services/dio_service.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<List<ArticleModel>> {
  final _apiService = ApiService.instance;
  final _dioService = DioService.instance;
  ArticlesCubit() : super([]);

  void fetchArticles() async {
    return emit(
      await _apiService.getArticles(
        _dioService.initDio(),
      ),
    );
  }

  sortByNid() {
    //TODO I'm confused by how to controll the state of my list of articles. I want to create a statenotiferprovider, but how do I do that based on a FutureProvider? I'm inspired by Reso Coders video on State Notifer (https://youtu.be/3OdciTLjSNA?t=698), but don't know how to combine it with a future provider.
    state.sort((a, b) {
      return a.nodeId!.compareTo(b.nodeId!);
    });
    // return emit(state);
  }

  sortTitleLength() {
    state.sort((a, b) {
      return a.title!.length.compareTo(b.title!.length);
    });
    // return emit(state);
  }
}
