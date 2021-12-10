// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:final_food_delivery/combined_widget/carousel_list.dart';
import 'package:final_food_delivery/combined_widget/restaurant_list.dart';
import 'package:final_food_delivery/models/carousel_model.dart';
import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../constants/colors.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  int currentIndex = 0;
  final List<CarouselModel> cards = [
    CarouselModel(
        price: '\$15',
        description: 'Two slices of Pizza with delicious Salami',
        url:
            'https://b.zmtcdn.com/data/o2_assets/d0bd7c9405ac87f6aa65e31fe55800941632716575.png'),
    CarouselModel(
        price: '\$15',
        description: 'Delicious Cheese Pav Bhaji garlished with Onions',
        url:
            'https://i0.wp.com/healthyvegrecipes.com/wp-content/uploads/2016/08/pb1.jpg'),
  ];
  final List<RestaurantModel> restaurants = [
    RestaurantModel(
      name: "Vikram's Brownies",
      cuisine: 'Brownies, Cakes & Pastries',
      location: 'Thane, Maharahtra',
      imageSource:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ2Ysubs12nHcFd7mezHzoeb7-bOA4zwvGVQ&usqp=CAU',
    ),
    RestaurantModel(
      name: "Alekhya's Home Kitchen",
      location: 'Andheri West, Mumbai',
      cuisine: 'South Indian',
      imageSource:
          'https://b.zmtcdn.com/data/pictures/6/19719926/359745c22c6a159f70c09ea5df4b874e_o2_featured_v2.jpg?output-format=webp',
    ),
    RestaurantModel(
      name: 'Hrithik Momos',
      location: 'Goregaon West, Mumbai',
      cuisine: 'Nepalese',
      imageSource:
          'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/qumer4ntqsvvoymfmj4q',
    ),
    RestaurantModel(
      name: 'Ritayu Frankie',
      location: 'Malad West, Mumbai',
      cuisine: 'Fast food, Snacks',
      imageSource:
          'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/roi1brhsdccb0rqlun0z',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.location_on,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          'Home-Yari Road, Andheri West',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.grey.withOpacity(0.32),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
                hintText: 'Restaurant name, cuisine, or a dish...',
              ),
            ),
          ),
          CarouselList(cards: cards),
          RestaurantList(
            restaurants: restaurants,
          ),
        ],
      ),
    );
  }
}
