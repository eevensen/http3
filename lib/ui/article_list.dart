import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/provider.dart';

class ArticleList extends ConsumerWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(articleProvider).when(
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
                        final listOfArticles = context.read(apiProvider);
                        listOfArticles.sortByNid(articles);
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
                        final listOfArticles = context.read(apiProvider);
                        listOfArticles.sortTitleLength(articles);
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
                    onRefresh: () => context.refresh(articleProvider),
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
