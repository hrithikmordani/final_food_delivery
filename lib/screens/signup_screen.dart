// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:final_food_delivery/Components/alreadyhaveanaccountcheck.dart';
import 'package:final_food_delivery/Components/background.dart';
import 'package:final_food_delivery/Components/ordivider.dart';
import 'package:final_food_delivery/Components/roundedinputfields.dart';
import 'package:final_food_delivery/Components/roundedpasswordfields.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:final_food_delivery/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/SignUp';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => SignUpScreen(),
        settings: RouteSettings(name: routeName));
  }

  String? semail;
  String? spassword;
  static const IconData facebook =
      IconData(0xe255, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 40,
              ),
              Text(
                "SignUp",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
              SizedBox(
                width: 100,
                height: 20,
              ),
              RoundedInputFieldName(hintText: "Name", onChanged: (value) {}),
              RoundedInputFieldContact(
                  hintText: "Contact Number", onChanged: (value) {}),
              RoundedInputFieldEmail(
                  hintText: "Email",
                  onChanged: (value) {
                    semail = value;
                  }),
              RoundedPasswordField(onChanged: (value) {
                spassword = value;
              }),
              SizedBox(
                width: 100,
                height: 10,
              ),
              Container(
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: kPrimaryColor,
                    onPressed: () async {
                      await authService.createUserWithEmailAndPassword(
                          semail!, spassword!);
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('SIGN UP',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  child: Text(
                    'Already have an account? Login ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              SizedBox(
                width: 50,
                height: 20,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              OrDivider(),
              Column(
                children: [
                  SignInButton(
                    Buttons.Facebook,
                    //mini: true,
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Google,
                    //mini: true,
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
