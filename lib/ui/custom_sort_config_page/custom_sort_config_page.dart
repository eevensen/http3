import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http3/logic/cubit/articles_cubit.dart';
import 'package:http3/models/article_model.dart';

class CustomSortConfigPage extends StatelessWidget {
  const CustomSortConfigPage({Key? key}) : super(key: key);
  static const String routeString = 'custom-sort-config-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Sort Config Page'),
      ),
      body: BlocBuilder<ArticlesCubit, List<ArticleModel>>(
        builder: (context, articles) {
          if (articles.isNotEmpty) {
            return ReorderableListView(
              key: Key(articles.hashCode.toString()),
              children: <Widget>[
                for (int index = 0; index < articles.length; index++)
                  ListTile(
                    key: Key(articles[index].nodeId!),
                    title: Text(articles[index].title!),
                  ),
              ],
              onReorder: (oldIndex, newIndex) {
                return BlocProvider.of<ArticlesCubit>(context)
                    .updateMyListItems(oldIndex, newIndex);
              },
            );
          } else {
            return Expanded(
              child: Text('heihei'),
            );
          }
        },
      ),
    );
  }
}

updateMyListItems(oldIndex, newIndex) {
  // TODO create function that will store a new custom sort state of my articles list
}
