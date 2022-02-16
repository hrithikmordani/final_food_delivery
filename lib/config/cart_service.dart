// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/models/dish_model.dart';

import 'package:get/get.dart';

class CartService extends GetxController {
  Map<String, dynamic> addProduct(DishModel dish, cart, cartList, userId) {
    if (cart.containsKey(dish.dishName)) {
      cart[dish.dishName] += 1;
    } else {
      cart[dish.dishName] = 1;
      cartList.add(dish.dishName);
    }
    return {'cart': cart, 'cartList': cartList};
  }
}
