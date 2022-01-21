// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CartScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackground,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
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
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Red Velvet Pastry',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                          Text(
                            '1',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add))
                        ],
                      ),
                    ),
                    Text(
                      'Rs 150',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Blueberry Cupcake',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                          Text(
                            '1',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add))
                        ],
                      ),
                    ),
                    Text(
                      'Rs 200',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 20,
                color: kBackground,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tip your hunger saviour',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Thank your delivery partner by leaving them a tip.',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '100% of the tip will go to delivery partner,',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('20',
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('30',
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('50',
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 20,
                color: kBackground,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bill Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Item Total',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          'Rs 350',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery Fee',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                            Text(
                              'Used towards paying the delivery partner',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          'Rs 30',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Taxes and Charges',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        Text(
                          'Rs 25',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'To Pay',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs 405',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 20,
                      color: kBackground,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deliver to Home-Yari Road',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    'Andheri West, Mumbai',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: kPrimaryColor,
                              child: Center(
                                child: Text(
                                  'MAKE PAYMENT',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
