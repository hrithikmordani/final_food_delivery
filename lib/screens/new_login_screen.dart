// ignore_for_file: unnecessary_new, unused_field, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_element, sized_box_for_whitespace, empty_catches

import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreenNew extends StatefulWidget {
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LoginScreenNew(),
        settings: RouteSettings(name: routeName));
  }

  const LoginScreenNew({Key? key}) : super(key: key);

  @override
  _LoginScreenNewState createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    final emailField = TextFormField(
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
    final passwordField = TextFormField(
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password");
        }
      },
      autofocus: false,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
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
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      emailField,
                      SizedBox(
                        height: 20,
                      ),
                      passwordField,
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                        onTap: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                        if (_formKey.currentState!.validate()) {
                          try {
                            await authService.signInWithEmailAndPassword(
                                emailController.text, passwordController.text);
                            Fluttertoast.showToast(msg: 'Login Successful');
                            Navigator.pushNamed(context, '/');
                          } catch (e) {
                            Fluttertoast.showToast(msg: e.toString());
                          }
                        }
                      },
                      child: Text('LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 15))),
                ),
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
                    Navigator.pushNamed(context, '/SignUp');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
