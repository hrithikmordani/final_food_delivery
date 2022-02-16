// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  String? itemName;
  num? quantity;
  CartItemCard({this.itemName, this.quantity});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userId = authService.getUserId();
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            child: Text(
              itemName!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () async {
                      final data = await authService.getData(userId);
                      authService.removeFromDatabase(
                          data['cart'], data['cartList'], itemName, userId);
                    },
                    icon: Icon(Icons.remove)),
                Text(
                  quantity!.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                    onPressed: () async {
                      final data = await authService.getData(userId);
                      authService.increaseQuantity(
                          data['cart'], userId, itemName);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ),
          Container(
            child: Text(
              'Rs 150',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
