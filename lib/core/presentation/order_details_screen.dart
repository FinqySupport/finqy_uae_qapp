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
import 'package:q_app/core/presentation/offer_product_tab.dart';
import 'package:q_app/core/presentation/signup_screen.dart';

import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'my_order_tab.dart';
import 'otp_verification.dart';

class OrderDetailsScreen extends StatefulWidget
{
  OrderDetailsScreen({Key? key}) : super(key: key);
  @override
  _OrderDetailsScreen createState() => _OrderDetailsScreen();
}
class _OrderDetailsScreen extends State<OrderDetailsScreen>with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int currentIndex=0;
  final _selectedColor = Color(0xff1a73e8);
  final _tabs = [
    Tab(text: 'Offers'),
    Tab(text: 'My orders'),


  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }

  @override
  void dispose() {
    // Dispose the TabController to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
         resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: const Text(
                'Progress',
                style: TextStyle(fontSize: 18,
                  color: Color.fromRGBO(40, 44, 53, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500 ,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: const Text(
                '',
                style: TextStyle(fontSize: 18,
                  color: Color.fromRGBO(40, 44, 53, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500 ,
                ),
              ),
            ),

          ],
        ),
        leading: Container(
          margin: const EdgeInsets.only(top: 20,left: 5),
          child: IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.arrow_back_outlined,
              color:Color.fromRGBO(40, 44, 53, 1),
            ), onPressed: () {
            Navigator.of(context).pop();
          },
          ),
        ),

      ),



        body:getBody(),

    );
  }

  Widget getBody()
  {
    List<Map<String, dynamic>> application_status_array = [
      {
        'name': 'Applied',
        'description': 'Description for slide 1',
        'color ': '#008000',

      },
      {
        'name': 'In review',
        'description': 'Description for slide 2',
        'color ': '#008000',

      },
      {
        'name': 'Login',
        'description': 'Description for slide 3',
        'color ': '#008000',

      },
      {
        'name': 'Disbursed',
        'description': 'Description for slide 3',
        'color ': '#008000',

      },
      // Add more items as needed
    ];
    return Container(

      color: Color.fromRGBO(250, 251, 252, 1),
      child: SingleChildScrollView
        (
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              'Order #1 - ',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(40, 44, 53, 1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500 ,

              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container
                (
                margin: const EdgeInsets.all(20),
                child: const Row(

                  children: [
                    Text(
                      'Name   :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,

                      ),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,

                      ),
                    ),
                  ],
                ),
                ),
              Container
                (
                margin: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Text(
                      'Number   :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,

                      ),
                    ),
                    Text(
                      '+971- 54 597 8651',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,

                      ),
                    ),
                  ],
                ),
              ),
              Container
                (
                margin: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Text(
                      'Applied for   :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,

                      ),
                    ),
                    Text(
                      'AED 1,00,000 Auto Loan ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,

                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  'Progress',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(113, 117, 124, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500 ,

                  ),
                ),
              ),

              Container(
                height: application_status_array.length*57,
                margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                //color: Colors.blue.withOpacity(0.1),
                child:ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: application_status_array.length,
                  itemBuilder: (context, index) {
                    final statusItem=application_status_array[index];
                    final color='${statusItem['color']}';
                    return index != 0
                        ? Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        Column(
                          children: List.generate(
                            1,
                                (ii) => Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 0, top: 0, bottom: 0),
                                child: Container(
                                  height: 30,
                                  width: 2,
                                  color: Color.fromRGBO(0, 128, 0,1),
                                )),
                          ),
                        ),

                      ]),
                      Row(children: [
                        Icon(Icons.check_circle, color:Color.fromRGBO(0, 128, 0,1)),
                        SizedBox(width: 20,),
                        Text(statusItem['name'],
                          style: TextStyle(
                              color: Color.fromRGBO(30, 30, 30, 1),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0),
                        )
                      ])
                    ])
                        : Row(
                        children: [
                          Icon(Icons.check_circle, color:Color.fromRGBO(0, 128, 0,1)),
                          SizedBox(width: 20,),
                          Text(statusItem['name'],
                            style: TextStyle(
                                color: Color.fromRGBO(30, 30, 30, 1),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0),
                          )
                        ]);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(235, 235, 235, 1), // Set the border color
                    width: 1, // Set the border width
                  ),
                  color: Colors.white, // Set main container background color
                  borderRadius: BorderRadius.circular(12), // Set main container border radius
                ),
                // Adding padding for spacing
                child:  Stack(
                  children:
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('Need help with your\norder?',
                                style: TextStyle(
                                    color: Color.fromRGBO(30, 30, 30, 1),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),),
                              const Text(' ',
                                style: TextStyle(
                                    color: Color.fromRGBO(113, 117, 124, 1),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0),),
                              const Text('',
                                style: TextStyle(
                                    color: Color.fromRGBO(113, 117, 124, 1),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0),),
                              Container(
                                height: 44,
                                margin:  const EdgeInsets.only(top: 10),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: const Color.fromRGBO(41, 80, 237, 1),
                                  margin:  const EdgeInsets.symmetric(horizontal: 20.0),
                                  child:  const Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 22.0,right: 22.0), // Adjust left padding as needed
                                      child: Text('Chat with us', // Use the data from the list
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), // Centered text
                        Image.asset('assets/images/pose_support.png', height: 160, width: 110), // Leght icon
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/support_bg.png', // Path to your background image
                        height: 125, // Set the height of the image
                        fit: BoxFit.cover, // Adjust the fit as per your requirement
                      ),
                    ),
                  ],
                ),
              )



            ],
          ),





        ],
      )
      ),
    );
  }



}

