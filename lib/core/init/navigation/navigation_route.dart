import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/authenticate/login/view/login_view.dart';

import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(LoginView());

      default:
    }
    return MaterialPageRoute(builder: (context) => LoginView());
  }

  MaterialPageRoute normalNavigate(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
