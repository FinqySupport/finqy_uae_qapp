import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:q_app/core/presentation/order_details_screen.dart';
import 'package:q_app/core/presentation/signup_screen.dart';
import 'package:q_app/core/presentation/upload_aecb_report.dart';

import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'home_credit_analysis_report.dart';
import 'otp_verification.dart';


class MyOrderTab extends StatefulWidget {
  MyOrderTab({Key? key}) : super(key: key);

  @override
  _MyOrderTab createState() => _MyOrderTab();
}
class _MyOrderTab extends State<MyOrderTab>with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> loanappdaat = [
    {
      'title': 'Order #1',
      'description': 'Description for slide 1',
    },
    {
      'title': 'Order #2',
      'description': 'Description for slide 2',
      'image ': 'assets/images/product2.png',
    },
    {
      'title': 'Order #3',
      'description': 'Description for slide 3',
    },
    // Add more items as needed
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the TabController to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(250, 251, 252, 1),

      body:getBody(),
  

    );
  }

  Widget getBody()
  {
    return  SingleChildScrollView(
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: loanappdaat.length,
          itemBuilder: (context, index) {
            // Add spacing between images
            return
              GestureDetector(
                onTap: () {
                  if (Platform.isIOS) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) =>
                           OrderDetailsScreen()
                      ),
                    );
                  }
                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          OrderDetailsScreen()),
                    );
                  }
                  // Your onTap logic here
                },
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0), // Adjust left padding as needed
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align text vertically with the start of the line
                          children: [
                            Text(
                              loanappdaat[index]['title'], // Use the data from the list
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(30, 30, 30, 1),
                                fontSize: 16.0,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top:1,right: 10),
                                    child: Image.asset('assets/images/round_btn.png', height: 24, width: 24), //,
                                  )
                                ],
                              ),
                            ),
                          ],
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

