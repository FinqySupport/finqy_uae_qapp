
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';




class CustomHeaderInfoSignup extends StatefulWidget {
  CustomHeaderInfoSignup({Key? key, required this.title,required this.appbar,required this.subtitle, this.bgColor}) : super(key: key);
   String title;
  final String subtitle;
  final bool appbar;
  final Color? bgColor;

  @override
  _CustomHeaderInfo createState() => _CustomHeaderInfo();
}

class _CustomHeaderInfo extends State<CustomHeaderInfoSignup> {

  @override
  Widget build(BuildContext context) {
    //print("object:${widget.nameCircleWidth}");
    return Container(
      margin: EdgeInsets.only(
        bottom: 30,
        top: (widget.appbar) ? 10 : 80,
      ),
     // color: Colors.greenAccent,
     // height: 130,
      alignment: Alignment.center,

      child: Column(
       // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Spacer(),
          (widget.appbar)  ? SizedBox(height: 1):SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 16,right: 16), //apply padding to all four sides
            child: Align(
              alignment: Alignment.topLeft,
              child:AutoSizeText('${widget.title}',
                maxLines: 2,
                minFontSize: Platform.isIOS ? 23.0 : 20,
                maxFontSize: Platform.isIOS ? 23.0 : 20,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600 ,
                    fontSize: Platform.isIOS ? 23.0 : 20),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 16,right: 16,bottom: 8), //apply padding to all four sides
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('${widget.subtitle}',
                maxLines: 7,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight:(widget.appbar) ? FontWeight.w400 : FontWeight.normal ,

                    fontSize: 14.0),
              ),
            ),
          ),
          SizedBox(height: 10),

        ],
      ),
    );
  }
}
