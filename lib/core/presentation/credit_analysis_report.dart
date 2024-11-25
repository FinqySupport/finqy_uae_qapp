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
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'home_credit_analysis_report.dart';
import 'otp_verification.dart';



class CreditAnalysisReport extends StatefulWidget {
  CreditAnalysisReport({Key? key}) : super(key: key);

  @override
  _CreditAnalysisReport createState() => _CreditAnalysisReport();
}
class _CreditAnalysisReport extends State<CreditAnalysisReport>with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int currentIndex=0;
  final _selectedColor = const Color(0xff1a73e8);
  final _tabs = [
    const Tab(text: 'Home'),
    const Tab(text: 'Detailed Report'),
    const Tab(text: 'Credit Report'),

  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: const Text(
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

                  child: const Text(
                    'Powered by',
                    style: TextStyle(fontSize: 16,
                      color: Color.fromRGBO(113, 117, 124, 1),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400 ,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10,top: 4),
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

  Widget getBody() {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15,right: 15,bottom: 30,top: 30),
                padding:  EdgeInsets.only(top: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  color: Colors.white, // White background color
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(162, 165, 170, 0.1), // Shadow color
                      blurRadius: 20, // Spread radius
                      offset: Offset(0, 10), // Offset from the container
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Image.asset('assets/images/report_new.png',
                      height: 202,
                      width: 196,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 43,
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Poor\n",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(251, 33, 32, 1)
                                    ),
                                  ),
                                  TextSpan(
                                    text: "300-579",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(113, 117, 124, 1)
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 11),
                            child: SizedBox(
                              height: 31,
                              child: VerticalDivider(
                                width: 1,
                                thickness: 1,
                                endIndent: 3,
                              ),
                            ),
                          ),
                          Container(
                            width: 45,
                            margin: const EdgeInsets.only(left: 9),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Fair\n",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(253, 145, 82, 1)
                                    ),
                                  ),
                                  TextSpan(
                                    text: "580-669",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(113, 117, 124, 1)
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: 52,
                            margin: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 31,
                                  child: VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    endIndent: 3,
                                  ),
                                ),
                                Container(
                                  width: 42,
                                  margin: const EdgeInsets.only(left: 9),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Good\n",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(250, 204, 10, 1)
                                          ),
                                        ),
                                        TextSpan(
                                          text: "670-739",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(113, 117, 124, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 64,
                            margin: const EdgeInsets.only(left: 11),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 31,
                                  child: VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    endIndent: 3,
                                  ),
                                ),
                                Container(
                                  width: 54,
                                  margin: const EdgeInsets.only(left: 9),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Very Good\n",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(4, 153, 237, 1)
                                          ),
                                        ),
                                        TextSpan(
                                          text: "740-799",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(113, 117, 124, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 56,
                            margin: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 31,
                                  child: VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    endIndent: 3,
                                  ),
                                ),
                                Container(
                                  width: 46,
                                  margin: const EdgeInsets.only(left: 9),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Excellent\n",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(33, 221, 155, 1)
                                          ),
                                        ),
                                        TextSpan(
                                          text: "800-850",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(113, 117, 124, 1)
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: const Color.fromRGBO(193, 199, 208, 0.4), // Border color
                    width: 1.0, // Border width
                  ),
                ),
                margin: const EdgeInsets.only(left: 15, right: 10, top: 0),
                height: 60,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab, // Indicator spans full width of tab
                  dividerHeight: 0, // Remove the divider line
                  isScrollable: true, // Allow tabs to start from the left
                  padding: const EdgeInsets.all(10),
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: _selectedColor,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: _tabs,
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height - 45 - MediaQuery.of(context).padding.top,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeCreditAnalysisReport(),
                    Center(child: Container(child: const Text('Detailed Report'),)),
                    Center(child: Container(child: const Text('Credit Report'),)),
                    // Add more TabBarView children as needed
                         ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



}

