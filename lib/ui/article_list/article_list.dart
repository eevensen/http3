import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/articles_cubit.dart';
import '../../models/article_model.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: BlocBuilder<ArticlesCubit, List<ArticleModel>>(
          builder: (context, articles) {
            if (articles.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        return BlocProvider.of<ArticlesCubit>(context)
                            .sortByNid();
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
                        return BlocProvider.of<ArticlesCubit>(context)
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
                  // TODO refresh indicator
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage('${articles[index].imageUrl}'),
                          ),
                          title: Text('${articles[index].title}'),
                          trailing: Text(
                              'nodeId: ${articles[index].nodeId!}, length: ${articles[index].title!.length}'),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.black,
                          ),
                      itemCount: articles.length),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    // TODO read current sorting from Riverpod and display in Text widget
                    children: [Text('Current sorting: <VALUE>')],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
