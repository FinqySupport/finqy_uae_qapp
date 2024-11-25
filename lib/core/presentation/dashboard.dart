import 'dart:io';


import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:q_app/core/console_utils.dart';
import 'package:q_app/core/constants/constants.dart';
import 'package:q_app/core/presentation/support_screen.dart';
import 'package:q_app/core/presentation/upload_aecb_report.dart';



import '../utils/CircleNavBar.dart';
import '../utils/CurvedNavigationBar.dart';
import 'credit_analysis_report.dart';
import 'my_home_screen.dart';
import 'my_products.dart';
import 'my_reward_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
//  final _controller = NotchBottomBarController(index: 0);
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  int maxCount = 6;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    MyHomeScreen(),
    MyRewardScreen(),
    // CreditAnalysisReport(),
    MyProducts(),
    CreditAnalysisReport(),
    SupportDeatils(),

  ];


/*
  activeIcons:  [
  Icon(Icons.home, color: Colors.deepPurple),
  Image.asset('assets/images/award.png',width: 10,height: 10, color: Colors.deepPurple),
  Image.asset('assets/images/box.png',width: 10,height: 10, color: Colors.deepPurple),
  Icon(Icons.report, color: Colors.deepPurple),
  Image.asset('assets/images/message_question.png',width: 10,height: 10, color: Colors.deepPurple),
  ],
  inactiveIcons: const [
  Text("Home"),
  Text("Rewards"),
  Text("Products"),
  Text("Report"),
  Text("Support"),
  ],
*/

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar:CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: [
          CurvedNavigationBarItem(

              child: Icon(Icons.home, color:tabIndex==0 ? Colors.white:Colors.grey),
              label: 'Home',
              labelStyle: TextStyle(
                color:tabIndex==0 ? Constants.appColor:Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                //fontWeight: FontWeight.w400
              )
          ),

          CurvedNavigationBarItem(
              child:Image.asset('assets/images/award.png',width: 25,height: 25, color: tabIndex==1 ? Colors.white:Colors.grey),
              label: 'Rewards',
              labelStyle: TextStyle(
                color:tabIndex==1 ? Constants.appColor:Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                //fontWeight: FontWeight.w400
              )
          ),
          CurvedNavigationBarItem(
              child: Image.asset('assets/images/box.png',width: 21,height: 21,  color: tabIndex==2 ? Colors.white:Colors.grey),
              label: 'Products',
              labelStyle: TextStyle(
                color:tabIndex==2 ? Constants.appColor:Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                //fontWeight: FontWeight.w400
              )
          ),
          CurvedNavigationBarItem(
              child: Image.asset('assets/images/document_text.png',width: 21,height: 21,  color: tabIndex==3 ? Colors.white:Colors.grey),

              label: 'Report',
              labelStyle: TextStyle(
                color:tabIndex==3 ? Constants.appColor:Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                //fontWeight: FontWeight.w400
              )
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/images/message_question.png',width: 21,height: 21,  color: tabIndex==4 ? Colors.white:Colors.grey),
            label: 'Support',
            labelStyle: TextStyle(
              color:tabIndex==4 ? Constants.appColor:Colors.black,
              fontSize: 13,
              fontFamily: 'Poppins',
              //fontWeight: FontWeight.w400
            ),


          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Constants.appColor,
        backgroundColor: Color.fromRGBO(250, 251, 252, 1),

        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          ConsoleLogUtils.printLog('Url=2: $index');
          tabIndex = index;
          _pageController.jumpToPage(tabIndex);
        },
        letIndexChange: (index) => true,
      ),
      /*  CircleNavBar(

        activeIcons:  [
          Icon(Icons.home, color: Colors.deepPurple),
          Image.asset('assets/images/award.png',width: 10,height: 10, color: Colors.deepPurple),
          Image.asset('assets/images/box.png',width: 10,height: 10, color: Colors.deepPurple),
          Icon(Icons.report, color: Colors.deepPurple),
          Image.asset('assets/images/message_question.png',width: 10,height: 10, color: Colors.deepPurple),
        ],
        inactiveIcons: const [
          Text("Home"),
          Text("Rewards"),
          Text("Products"),
          Text("Report"),
          Text("Support"),
        ],
        color: Colors.white,
        height: 70,
        circleWidth: 50,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          _pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        elevation: 10,
      ),
*/

    );
  }
}











