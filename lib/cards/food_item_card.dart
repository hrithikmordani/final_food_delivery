// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
