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
import 'package:q_app/core/presentation/faq_screen.dart';
import 'package:q_app/core/presentation/signup_screen.dart';

import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'feedback_screen.dart';
import 'otp_verification.dart';



class SupportDeatils extends StatefulWidget {
  SupportDeatils({Key? key}) : super(key: key);


  @override
  _SupportDeatils createState() => _SupportDeatils();
}
class _SupportDeatils extends State<SupportDeatils>with SingleTickerProviderStateMixin {

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
      backgroundColor: const Color.fromRGBO(250, 251, 252, 1),
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
                'Support',
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
            ), onPressed: () {  },
          ),
        ),

      ),



        body:getBody(),

    );
  }

  Widget getBody() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
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
      padding: const EdgeInsets.all(20), // Adding padding for spacing
      child:  Column(

        children:
        [
          GestureDetector(
            onTap: () {
              if (Platform.isIOS) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) =>
                      FAQ_Screen()
                  ),
                );
              }
              else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      FAQ_Screen()),
                );
              }
            },
            child:
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start vertically
                children: [
                  Image.asset('assets/images/announcement.png', height: 24, width: 24),
                  SizedBox(width: 8), // Add some space between the image and text
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Chat with us on Whatsapp',
                      style: TextStyle(
                        color: Color.fromRGBO(30, 30, 30, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Spacer(), // Add spacer to push the last image to the end of the row
                  Image.asset('assets/images/expand_right.png', height: 24, width: 24),
                ],
              ),
            ),


          ),

          const SizedBox(height: 20), // Adding space between the row and divider
          const Divider(height: 1, thickness: 1), // Divider with 1 pixel height
          const SizedBox(height: 20), // Adding space between the row and divider
          GestureDetector(
            onTap: () {
                if (Platform.isIOS) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) =>
                        FAQ_Screen()
                    ),
                  );
                }
                else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        FAQ_Screen()),
                  );
                }
            },
          child:
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start vertically
              children: [
                Image.asset('assets/images/announcement.png', height: 24, width: 24),
                SizedBox(width: 8), // Add some space between the image and text
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'FAQ’s',
                    style: TextStyle(
                      color: Color.fromRGBO(30, 30, 30, 1),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Spacer(), // Add spacer to push the last image to the end of the row
                Image.asset('assets/images/expand_right.png', height: 24, width: 24),
              ],
            ),
          ),


          ),
          const SizedBox(height: 20), // Adding space between the row and divider
          const Divider(height: 1, thickness: 1), // Divider with 1 pixel height
          const SizedBox(height: 20), // Adding space between the row and divider
            GestureDetector(
              onTap: () {
                if (Platform.isIOS) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) =>
                        FeedbackScreen()
                    ),
                  );
                }
                else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        FeedbackScreen()),
                  );
                }
              },
            child:  Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start vertically
                  children: [
                    Image.asset('assets/images/smartphone.png', height: 24, width: 24),
                    SizedBox(width: 8), // Add some space between the image and text
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Send Feedback',
                        style: TextStyle(
                          color: Color.fromRGBO(30, 30, 30, 1),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Spacer(), // Add spacer to push the last image to the end of the row
                    Image.asset('assets/images/expand_right.png', height: 24, width: 24),
                  ],
                ),
              ),
               ),

        ],
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
                         crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start vertically

                         children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text('Do you need help?',
                              style: TextStyle(
                                  color: Color.fromRGBO(30, 30, 30, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text('Click here to get in touch',
                              style: TextStyle(
                                  color: Color.fromRGBO(113, 117, 124,  1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text('with our relationship     ',
                              style: TextStyle(
                                  color: Color.fromRGBO(113, 117, 124, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),),
                          )   ,
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text('manager',
                              style: TextStyle(
                                  color: Color.fromRGBO(113, 117, 124, 1),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),),
                          ),

                          Container(
                            height: 44,
                            margin:  const EdgeInsets.only(top: 20),
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
                          Container(
                            height: 44,
                            margin:  const EdgeInsets.only(top: 20),
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
                                  child: Text('     Call us     ', // Use the data from the list
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

          ),

    /*      Container(
            height: 50,

            margin:  const EdgeInsets.only(top: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color.fromRGBO(36, 211, 102, 1),
              margin:  const EdgeInsets.symmetric(horizontal: 20.0),
              child:  const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 22.0,right: 22.0), // Adjust left padding as needed
                  child: Text('Chat with us on whatsapp', // Use the data from the list
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          )*/
        ],
      );
  }



}

