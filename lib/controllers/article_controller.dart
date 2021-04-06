import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_controller.dart';
import '../models/article_model.dart';
import '../services/api_service.dart';

final articleControllerProvider =
    StateNotifierProvider<ArticleController>((ref) {
  final apiProviderref = ref.watch(apiProvider);
  return ArticleController(apiProviderref, AsyncValue.data([]), ref.read);
});

class ArticleController extends StateNotifier<AsyncValue<List<ArticleModel>>> {
  ArticleController(
      this._apiService, AsyncValue<List<ArticleModel>> state, this.read)
      : super(state) {
    getArticlesFromProvider();
  }
  ApiService _apiService;
  final Reader read;

  getArticlesFromProvider() async {
    state = AsyncValue.loading();
    try {
      final articles = await _apiService.getArticles();
      read(userControllerProvider).updateSorting('feedSorting');
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
      read(userControllerProvider).updateSorting('nidSorting');
      state = AsyncValue.data(listOfArticles);
    });
  }

  sortTitleLength() {
    state.whenData((listOfArticles) {
      listOfArticles.sort((a, b) {
        return a.title!.length.compareTo(b.title!.length);
      });
      read(userControllerProvider).updateSorting('titleLengthSorting');
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
      read(userControllerProvider).updateSorting('CustomSorting');
      state = AsyncValue.data(listOfArticlesWithoutFixedLength);
    });
  }
}
