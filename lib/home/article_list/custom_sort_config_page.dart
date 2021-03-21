import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http3/providers/provider.dart';

class CustomSortConfigPage extends ConsumerWidget {
  const CustomSortConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ReorderableListView(
        children: [],
        onReorder: (oldIndex, newIndex) {
          updateMyListItems(oldIndex, newIndex);
          // Inspired from: Flutter Widget of the Week: https://www.youtube.com/watch?v=3fB1mxOsqJE&ab_channel=Flutter
        });
  }
}

updateMyListItems(oldIndex, newIndex) {
  // TODO create function that will store a new custom sort state of my articles list
}
