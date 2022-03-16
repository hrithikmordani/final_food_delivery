// ignore_for_file: avoid_print, no_duplicate_case_values, prefer_const_constructors

import 'package:final_food_delivery/models/restaurant_model.dart';
import 'package:final_food_delivery/screens/account_screen.dart';
import 'package:final_food_delivery/screens/cart_screen.dart';
import 'package:final_food_delivery/screens/location_screen.dart';

import 'package:final_food_delivery/screens/new_login_screen.dart';
import 'package:final_food_delivery/screens/new_registration_screen.dart';
import 'package:final_food_delivery/screens/payment_gateway.dart';
import 'package:final_food_delivery/screens/restaurant_dishes.dart';
import 'package:final_food_delivery/screens/restaurant_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../wrapper.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');
    switch (settings.name) {
      case '/':
        return Wrapper.route();
      case LoginScreenNew.routeName:
        return LoginScreenNew.route();
      case AccountScreen.routeName:
        return AccountScreen.route();
      case RegistrationScreenNew.routeName:
        return RegistrationScreenNew.route();
      case Wrapper.routeName:
        return RestaurantScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case RestaurantDishes.routeName:
        return RestaurantDishes.route(
            restaurant: settings.arguments as RestaurantModel);
      case PaymentGateway.routeName:
        return PaymentGateway.route(cost: settings.arguments as num);

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
