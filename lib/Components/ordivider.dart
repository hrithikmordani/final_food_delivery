// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18),
      width: size.width * 0.7,
      child: Row(
        children: [
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          buildDivider()
        ],
      ),
    );
  }

  Expanded buildDivider() => Expanded(
        child: Divider(
          color: Colors.black,
          height: 1.5,
        ),
      );
}
