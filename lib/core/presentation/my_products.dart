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
import 'loan_type_deatils.dart';
import 'my_order_tab.dart';
import 'otp_verification.dart';

class MyProducts extends StatefulWidget
{
  MyProducts({Key? key}) : super(key: key);
  @override
  _MyProducts createState() => _MyProducts();
}
class _MyProducts extends State<MyProducts>with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int currentIndex=0;
  final _selectedColor = const Color(0xff1a73e8);
  final _tabs = [
    const Tab(text: 'Offers'),
    const Tab(text: 'My orders'),


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
                'My Products',
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
         //   Navigator.of(context).pop();
          },
          ),
        ),

      ),



      body:getBody(),

    );
  }

  Widget getBody()
  {
    List<Map<String, dynamic>> sliderData = [
      {
        'title': 'Slide 1',
        'description': 'Description for slide 1',
        'image ': 'assets/images/product1.png',

      },
      {
        'title': 'Slide 2',
        'description': 'Description for slide 2',
        'image ': 'assets/images/product2.png',

      },
      {
        'title': 'Slide 3',
        'description': 'Description for slide 3',
        'image ': 'assets/images/product1.png',

      },
      {
        'title': 'Slide 3',
        'description': 'Description for slide 3',
        'image ': 'assets/images/product1.png',

      },
      // Add more items as needed
    ];
    return Container(
      color: const Color.fromRGBO(250, 251, 252, 1),
      child: SingleChildScrollView
        (
          child:  Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  width: MediaQuery.of(context).size.width, // Set width to match screen width
                  child:GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items in each row
                      crossAxisSpacing: 10.0, // Spacing between grid items horizontally
                      mainAxisSpacing: 10.0, // Spacing between grid items vertically
                    ),
                    itemCount: sliderData.length,
                    itemBuilder: (context, index)
                    {

                    // Add spacing between images
                    return GestureDetector(
                        onTap: ()
                        {
                          if(index == 0)
                          {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => LoanTypeDeatils(type: 'Credit', text: 'Best Credit Card Options for you',)),
                            );

                          }
                          else
                          {
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoanTypeDeatils(type: 'Personal Loan', text: 'Your personalized loan\n recommendations',)),
                          );

                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0), // Adjust spacing as needed
                          child:
                          Container(

                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: CachedNetworkImage(
                                imageUrl: "", // Add your image URL here
                                errorWidget: (context, url, error) => Image.asset(
                                  (index==0) ? 'assets/images/product1.png':  (index==1) ? 'assets/images/loan.png' :  (index==3) ? 'assets/images/auto_loan.png':'assets/images/mortagaes.png',
                                  width: 165,
                                  height: 176,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ));
                    },
                  )
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Color.fromRGBO(193, 199, 208, 0.4), // Border color
                    width: 1.0, // Border width
                  ),
                ),
                margin: EdgeInsets.only(left: 15, right: 10, top: 0),
                height: 60,
                child: TabBar(
                  padding: EdgeInsets.all(5),
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: _selectedColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab, // Indicator spans full width of label
                  labelColor: Colors.white,
                  dividerHeight: 0,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  unselectedLabelStyle: TextStyle(
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
                    OfferProductTab(),
                    MyOrderTab()
                    // Add more TabBarView children as needed
                  ],
                ),
              ),

            ],
          )
      ),
    );
  }



}

