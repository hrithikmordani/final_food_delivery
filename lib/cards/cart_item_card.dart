// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Red Velvet Pastry',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                Text(
                  '1',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add))
              ],
            ),
          ),
          Text(
            'Rs 150',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
