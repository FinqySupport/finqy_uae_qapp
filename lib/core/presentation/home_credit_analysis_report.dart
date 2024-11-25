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
import 'package:q_app/core/presentation/signup_screen.dart';
import 'package:q_app/core/presentation/upload_aecb_report.dart';

import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'otp_verification.dart';



class HomeCreditAnalysisReport extends StatefulWidget {
  HomeCreditAnalysisReport({Key? key}) : super(key: key);

  @override
  _HomeCreditAnalysisReport createState() => _HomeCreditAnalysisReport();
}
class _HomeCreditAnalysisReport extends State<HomeCreditAnalysisReport>with SingleTickerProviderStateMixin {



  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 3, vsync: this);
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

  Widget getBody() {
    List<Map<String, dynamic>> faqdaat = [
      {
        'title': 'Gives Personalized recommendations',
        'description': 'Description for slide 1',
      },
      {
        'title': 'Easy to use',
        'description': 'Description for slide 2',
        'image ': 'assets/images/product2.png',
      },
      {
        'title': 'Easy to navigate',
        'description': 'Description for slide 3',
      },
      // Add more items as needed
    ];
    return  SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                width: MediaQuery.of(context).size.width, // Match parent width
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Products',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Loan\nInstitution',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sanction/\nCredit Limit',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'EMI',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Paid\nPrinciple',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(113, 117, 124, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: faqdaat.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 20, right: 10, bottom: 5,left: 2),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.white,

                        child: Container(
                          margin: const EdgeInsets.only(top: 5, left: 20),
                          child: const Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'Credit\nCard',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(40, 44, 53, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Emirated\nNBD Bank',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(40, 44, 53, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '100000',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(40, 44, 53, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '649',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(40, 44, 53, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '31.4',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(40, 44, 53, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                '11308',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(40, 44, 53, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              Container(
                width: 224,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(8), // Add padding here
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(41, 80, 237, 1), // Change color as needed
                    width: 1,
                  ),
                ),
                child:  Center( // Center the text
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: CachedNetworkImage(
                          imageUrl: "", // Add your image URL here
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/upload.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        'Download full report',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(41, 80, 237, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center, // Center align the text
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }



}

