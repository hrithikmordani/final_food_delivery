// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:final_food_delivery/cards/cart_item_card.dart';
import 'package:final_food_delivery/cards/restaurant_cart_card.dart';
import 'package:final_food_delivery/combined_widget/cart_items.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:provider/provider.dart';

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
  var tip20 = false;
  var tip50 = false;
  var tip30 = false;
  num? tipcost = 0;
  num deliverycost = 60;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userId = authService.getUserId();

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: Text('Loading'),
              ),
            );
          }
          final Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data['cartList'].length > 0) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: kBackground,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              body: Container(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        RestaurantCartCard(
                          url: data['restaurant'][0]['imageSource'],
                          name: data['restaurant'][0]['name'],
                          location: data['restaurant'][0]['location'],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CartItems(),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Thank your delivery partner by leaving them a tip.',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '100% of the tip will go to delivery partner,',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (tip20 == true) {
                                              tipcost = 0;
                                            }
                                            tip20 = !tip20;
                                            if (tip20 == true) {
                                              tipcost = 20;
                                            }

                                            tip30 = false;
                                            tip50 = false;
                                          });
                                        },
                                        child: Text('20',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        style: ElevatedButton.styleFrom(
                                            primary: tip20
                                                ? Colors.yellow
                                                : Colors.white),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (tip30 == true) {
                                              tipcost = 0;
                                            }
                                            tip30 = !tip30;
                                            if (tip30 == true) {
                                              tipcost = 30;
                                            }
                                            tip50 = false;
                                            tip20 = false;
                                          });
                                        },
                                        child: Text('30',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        style: ElevatedButton.styleFrom(
                                            primary: tip30
                                                ? Colors.yellow
                                                : Colors.white),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (tip50 == true) {
                                              tipcost = 0;
                                            }
                                            tip50 = !tip50;
                                            if (tip50 == true) {
                                              tipcost = 50;
                                            }
                                            tip20 = false;
                                            tip30 = false;
                                          });
                                        },
                                        child: Text('50',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        style: ElevatedButton.styleFrom(
                                            primary: tip50
                                                ? Colors.yellow
                                                : Colors.white),
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
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item Total',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  Text(
                                    data['cartCost']
                                        .values
                                        .reduce((sum, element) => sum + element)
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery Fee',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue),
                                      ),
                                      Text(
                                        'Used towards paying the delivery partner',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Rs 60',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Taxes and Charges',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                  Text(
                                    (0.1 *
                                            data['cartCost'].values.reduce(
                                                (sum, element) =>
                                                    sum + element))
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tip',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                  Text(
                                    'Rs ' + tipcost.toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'To Pay',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    (deliverycost +
                                            tipcost! +
                                            (0.1 *
                                                data['cartCost'].values.reduce(
                                                    (sum, element) =>
                                                        sum + element)) +
                                            data['cartCost'].values.reduce(
                                                (sum, element) =>
                                                    sum + element))
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  fontSize: 14,
                                                  color: Colors.grey),
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
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Text('No items in cart'),
            ),
          );
        });
  }
}
