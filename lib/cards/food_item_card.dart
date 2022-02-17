// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print

import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/config/cart_service.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:final_food_delivery/models/dish_model.dart';
import 'package:final_food_delivery/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FoodItemCard extends StatelessWidget {
  final cartService = Get.put(CartService());
  DishModel? dish;

  RestaurantModel? restaurant;
  List<dynamic>? dishesmap;
  FoodItemCard({this.dish, this.restaurant, this.dishesmap});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    String userId = authService.getUserId();
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
                onPressed: () async {
                  restaurant!.dishes = dishesmap;
                  dynamic restaurantmap = restaurant!.toMap();

                  final data = await authService.getData(userId);

                  print(data['restaurant'].length);
                  if (data['restaurant'].length > 0) {
                    if (data['restaurant'][0]['name'] ==
                        restaurantmap['name']) {
                      print('I am here 1');
                      final addedCart = cartService.addProduct(
                          dish!, data['cart'], data['cartList'], userId);
                      print(addedCart);
                      await authService.addToCartInDatabase(
                          addedCart['cart'], addedCart['cartList'], userId);
                    } else {
                      print('I am here 2');
                      Fluttertoast.showToast(
                          msg:
                              'You can only order from 1 restaurant at a time. Cart cleared');

                      final addedCart =
                          cartService.addProduct(dish!, {}, [], userId);
                      print(addedCart);
                      await authService.addToCartInDatabaseWithRestaurant(
                          addedCart['cart'],
                          addedCart['cartList'],
                          userId,
                          [restaurantmap]);
                    }
                  } else {
                    print('i AM HERE 3');
                    final addedCart = cartService.addProduct(
                        dish!, data['cart'], data['cartList'], userId);
                    print(addedCart);
                    await authService.addToCartInDatabaseWithRestaurant(
                        addedCart['cart'],
                        addedCart['cartList'],
                        userId,
                        [restaurantmap]);
                  }

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
