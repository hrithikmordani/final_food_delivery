// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class PaymentGateway extends StatefulWidget {
  static const String routeName = '/paymentGateway';
  static Route route({required num cost}) {
    return MaterialPageRoute(
        builder: (_) => PaymentGateway(
              cost: cost,
            ),
        settings: RouteSettings(name: routeName));
  }

  num? cost;
  PaymentGateway({this.cost});

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.cost.toString()),
        ),
      ),
    );
  }
}
