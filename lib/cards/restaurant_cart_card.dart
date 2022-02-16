// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RestaurantCartCard extends StatelessWidget {
  const RestaurantCartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 120,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Image(
            image: NetworkImage(
                'https://b.zmtcdn.com/data/pictures/6/19719926/359745c22c6a159f70c09ea5df4b874e_o2_featured_v2.jpg?output-format=webp'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vikram Brownies',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Thane, Maharashtra',
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
            ],
          ),
        )
      ],
    );
  }
}
