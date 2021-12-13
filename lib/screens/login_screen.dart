import 'package:final_food_delivery/Components/alreadyhaveanaccountcheck.dart';
import 'package:final_food_delivery/Components/background.dart';
import 'package:final_food_delivery/Components/roundedinputfields.dart';
import 'package:final_food_delivery/Components/roundedpasswordfields.dart';
import 'package:final_food_delivery/constants/colors.dart';
import 'package:final_food_delivery/screens/forgot_password.dart';
import 'package:final_food_delivery/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 70,
              ),

              Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              SizedBox(
                width: 100,
                height: 50,
              ),
              //Image.asset("assets/images/foodimages.jpg",height: size.height * 0.45,),
              RoundedInputFieldEmail(hintText: "Email", onChanged: (value) {}),
              RoundedPasswordField(
                onChanged: (value) {},
              ),

              GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  }),

              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  child: Text(
                    'Don\'t have an account? Sign up ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  }),

              SizedBox(
                width: 100,
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
                      onPressed: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
