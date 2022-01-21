// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:final_food_delivery/combined_widget/custom_bottom_navigation_bar.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => AccountScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      // body: Padding(
      //   padding: const EdgeInsets.only(top: 0),
      //   child: Text(
      //     'Hello',
      //     style: TextStyle(fontSize: 24),
      //   ),
      // )
      body: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'HRITHIK MORDANI',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'EDIT',
                    style: TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Text(
              '+91 8652751842',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'hrithikmordani123@gmail.com',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: kPrimaryColor, width: 2))),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'PAST ORDERS',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                  )
                ],
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 1.2))),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'HELP',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 25,
                  )
                ],
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 1.2))),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 25,
                  )
                ],
              ),
              onPressed: () {
                authService.signOut();
                Navigator.pushNamed(context, '/');
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 1.2))),
            ),
          ],
        ),
      ),
    );
  }
}
