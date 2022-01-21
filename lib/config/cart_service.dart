// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/models/dish_model.dart';

import 'package:get/get.dart';

class CartService extends GetxController {
  var cart = {}.obs;
  void addProduct(DishModel dish) {
    if (cart.containsKey(dish)) {
      cart[dish] += 1;
    } else {
      cart[dish] = 1;
    }
  }
}
