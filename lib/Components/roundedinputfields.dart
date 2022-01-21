// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/Components/textfieldcontainer.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedInputFieldEmail extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputFieldEmail({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedInputFieldName extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputFieldName({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedInputFieldContact extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputFieldContact({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.phone,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
