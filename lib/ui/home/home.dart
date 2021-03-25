import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/app_router.dart';
import '../../logic/cubit/articles_cubit.dart';
import '../article_list/article_list.dart';
import 'menu_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeString = '/';
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesCubit>(
      create: (BuildContext cubitContext) => ArticlesCubit()..fetchArticles(),
      child: MaterialApp(
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
      ),
    );
  }
}
