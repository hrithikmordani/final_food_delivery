// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:final_food_delivery/cards/food_item_card.dart';
import 'package:final_food_delivery/models/dish_model.dart';
import 'package:flutter/material.dart';

class AllDishes extends StatelessWidget {
  List<DishModel>? dishes;
  AllDishes({this.dishes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dishes!
          .map((e) => FoodItemCard(
                dish: e,
              ))
          .toList(),
    );
  }
}
