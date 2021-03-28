import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/app_router.dart';
import '../article_list/article_list.dart';
import 'menu_drawer.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeString = '/';
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
        drawer: MenuDrawer(),
      ),
    );
  }
}
