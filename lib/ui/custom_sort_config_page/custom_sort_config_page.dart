import 'package:flutter/material.dart';

class CustomSortConfigPage extends StatelessWidget {
  const CustomSortConfigPage({Key? key}) : super(key: key);
  static const String routeString = 'custom-sort-config-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Sort Config Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Custom Sort Config Page')),
          // ReorderableListView(
          //     children: [],
          //     onReorder: (oldIndex, newIndex) {
          //       updateMyListItems(oldIndex, newIndex);
          //     }),
          // TODO Implement Riverpod to work with the ReorderableListView above
          // Inspired from: Flutter Widget of the Week: https://www.youtube.com/watch?v=3fB1mxOsqJE&ab_channel=Flutter
        ],
      ),
    );
  }
}

updateMyListItems(oldIndex, newIndex) {
  // TODO create function that will store a new custom sort state of my articles list
}
