import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
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

import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'credit_analysis_report.dart';
import 'otp_verification.dart';



class UploadAecbReport extends StatefulWidget {
  UploadAecbReport({Key? key}) : super(key: key);

  @override
  _UploadAecbReport createState() => _UploadAecbReport();
}
class _UploadAecbReport extends State<UploadAecbReport>with SingleTickerProviderStateMixin {


  var country_code='';
  var phone_code='';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController textEditingControllerPhone= TextEditingController();

  TextEditingController phoneController = TextEditingController();
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
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Upload AECB Report',
          style: TextStyle(
        color: Color.fromRGBO(40, 44, 53, 1),
         fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
       fontSize: 18.0),),

          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined,
              color:Color.fromRGBO(40, 44, 53, 1)),
            onPressed: () {
              Navigator.of(context).pop();// Close the popup

              // Handle back button press
            },
          ),
        ),



        body:getBody(),

    );
  }

  Widget getBody() {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.14,
                        child:  const Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            //Spacer(),
                            Padding(
                              padding: EdgeInsets.only(left: 72,right: 16), //apply padding to all four sides
                              child: Align(
                                alignment: Alignment.topLeft,
                                child:Text('Get your personalized Q',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color.fromRGBO(113, 117, 124, 1),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400 ,

                                      fontSize: 16.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.only(left: 72,right: 16,bottom: 8), //apply padding to all four sides
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Recommendation Report',
                                  maxLines: 7,
                                  style: TextStyle(
                                      color: Color.fromRGBO(113, 117, 124, 1),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400 ,
                                      fontSize: 16.0),
                                ),
                              ),
                            ),
                         ],
                        ),
                      ),
                      SizedBox(
                        child: Stack(
                          children: [
                            Column(
                              children:
                              [
                                GestureDetector(
                                    onTap: () {
                                      Future.delayed(const Duration(milliseconds: 100), ()
                                      {
                                        // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.

                                      });
                                      // Add your click event handling code here
                                     // print('Container clicked!');
                                    },
                                    child: Center(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 60),
                                        child: SvgPicture.asset(
                                          'assets/images/upload_icon.svg',
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: 200,
                                        ),
                                      ),
                                    ),
                                  ),
                                 const Text(
                                  'Choose file',
                                  style: TextStyle(
                                    color: Color.fromRGBO(41, 80, 237, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    decoration: TextDecoration.underline, // Add underline here

                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20,right: 20,top: 60),
                                  child: const Divider(
                                    height: 1,
                                    color: Color.fromRGBO(243, 243, 243, 1),
                                    thickness: 1,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Text(
                                    'You can download the AECB Report ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(40, 44, 53, 1),
                                      fontFamily: 'Poppins',
                                      fontSize: 14,

                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  child: const Text(
                                    'from below link',
                                    style: TextStyle(
                                      color: Color.fromRGBO(40, 44, 53, 1),
                                      fontFamily: 'Poppins',
                                      fontSize: 14,

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
                                              CreditAnalysisReport()
                                          ),
                                        );
                                      }
                                      else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              CreditAnalysisReport()),
                                        );
                                      }
                                    },

                                child: Container(
                                  width: 120,
                                  margin: const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.all(8), // Add padding here
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: const Color.fromRGBO(41, 80, 237, 1), // Change color as needed
                                      width: 1,
                                    ),
                                  ),
                                  child: const Center( // Center the text
                                    child: Text(
                                      'Click here',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(41, 80, 237, 1),
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center, // Center align the text
                                    ),
                                  ),
                                )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }



}

