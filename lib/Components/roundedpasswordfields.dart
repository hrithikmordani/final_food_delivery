// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/Components/textfieldcontainer.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.black),
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.black,
          ),
          border: InputBorder.none),
    ));
  }
}
