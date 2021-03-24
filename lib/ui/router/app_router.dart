import 'package:flutter/material.dart';

import '../custom_sort_config_page/custom_sort_config_page.dart';
import '../home.dart';

class AppRouter {
  Route onGenereRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case '/custom-sort-config-page':
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
