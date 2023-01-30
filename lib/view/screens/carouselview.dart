import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CarouselView extends StatefulWidget {
  const CarouselView({super.key});

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> akash =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List photo = akash['more'];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          akash['name'],
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: photo
                .map(
                  (e) => Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(e),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              
              autoPlay: true,
              height: 250,
              viewportFraction: 0.7,
              autoPlayCurve: Curves.easeInBack,
              enlargeCenterPage: true,
            ),
          ),

        ],
      ),
    );
  }
}