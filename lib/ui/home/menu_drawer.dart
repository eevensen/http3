import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/articles_cubit.dart';
import '../custom_sort_config_page/custom_sort_config_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Sort: nodeId'),
            onTap: () {
              print('sort by nodeID');
              BlocProvider.of<ArticlesCubit>(context).sortByNid();
            },
          ),
          ListTile(
            onTap: () {
              print('sort by title length');
              BlocProvider.of<ArticlesCubit>(context).sortTitleLength();
            },
            title: Text('Sort: length'),
          ),
          ListTile(
            title: Text('Custom sort'),
            onTap: () {
              print('custom sort');
              Navigator.pop(context); // remove/pop the drawer
              Navigator.of(context).pushNamed(
                CustomSortConfigPage.routeString,
              );
            },
          ),
        ],
      ),
    );
  }
}
