// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../cards/restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  List<RestaurantModel>? restaurants;
  RestaurantList({this.restaurants});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: restaurants!
          .map((e) => RestaurantCard(
                imageSource: e.imageSource,
                name: e.name,
                location: e.location,
                cuisine: e.cuisine,
              ))
          .toList(),
    );
  }
}
