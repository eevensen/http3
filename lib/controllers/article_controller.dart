import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http3/models/article_model.dart';
import 'package:http3/services/api_service.dart';

final articleControllerProvider =
    StateNotifierProvider<ArticleController>((ref) {
  final apiProviderref = ref.watch(apiProvider);
  return ArticleController(apiProviderref, AsyncValue.data([]));
});

class ArticleController extends StateNotifier<AsyncValue<List<ArticleModel>>> {
  ArticleController(this._apiService, AsyncValue<List<ArticleModel>> state)
      : super(state) {
    getArticlesFromProvider();
  }
  ApiService _apiService;

  getArticlesFromProvider() async {
    state = AsyncValue.loading();
    try {
      final articles = await _apiService.getArticles();
      state = AsyncValue.data(articles);
    } catch (e) {
      state = AsyncValue.error('couldn\'t get article');
    }
  }

  sortByNid() {
    state.whenData((listOfArticles) {
      listOfArticles.sort((a, b) {
        return a.nodeId!.compareTo(b.nodeId!);
      });
      state = AsyncValue.data(listOfArticles);
    });
  }

  sortTitleLength() {
    state.whenData((listOfArticles) {
      listOfArticles.sort((a, b) {
        return a.title!.length.compareTo(b.title!.length);
      });
      state = AsyncValue.data(listOfArticles);
    });
  }

  void updateMyListItems(int oldIndex, int newIndex) {
    state.whenData((listOfArticles) {
      final listOfArticlesWithoutFixedLength = List<ArticleModel>.from(
          listOfArticles); // ensures that listOfArticles is not a fixed-length list
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = listOfArticlesWithoutFixedLength.removeAt(oldIndex);
      listOfArticlesWithoutFixedLength.insert(newIndex, item);
      state = AsyncValue.data(listOfArticlesWithoutFixedLength);
    });
  }
}
