// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:final_food_delivery/Components/alreadyhaveanaccountcheck.dart';
import 'package:final_food_delivery/Components/background.dart';
import 'package:final_food_delivery/Components/roundedinputfields.dart';
import 'package:final_food_delivery/Components/roundedpasswordfields.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:final_food_delivery/screens/forgot_password.dart';
import 'package:final_food_delivery/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  String? semail;
  String? spassword;
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LoginScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 70,
              ),
              Image(
                  height: 200,
                  width: 200,
                  image: NetworkImage(
                      'https://wallpaperaccess.com/full/629233.jpg')),
              SizedBox(
                height: 20,
              ),

              Text(
                "Home Food Delivered to your doorstep",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kPrimaryColor),
              ),
              SizedBox(
                width: 100,
                height: 50,
              ),
              //Image.asset("assets/images/foodimages.jpg",height: size.height * 0.45,),
              RoundedInputFieldEmail(
                  hintText: "Email",
                  onChanged: (value) {
                    semail = value;
                  }),
              RoundedPasswordField(
                onChanged: (value) {
                  print(semail);
                  spassword = value;
                },
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            // decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordScreen()));
                        }),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //     child: Text(
              //       'Don\'t have an account? Sign up ',
              //       textAlign: TextAlign.left,
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 14,
              //         // decoration: TextDecoration.underline,
              //         decorationThickness: 1,
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => SignUpScreen()));
              //     }),

              SizedBox(
                width: 100,
                height: 10,
              ),

              Container(
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () async {
                        await authService.signInWithEmailAndPassword(
                            semail!, spassword!);
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text('LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 15))),
                ),
              ),
              SizedBox(
                width: 100,
                height: 18,
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
              SizedBox(height: 25),
              GestureDetector(
                  child: Text(
                    'Don\'t have an account? Sign up ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      // decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
