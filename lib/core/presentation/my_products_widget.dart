
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../console_utils.dart';
import '../constants/constants.dart';


class MyProductsWidget extends StatefulWidget {
  MyProductsWidget({Key? key, required this.sliderData}) : super(key: key);
 final List<dynamic> sliderData;

  @override
  _MyProductsWidgetState createState() => _MyProductsWidgetState();
}

class _MyProductsWidgetState extends State<MyProductsWidget> {
  final List<String> sliderData = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width, // Set width to match screen width
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sliderData.length,
          itemBuilder: (context, index) {
            return
              Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Card(
                color: Colors.blue,
                child: Container(
                  child: Center(
                    child: Text(
                      sliderData[index].toString(), // Use the data from the list
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
