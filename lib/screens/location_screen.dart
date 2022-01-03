// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/combined_widget/custom_app_bar.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LocationScreen(),
        settings: RouteSettings(name: routeName));
  }

  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Location Screen'),
      ),
    );
  }
}
