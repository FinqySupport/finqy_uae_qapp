import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../presentation/profile_screen.dart';

class ProfileIconWidget extends StatefulWidget {

  ProfileIconWidget({Key? key,

    this.hexColor,


  }) : super(key: key);



  final String? hexColor;


  @override
  _ProfileIconWidget createState() => _ProfileIconWidget();
}

class _ProfileIconWidget extends State<ProfileIconWidget> {


  @override
  void initState() {
    super.initState();


  }





  @override
  Widget build(BuildContext context) {
  // ConsoleLogUtils.printLog('nananna ${widget.itemData['show_admin_badge']}');
    return Container(
      //margin: EdgeInsets.only(top: 5),
      child:GestureDetector(
        onTap: () async
        {

          if (Platform.isIOS) {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) =>
                  ProfileScreen()
              ),
            );
          }
          else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ProfileScreen()),
            );
          }
       },
        child:
        SizedBox(
          width: 40,
          height: 40,
          child:
          ClipOval(
            child: Material(
              color: Color.fromRGBO(66, 102, 247, 1),//Color.fromRGBO(248, 169, 15, 1),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text("AA",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ), // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }


}
