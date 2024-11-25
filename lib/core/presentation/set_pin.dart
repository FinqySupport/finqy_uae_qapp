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
import 'otp_verification.dart';



class SetPin extends StatefulWidget {
  SetPin({Key? key}) : super(key: key);

  @override
  _SetPin createState() => _SetPin();
}
class _SetPin extends State<SetPin>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;

  var country_code='';
  var phone_code='';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController confirmpinController= TextEditingController();

  TextEditingController pinController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void loadAsset() async {
    await rootBundle.loadString('assets/TermsCondition.rtf').then((value) =>
        print('value:$value')
    );
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
        appBar: GradientAppBar(
          title: Text(''),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromRGBO(51, 184, 255, 1.0),
              Color.fromRGBO(112, 0, 224, 1),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined,
              color:Colors.white),
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
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: Container(
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
                          child: Column(
                            children: [
                              CustomHeaderInfoSignup(
                                title: "Set Pin",
                                subtitle: 'Sign in to your account.',
                                bgColor: Constants.qAppColor,
                                appbar: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.74,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 40),
                                          Container(
                                            alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                            child: const Text(
                                              'PIN',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Color.fromRGBO(40, 47, 60, 1.0),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          TextFormField(
                                            onChanged: (text) {
                                              setState(() {
                                                // your logic here
                                              });
                                            },
                                            maxLength: 4,
                                            obscureText: obscureText,
                                            controller: pinController,
                                            keyboardType: TextInputType.visiblePassword,
                                            decoration: InputDecoration(
                                              prefixIconConstraints:const BoxConstraints(
                                                maxHeight: 54,
                                              ),
                                              prefixIcon : Container(
                                                margin: const EdgeInsets.fromLTRB(16, 0, 11, 0),
                                                child: CustomImageView(
                                                  imagePath: 'assets/images/lock.svg',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    obscureText = !obscureText;
                                                  });
                                                },
                                                child: Icon(
                                                  obscureText ? Icons.visibility_off : Icons.visibility, // Toggle between visible and not visible icons
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                              border: const OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorConstant
                                                          .textbordercolor,
                                                      width:1)),
                                              hintText: 'Enter your pin',

                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorConstant
                                                          .textbordercolor,
                                                      width: 1)
                                              ),
                                              hintStyle: TextStyle(
                                                color: ColorConstant.labelcolor,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                // fontWeight: FontWeight.w400
                                              ),
                                              //<-- SEE HERE
                                              labelStyle: TextStyle(
                                                color: ColorConstant.labelcolor,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                //fontWeight: FontWeight.w400
                                              ),

                                            ),
                                            style: TextStyle(
                                              color: ColorConstant.hintcolor,
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              // fontWeight: FontWeight.w400
                                            ),
                                            validator: (String? value) {
                                              if (value == null || value == '') {
                                                return 'Enter your pin';
                                              }
                                              return null;
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                          ),
                                          const SizedBox(height: 10),
                                        Container(
                                          alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                          child: const Text(
                                            'Confirm PIN',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Color.fromRGBO(40, 47, 60, 1.0),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                          const SizedBox(height: 15),
                                          TextFormField(
                                            onChanged: (text) {
                                              setState(() {
                                                // your logic here
                                              });
                                            },
                                            maxLength: 4,
                                            obscureText: obscureText,
                                            controller: confirmpinController,
                                            keyboardType: TextInputType.visiblePassword,
                                            decoration: InputDecoration(
                                              prefixIconConstraints:const BoxConstraints(
                                                maxHeight: 54,
                                              ),
                                              prefixIcon : Container(
                                                margin: const EdgeInsets.fromLTRB(16, 0, 11, 0),
                                                child: CustomImageView(
                                                  imagePath: 'assets/images/lock.svg',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    obscureText = !obscureText;
                                                  });
                                                },
                                                child: Icon(
                                                  obscureText ? Icons.visibility_off : Icons.visibility, // Toggle between visible and not visible icons
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                              border: const OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorConstant
                                                          .textbordercolor,
                                                      width:1)),
                                              hintText: 'Enter your confirm pin',

                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorConstant
                                                          .textbordercolor,
                                                      width: 1)
                                              ),
                                              hintStyle: TextStyle(
                                                color: ColorConstant.labelcolor,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                // fontWeight: FontWeight.w400
                                              ),
                                              //<-- SEE HERE
                                              labelStyle: TextStyle(
                                                color: ColorConstant.labelcolor,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                //fontWeight: FontWeight.w400
                                              ),

                                            ),
                                            style: TextStyle(
                                              color: ColorConstant.hintcolor,
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              // fontWeight: FontWeight.w400
                                            ),
                                            validator: (String? value) {
                                              if (value == null || value == '') {
                                                return 'Enter your pin';
                                              }
                                              return null;
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                          ),

                                          // Your other form fields here
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              child: Container(
                height: 42,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Constants.buttonColor,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: ()
                  {

                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    if (_formKey.currentState!.validate()) {
                     /* Future.delayed(const Duration(milliseconds: 100), ()
                      {
                        // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => OtpVerification(forgot: true,)),
                        );
                      });*/
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



}

