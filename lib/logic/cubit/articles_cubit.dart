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
    state.sort(
      (a, b) {
        return a.nodeId!.compareTo(b.nodeId!);
      },
    );
    emit(state.toList());
  }

  sortTitleLength() {
    state.sort(
      (a, b) {
        return a.title!.length.compareTo(b.title!.length);
      },
    );
    emit(state.toList());
  }

  void updateMyListItems(int oldIndex, int newIndex) {
    final listOfArticles = List<ArticleModel>.from(
        state); // ensures that listOfArticles is not a fixed-length list
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = listOfArticles.removeAt(oldIndex);
    listOfArticles.insert(newIndex, item);
    emit(
      listOfArticles,
    );
  }
}
