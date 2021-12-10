// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import '../cards/carousel_card.dart';
import '../models/carousel_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselList extends StatefulWidget {
  final List<CarouselModel> cards;
  int currentIndex = 0;
  CarouselList({required this.cards});
  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.cards.map((e) {
            return CarouselCard(
              url: e.url,
              price: e.price,
              description: e.description,
            );
          }).toList(),
          options: CarouselOptions(
              height: 300,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  widget.currentIndex = index;
                });
              }),
        ),
        // AnimatedSmoothIndicator(
        //   activeIndex: widget.currentIndex,
        //   count: widget.cards.length,
        //   effect: WormEffect(),
        // ),
      ],
    );
    ;
  }
}
