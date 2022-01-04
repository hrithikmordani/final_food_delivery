// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:final_food_delivery/models/restaurant_model.dart';
import 'package:final_food_delivery/screens/restaurant_dishes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class RestaurantCard extends StatelessWidget {
  // void selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return RestaurantDishes();
  //       },
  //     ),
  //   );
  // }
  RestaurantModel? restaurant;
  String? name;
  String? location;
  String? cuisine;
  String? imageSource;
  RestaurantCard(
      {this.name,
      this.location,
      this.cuisine,
      this.imageSource,
      this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, '/restaurantDishes', arguments: restaurant)
      },
      splashColor: kBackground,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kBackground,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 120,
                  // height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Image(
                    image: NetworkImage(imageSource!),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      cuisine!,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      location!,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
