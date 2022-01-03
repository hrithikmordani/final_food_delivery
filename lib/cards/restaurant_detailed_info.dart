// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class RestaurantDetailedInfo extends StatelessWidget {
  const RestaurantDetailedInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ritayu Frankie',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'Indian, Chinese',
            style: TextStyle(fontSize: 18, color: kPrimaryColor),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'Malad West, Mumbai',
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          SizedBox(
            height: 25,
          ),
          DottedLine(),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, size: 20),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '500+ Ratings',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '40 MINS',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Delivery Time',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '\$15',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '\$15 for two',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          // SizedBox(
          //   height: 25,
          // ),
          // DottedLine(),
          SizedBox(height: 20),
        ],
      ),
      // margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 25),
    );
  }
}
