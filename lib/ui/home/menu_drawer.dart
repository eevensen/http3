import 'package:flutter/material.dart';

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
              // context.read(apiProvider).sortByNid();
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
                CustomSortConfigPage.routeString,
              );
            },
          ),
        ],
      ),
    );
  }
}
