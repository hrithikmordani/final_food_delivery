// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:final_food_delivery/combined_widget/custom_bottom_navigation_bar.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => AccountScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Center(
        child: RaisedButton(
          child: Text('Sign Out'),
          onPressed: () {
            authService.signOut();
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}
