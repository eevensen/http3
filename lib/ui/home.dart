import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'article_list.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sort app'),
        ),
        body: ArticleList(),
        drawer: Drawer(
          child: ListView(
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
                  //TODO Go to custom sort config page.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
