import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http3/controllers/article_controller.dart';

class CustomSortConfigPage extends ConsumerWidget {
  const CustomSortConfigPage({Key? key}) : super(key: key);
  static const String routeString = 'custom-sort-config-page';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Sort Config Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Custom Sort Config Page')),
          watch(articleControllerProvider.state).when(
              data: (articles) {
                return Expanded(
                  child: ReorderableListView(
                      children: articles
                          .map((e) => ListTile(
                                key: Key(e.nodeId!),
                                title: Text(e.title!),
                              ))
                          .toList(),
                      onReorder: (oldIndex, newIndex) {
                        print('debugging');
                        context
                            .read(articleControllerProvider)
                            .updateMyListItems(oldIndex, newIndex);
                      }),
                );
              },
              loading: () => CircularProgressIndicator(),
              error: (e, s) => Text('error')),
        ],
      ),
    );
  }
}
