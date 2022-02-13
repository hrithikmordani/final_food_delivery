// ignore_for_file: prefer_const_constructors, unused_field, unnecessary_new, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:final_food_delivery/Components/ordivider.dart';
import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class RegistrationScreenNew extends StatefulWidget {
  static const String routeName = '/SignUp';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => RegistrationScreenNew(),
        settings: RouteSettings(name: routeName));
  }

  const RegistrationScreenNew({Key? key}) : super(key: key);

  @override
  _RegistrationScreenNewState createState() => _RegistrationScreenNewState();
}

class _RegistrationScreenNewState extends State<RegistrationScreenNew> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController contactController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    final confirmPasswordField = TextFormField(
      autofocus: false,
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return "Password don't match";
        }
        return null;
      },
      controller: confirmPasswordController,
      obscureText: false,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Confirm Passowrd',
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
    final contactField = TextFormField(
      autofocus: false,
      controller: contactController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        contactController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Contact',
        prefixIcon: Icon(Icons.phone),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
    final nameField = TextFormField(
      autofocus: false,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      controller: nameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Name',
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
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
                    height: 20,
                  ),
                  nameField,
                  SizedBox(
                    height: 20,
                  ),
                  contactField,
                  SizedBox(
                    height: 20,
                  ),
                  emailField,
                  SizedBox(
                    height: 20,
                  ),
                  passwordField,
                  SizedBox(
                    height: 20,
                  ),
                  confirmPasswordField,
                  SizedBox(
                    height: 30,
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
                            await authService.createUserWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                                contactController.text,
                                nameController.text);

                            Navigator.pushNamed(context, '/login');
                          }
                        },
                        child: Text('SIGN UP',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
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
                        Navigator.pushNamed(context, '/login');
                      }),
                  SizedBox(
                    width: 50,
                    height: 20,
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
          )),
    );
  }
}
