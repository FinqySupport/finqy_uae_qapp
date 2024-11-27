import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'recommendation_list.dart';
import 'foir_analysis_report.dart';
import 'home_credit_analysis_report.dart';
import 'otp_verification.dart';



class CreditAnalysisReport extends StatefulWidget
{
  CreditAnalysisReport({Key? key}) : super(key: key);

  @override
  _CreditAnalysisReport createState() => _CreditAnalysisReport();
}
class _CreditAnalysisReport extends State<CreditAnalysisReport>with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int currentIndex=0;
  final _selectedColor = const Color(0xff1a73e8);
  final _tabs = [
    const Tab(text: 'Credit Analysis'),
    const Tab(text: 'Recommendation'),
    const Tab(text: 'Eligibility Analysis'),

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
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: const Text(
                'Q Recommendation Report',
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
          margin: const EdgeInsets.only(top: 16,left: 0),
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
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromRGBO(51, 184, 255, 1.0),
                      Color.fromRGBO(145, 0, 224, 1),
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child:  Image.asset('assets/images/report_bg.png', height: 261, width: 259),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24,top: 50),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Here’s your Personalised',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Q Recommendations',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 3),

                  ],
                ),
              ),

            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: const Color.fromRGBO(193, 199, 208, 0.4), // Border color
                    width: 1.0, // Border width
                  ),
                ),
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                constraints: BoxConstraints(
                  minHeight: 60, // Ensure the container is at least 65 pixels tall
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab, // Indicator spans full width of tab
                  dividerColor: Colors.transparent, // Remove the divider line
                  isScrollable: true, // Allow tabs to start from the left
                  padding: const EdgeInsets.symmetric(vertical: 6),
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
                    RecommendationList(download: true,),
                    FoirAnalysisReport(),
                    // Add more TabBarView children as needed
                  ],
                ),
              ),
            ],
          )

        ],
      ),
    );
  }

}

