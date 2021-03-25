import 'package:flutter/material.dart';

import '../custom_sort_config_page/custom_sort_config_page.dart';
import '../home/home.dart';

class AppRouter {
  Route onGenereRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeString:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case CustomSortConfigPage.routeString:
        return MaterialPageRoute(
          builder: (context) => CustomSortConfigPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
    }
  }
}
