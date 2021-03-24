import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http3/ui/router/app_router.dart';

import 'article_list.dart';

class HomeScreen extends ConsumerWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGenereRoute,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sort app'),
        ),
        body: ArticleList(),
        drawer: Drawer(
          child: Builder(builder: (context) {
            return ListView(
              children: [
                ListTile(
                  title: Text('Sort: nodeId'),
                  onTap: () {
                    print('sort by nodeID');
                    // context.read(apiProvider).sortByNid(articles);
                  },
                ),
                ListTile(
                  onTap: () {
                    print('sort by title length');
                    // context.read(apiProvider).sortTitleLength(articles);
                  },
                  title: Text('Sort: length'),
                ),
                ListTile(
                  title: Text('Custom sort'),
                  onTap: () {
                    print('custom sort');
                    Navigator.pop(context); // remove/pop the drawer
                    Navigator.of(context).pushNamed(
                      '/custom-sort-config-page',
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
