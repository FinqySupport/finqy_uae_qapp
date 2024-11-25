

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../presentation/my_order_tab.dart';
import '../presentation/offer_product_tab.dart';
import '../widgets/reward_top_appba.dart';
import 'new_referral_screen.dart';




class Referral_Page extends StatefulWidget {
  const Referral_Page({Key? key}) : super(key: key);

  @override
  _Referral_Page createState() => _Referral_Page();
}
class _Referral_Page extends State<Referral_Page>with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex=0;
  final _selectedColor = Color(0xff1a73e8);
  final _tabs = [
    Tab(text: 'New Referral'),
    Tab(text: 'My Referrals'),


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
        body:getBody()

    );
  }

  Widget getBody()
  {
    return SingleChildScrollView
      (
      child:
      Stack(
        children: <Widget>
        [
          Container(
            height: MediaQuery.of(context).size.height * 0.32,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Color.fromRGBO(51, 184, 255, 1.0),
                  Color.fromRGBO(112, 0, 224, 1),
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child:  SvgPicture.asset('assets/images/reward_top.svg', height: 180, width: 120),
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Wrap(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15,left: 10),
                        child: IconButton(
                          alignment: Alignment.topLeft,
                          icon: const Icon(Icons.arrow_back_outlined,
                            color:Color.fromRGBO(255, 255, 255, 1),
                          ), onPressed: () {
                          Navigator.of(context).pop();
                        },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0,  left: 10),
                        child: new Text(
                          'Refer Now',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30,top: 35),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text(
                          'Get',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 3),
                        Text(
                          '40 Q coins',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'on every referral',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 3),


                      ],
                    ),
                  ),

                  Container(

                    decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 251, 252, 1),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Color.fromRGBO(193, 199, 208, 0.4), // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    margin: EdgeInsets.only(left: 15,right: 10,top: 60),
                    height: /*kToolbarHeight - 8.0*/ 60,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab, // Indicator spans full width of label
                       dividerHeight: 0,
                      padding: EdgeInsets.all(5),
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _selectedColor,
                      ),
                      labelColor: Colors.white,
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
                        New_Referral_Screen(),
                        Container()
                        // Add more TabBarView children as needed
                      ],
                    ),
                  ),
                  //tab

                ],
              ),


            ],
          ),


        ],
      ),

    );
  }




}

