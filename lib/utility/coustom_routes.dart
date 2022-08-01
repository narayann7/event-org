import 'package:event_org/view/error.dart';
import 'package:event_org/view/home.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Home.routeName:
        return Home.getNavigator();

      default:
        return MaterialPageRoute(builder: (c) => const ErrorScreen());
    }
  }
}
