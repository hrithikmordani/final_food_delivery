// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Icon(Icons.home, size: 25),
          ),
          Container(
            child: Icon(Icons.shopping_basket_rounded, size: 25),
          ),
          Container(
            child: Icon(Icons.person, size: 25),
          ),
        ],
      ),
      // padding: EdgeInsets.all(50),
      // margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
      height: 50,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor),
    );
  }
}
