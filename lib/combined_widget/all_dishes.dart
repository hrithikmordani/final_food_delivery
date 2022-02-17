// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:final_food_delivery/cards/food_item_card.dart';
import 'package:final_food_delivery/models/dish_model.dart';
import 'package:final_food_delivery/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class AllDishes extends StatelessWidget {
  List<dynamic>? dishes;
  RestaurantModel? restaurant;
  AllDishes({this.dishes, this.restaurant});

  @override
  Widget build(BuildContext context) {
    final dishesmap = dishes!.map((item) {
      return item.toMap();
    }).toList();
    print(dishesmap);
    return Column(
      children: dishes!
          .map((e) => FoodItemCard(
                dish: e,
                dishesmap: dishesmap,
                restaurant: restaurant,
              ))
          .toList(),
    );
  }
}
