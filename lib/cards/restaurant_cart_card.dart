// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RestaurantCartCard extends StatelessWidget {
  String? url;
  String? name;
  String? location;
  RestaurantCartCard({this.url, this.name, this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 120,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Image(
            image: NetworkImage(url!),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                location!,
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
            ],
          ),
        )
      ],
    );
  }
}
