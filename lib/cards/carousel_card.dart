// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, must_be_immutable, deprecated_member_use, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CarouselCard extends StatelessWidget {
  String? url;
  String? description;
  String? price;
  CarouselCard({this.url, this.description, this.price});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: kPrimaryColor,
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors: [Colors.lightBlue, Colors.blue[900]!]),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 145,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      description!,
                      style: TextStyle(
                        color: kBackground,
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('${price}'),
                      color: Colors.white,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        Positioned(
          top: 0,
          // ignore: prefer_const_constructors
          child: CircleAvatar(
            radius: 90,
            backgroundImage: NetworkImage(url!),
          ),
        ),
      ],
    );
  }
}
