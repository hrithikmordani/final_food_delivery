// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';
import '../combined_widget/custom_app_bar.dart';

class RestaurantDishes extends StatefulWidget {
  @override
  _RestaurantDishesState createState() => _RestaurantDishesState();
}

class _RestaurantDishesState extends State<RestaurantDishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            Icons.arrow_back,
            Icons.search,
          ),
        ],
      ),
    );
  }
}
