// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/screens/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(color: kPrimaryLightColor),
      child: child,
    );
  }
}
