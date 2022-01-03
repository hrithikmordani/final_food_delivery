// ignore_for_file: avoid_print, no_duplicate_case_values, prefer_const_constructors

import 'package:final_food_delivery/screens/location_screen.dart';
import 'package:final_food_delivery/screens/restaurant_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');
    switch (settings.name) {
      case '/':
        return RestaurantScreen.route();
      case RestaurantScreen.routeName:
        return RestaurantScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('error'),
              ),
            ),
        settings: RouteSettings(name: '/error'));
  }
}
