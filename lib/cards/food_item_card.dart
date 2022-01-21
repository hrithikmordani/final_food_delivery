// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:final_food_delivery/config/cart_service.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:final_food_delivery/models/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodItemCard extends StatelessWidget {
  final cartService = Get.put(CartService());
  DishModel? dish;
  FoodItemCard({this.dish});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                Text(
                  dish!.dishName!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dish!.dishContents!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              dish!.dishCost!.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                onPressed: () {
                  cartService.addProduct(dish!);
                  Navigator.pushNamed(context, '/cart');
                },
                icon: Icon(Icons.add_circle),
                iconSize: 30,
                color: kPrimaryColor)
          ]),
          // margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.all(
            //   Radius.circular(10),
            // ),
          ),
        ),
        Container(
          height: 1,
          color: kPrimaryColor,
          margin: EdgeInsets.all(10),
        )
      ],
    );
  }
}
