import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http3/controllers/article_controller.dart';

class ArticleList extends ConsumerWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(articleControllerProvider.state).when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, s) {
        print(e);
        print(s);
        // I know, this is dirty ;)
        return Text('$e \n\n\n\n $s');
      },
      data: (articles) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read(articleControllerProvider).sortByNid();
                      },
                      child: Text(
                        'Sort by node id',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read(articleControllerProvider)
                            .sortTitleLength();
                      },
                      child: Text(
                        'Sort by title.length',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => context
                        .read(articleControllerProvider)
                        .getArticlesFromProvider(),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(articles[index].imageUrl!),
                            ),
                            title: Text('${articles[index].title!}'),
                            trailing: Text(
                                '(id:${articles[index].nodeId!}, length ${articles[index].title!.length})'),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.black,
                            ),
                        itemCount: articles.length),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    // TODO read current sorting from Riverpod and display in Text widget
                    children: [Text('Current sorting: <VALUE>')],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
