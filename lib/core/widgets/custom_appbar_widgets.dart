import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../console_utils.dart';
import '../constants/constants.dart';




class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key,
    this.shareButtonTapped,
    required this.title,
    this.backButtonTapped,
    required this.imgName,
    required this.is_title_image,
    this.textColor,
    this.type,
    this.showShareOnRight}) : super(key: key);

   String? type;
  final String title;
  final String imgName;
  bool is_title_image;
  Color? textColor;
  bool? showShareOnRight;
  final Function? backButtonTapped;
  final Function? shareButtonTapped;

  @override
  _CustomAppBar createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(
                'Credit Analysis Report',
                style: TextStyle(fontSize: 18,
                  color: Color.fromRGBO(40, 44, 53, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500 ,
                ),
              ),
            ),
            Row(
              children: [
                Container(

                  child: Text(
                    'Powered by',
                    style: TextStyle(fontSize: 16,
                      color: Color.fromRGBO(113, 117, 124, 1),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400 ,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,top: 4),
                  child: CachedNetworkImage(
                    imageUrl: "", // Add your image URL here
                    errorWidget:(context, url, error) => Image.asset(
                      'assets/images/credit_analsis.png',
                      width: 60,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        leading: Container(
          margin: EdgeInsets.only(top: 20,left: 5),
          child: IconButton(
            alignment: Alignment.topLeft,
            icon: Icon(Icons.arrow_back_outlined,
              color:Color.fromRGBO(40, 44, 53, 1),
            ), onPressed: () {  },
          ),
        ),

      ),


    );

  }


}
