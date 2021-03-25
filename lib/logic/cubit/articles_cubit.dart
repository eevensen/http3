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
    return emit(state.toList());
  }

  sortTitleLength() {
    // TODO could this package be of any help? https://pub.dev/packages/flutter_bloc_list_manager
    state.sort(
      (a, b) {
        return a.title!.length.compareTo(b.title!.length);
      },
    );
    return emit(state.toList());
  }
}
