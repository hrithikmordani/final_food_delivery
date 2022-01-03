// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:final_food_delivery/cards/food_item_card.dart';
import 'package:final_food_delivery/cards/restaurant_detailed_info.dart';
import 'package:final_food_delivery/combined_widget/custom_bottom_navigation_bar.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBar(
            Icons.arrow_back,
            Icons.search,
          ),
          Expanded(
            child: ListView(
              children: [
                RestaurantDetailedInfo(),
                Container(
                  height: 12,
                  color: kBackground,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Text(
                    'Recommended',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
