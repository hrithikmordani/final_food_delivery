// ignore_for_file: prefer_const_constructors

import 'package:final_food_delivery/config/auth_service.dart';
import 'package:final_food_delivery/screens/restaurant_screen.dart';

import 'package:final_food_delivery/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'HARV',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: Wrapper.routeName,
      ),
    );
  }
}
