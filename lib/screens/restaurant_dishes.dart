// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:final_food_delivery/cards/food_item_card.dart';
import 'package:final_food_delivery/cards/restaurant_detailed_info.dart';
import 'package:final_food_delivery/combined_widget/all_dishes.dart';
import 'package:final_food_delivery/combined_widget/custom_bottom_navigation_bar.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:final_food_delivery/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import '../combined_widget/custom_app_bar.dart';

class RestaurantDishes extends StatefulWidget {
  static const String routeName = '/restaurantDishes';
  static Route route({required RestaurantModel restaurant}) {
    return MaterialPageRoute(
        builder: (_) => RestaurantDishes(restaurant: restaurant),
        settings: RouteSettings(name: routeName));
  }

  RestaurantModel? restaurant;
  RestaurantDishes({this.restaurant});

  @override
  _RestaurantDishesState createState() => _RestaurantDishesState();
}

class _RestaurantDishesState extends State<RestaurantDishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.restaurant!.imageSource!))),
            ),
            SizedBox(
              height: 20,
            ),
            RestaurantDetailedInfo(
              restaurant: widget.restaurant,
            ),
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
            SizedBox(
              height: 5,
            ),
            AllDishes(
              dishes: widget.restaurant!.dishes!,
            ),
          ],
        ),
      ),
    );
  }
}
