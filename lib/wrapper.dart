// ignore_for_file: use_key_in_widget_constructors,  unused_import, unused_local_variable, prefer_const_constructors

import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/models/user_model.dart';
import 'package:final_food_delivery/screens/login_screen.dart';
import 'package:final_food_delivery/screens/restaurant_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => Wrapper(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? LoginScreen() : RestaurantScreen();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
