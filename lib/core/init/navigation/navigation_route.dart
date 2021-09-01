import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/core/components/test/card/not_found.dart';
import 'package:flutter_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_architecture/view/test/view/test2_view.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestsView());

      default:
    }
    return MaterialPageRoute(builder: (context) => NotFoundNavigationWidget());
  }

  MaterialPageRoute normalNavigate(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
