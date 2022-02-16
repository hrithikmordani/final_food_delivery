// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors

import 'package:final_food_delivery/cards/cart_item_card.dart';
import 'package:final_food_delivery/cards/food_item_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:provider/provider.dart';

class CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userId = authService.getUserId();
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading'),
            );
          }
          final Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data['cartList'].length > 0) {
            print(data['cartList']);
            return Column(
              children: data['cartList'].map<Widget>((item) {
                return CartItemCard(
                  itemName: item,
                  quantity: data['cart'][item],
                );
              }).toList(),
            );
          }
          return Center(
            child: Text('No items in cart'),
          );
        });
  }
}
