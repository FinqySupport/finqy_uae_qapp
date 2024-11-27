

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:q_app/core/presentation/home_slider_carousel.dart';
import 'package:q_app/core/presentation/upload_aecb_report.dart';
import 'package:q_app/core/reward/referral_page.dart';

import '../reward/earn_reward_screen.dart';
import '../reward/offers_reward_screen.dart';
import '../reward/redeem_reward_screen.dart';
import '../widgets/profile_icon_widget.dart';
import 'my_products_widget.dart';




class MyRewardScreen extends StatefulWidget {
  const MyRewardScreen({Key? key}) : super(key: key);

  @override
  _MyRewardScreen createState() => _MyRewardScreen();
}
class _MyRewardScreen extends State<MyRewardScreen>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;
  var country_code='';
  var phone_code='';


  TextEditingController textEditingControllerPhone= TextEditingController();

  TextEditingController phoneController = TextEditingController();
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

    // Add more items as needed
  ];
  List<Map<String, dynamic>> earnStep = [
    {
      'title': 'Every referral = ',
      'description': '100 Q Coins',
      'image ': 'assets/images/product1.png',

    },
    {
      'title': 'Every step completed = ',
      'description': '100 Q Coin',
      'image ': 'assets/images/product2.png',

    },
    {
      'title': 'Every referral = ',
      'description': '40 Q Coins',
      'image ': 'assets/images/product1.png',

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
                          ), onPressed: () {  },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0,  left: 10),
                        child: new Text(
                          'Reward',
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
                    margin: EdgeInsets.only(left: 35,top: 40),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Q Coins',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Earn 3,000',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: 3),

                      ],
                    ),
                  ),

                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 85),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,

                      margin: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Center(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: const Align(
                                child: Text('450', // Use the data from the list
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(41, 80, 237, 1),
                                    fontSize: 42.0,
                                  ),

                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: const Align(
                                child: Text('Q-coins', // Use the data from the list
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(40, 44, 53, 1),
                                    fontSize: 20.0,
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 180,
                    margin: const EdgeInsets.only(left: 10, right: 0, top: 20,bottom: 20),
                    width: MediaQuery.of(context).size.width, // Set width to match screen width
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: sliderData.length,
                      itemBuilder: (context, index) {
                        // Add spacing between images
                        return GestureDetector(
                          onTap: ()
                          {
                            if(index==0)
                            {
                              if (Platform.isIOS) {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) =>
                                      EarnReward_screen()
                                  ),
                                );
                              }
                              else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      EarnReward_screen()),
                                );
                              }
                            }
                            else if(index==1)
                            {
                              if (Platform.isIOS) {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) =>
                                      RedeemRewardScreen()
                                  ),
                                );
                              }
                              else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      RedeemRewardScreen()),
                                );
                              }
                            }
                            else
                            {
                              if (Platform.isIOS)
                              {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) =>
                                      Offers_reward_screen()
                                  ),
                                );
                              }
                              else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      Offers_reward_screen()),
                                );
                              }

                            }
                            // Handle onTap
                          },
                          child: Container(
                            width: 150,
                            height: 165, // Set the height here

                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white, // Your desired border color
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      (index == 0) ? 'assets/images/earn_small.png' : (index == 1) ? 'assets/images/reddem_small.png' : 'assets/images/reward_offersmall.png',
                                      width: 48,
                                      height: 48,
                                    ),
                                    Text(

                                      (index == 0) ?  'Earn': (index == 1) ? 'Redeem' : 'Offers',
                                      style: TextStyle(
                                        color: Color.fromRGBO(40, 44, 53, 1),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/round_btn.png',
                                      width: 28,
                                      height: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20,right: 20),
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(203, 203, 203, 0.1), // Your desired border color
                          // Border width
                        ),
                        borderRadius:BorderRadius.all(Radius.circular(20)),
                      ),


                      //color: Colors.blue.withOpacity(0.1),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            margin: EdgeInsets.only(top: 20,left: 20,bottom: 10),
                            child: Text('Spread the word, Earn Rewards!',
                              style: const TextStyle(
                                  color: Color.fromRGBO(40, 44, 53, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),

                              itemCount: earnStep.length,
                              itemBuilder: (context, index) {


                                return index != 0
                                    ? Column(mainAxisSize: MainAxisSize.min, children: [
                                  Row(children: [
                                    Column(
                                      children: List.generate(
                                        5,
                                            (ii) => Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 10, top: 2, bottom:2),
                                            child: Container(
                                              height: 4,
                                              width: 1,
                                              color: const Color.fromRGBO(113, 117, 124, 1),
                                            )),
                                      ),
                                    ),

                                  ]),
                                  Row(children: [
                                    Image.asset((index==1)?'assets/images/apply_loan.png':'assets/images/star.png',height: 38,width: 38,),
                                    const SizedBox(width: 20,),
                                    Text(earnStep[index]['title'],
                                      style: const TextStyle(
                                          color: Color.fromRGBO(40, 44, 53, 1),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0),
                                    ),
                                    Text(earnStep[index]['description'],
                                      style: const TextStyle(
                                          color: Color.fromRGBO(41, 80, 237, 1),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0),
                                    )
                                  ])
                                ])
                                    : Row(
                                    children: [
                                      Image.asset('assets/images/share.png',height: 38,width: 38,),
                                      const SizedBox(width: 20,),
                                      Text(earnStep[index]['title'],
                                        style: const TextStyle(
                                            color: Color.fromRGBO(40, 44, 53, 1),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.0),
                                      ),
                                      Text(earnStep[index]['description'],
                                        style: const TextStyle(
                                            color: Color.fromRGBO(41, 80, 237, 1),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.0),
                                      )
                                    ]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: ()
                      {
                        if (Platform.isIOS)
                        {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) =>
                                Referral_Page()
                            ),
                          );
                        }
                        else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                Referral_Page()),
                          );
                        }
                      },

                      child: Container(
                        height: 52,
                        margin: const EdgeInsets.only(top: 25, right: 5,bottom: 50),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color.fromRGBO(41, 80, 237, 1),
                          margin: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 22.0), // Adjust left padding as needed
                              child: Text('Refer Now', // Use the data from the list
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  )

                ],
              ),


            ],
          ),


        ],
      ),

    );
  }




}

