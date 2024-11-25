import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';



class New_Referral_Screen extends StatefulWidget {
  New_Referral_Screen({Key? key}) : super(key: key);

  @override
  _New_Referral_Screen createState() => _New_Referral_Screen();
}
class _New_Referral_Screen extends State<New_Referral_Screen>with SingleTickerProviderStateMixin {
  TextEditingController employmentdetails = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var country_code='';
  var phone_code='';
  bool acceptedTerms = false;
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
      backgroundColor:  const Color.fromRGBO(250, 251, 252, 1),

      body:getBody(),


    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
        key: _formKey,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft, // Adjust the alignment as needed
              child: const Text(
                'Full Name',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromRGBO(40, 47, 60, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization: TextCapitalization.words,
              controller: firstnameController,
              maxLength: 30,
              autocorrect: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon : Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 11, 0),
                  child: CustomImageView(
                    imagePath: 'assets/images/profile.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                alignLabelWithHint: false, //<-- Set alignLabelWithHint to false
                counterText: "",
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstant
                            .textbordercolor,
                        width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstant
                            .textbordercolor,
                        width: 1)),

                hintText: 'Enter your name',
                hintStyle: TextStyle(
                    color: ColorConstant.labelcolor,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400
                ),

              ),
              style: TextStyle(
                  color: ColorConstant.hintcolor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400
              ),

              validator: (String? value) {
                if (value == null || value == '') {
                  return 'Enter your name';
                }
                return null;
              },

            ),


            const SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft, // Adjust the alignment as needed
              child: const Text(
                'Email ID',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromRGBO(40, 47, 60, 1.0),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              onChanged: (text) {
                setState(() {
             //     loadershow=true;
                  //print('nnnnnnnnnn');
                });
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIconConstraints:const BoxConstraints(
                  maxHeight: 54,
                ),
                prefixIcon : Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 11, 0),
                  child: CustomImageView(
                    imagePath: 'assets/images/personalcard.svg',
                    height: 20,
                    width: 20,
                  ),
                ),

                contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstant
                            .textbordercolor,
                        width:1)),
                hintText: 'Email ID',

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
                final emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
                final regExp = RegExp(emailPattern);
                if (value == null || value == '') {
                  return 'Enter Email ID';
                }
                else if (!regExp.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },

              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),

            const SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft, // Adjust the alignment as needed
              child: const Text(
                'Mobile Number',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromRGBO(40, 47, 60, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            IntlPhoneField(
              // disableLengthCheck: true,
              onChanged: (text) {
                setState(() {
                  //  loadershow=true;
                  // print('nnnnnnnnnn123233');
                });
              },
              validator: (p0) {
                if (phoneController.text.length==0) {
                  return 'Enter Mobile Number';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                // Add more formatters if needed
              ],

              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstant
                            .textbordercolor,
                        width: 1)),
                hintText: 'Mobile Number',
                counterText: '',

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstant
                            .textbordercolor,
                        width: 1)),
                hintStyle: TextStyle(
                  color: ColorConstant.labelcolor,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  //fontWeight: FontWeight.w400
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

              dropdownTextStyle: TextStyle(
                color: ColorConstant.hintcolor,
                fontSize: 16,
                fontFamily: 'Poppins',
                // fontWeight: FontWeight.w400
              ),

              pickerDialogStyle:PickerDialogStyle(
                countryCodeStyle:TextStyle(
                  color: ColorConstant.hintcolor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400
                ),
                countryNameStyle:TextStyle(
                  color: ColorConstant.hintcolor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w400
                ),
              ),

              languageCode: "en",
              initialCountryCode: 'AE',

              onCountryChanged: (country) {
                country_code=country.code;
                phone_code=country.dialCode;

                /* print('Country changed to: ' +
                                                        country.code);
                                                    print('Country changed to: ' +
                                                        country.dialCode);*/
              },



            ),
            const SizedBox(height: 20),

            Row(

              children: [
                Checkbox(
                  activeColor:  Constants.buttonColor,
                  /*
                                                    checkColor: Constants.buttonColor,*/
                  value: acceptedTerms,
                  onChanged: (value) {
                    setState(() {
                      acceptedTerms = value!;
                    });
                  },
                ),
                const Text(
                  'A accepted all terms & conditions.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(
                          255, 124, 130, 140)
                    // Add your desired styles here
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: ()
              {

                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }

                if (_formKey.currentState!.validate()) {
                  //     Signupapi();
                }
              },

          child:  Container(
              height: 50,
              margin:  const EdgeInsets.only(top: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color.fromRGBO(36, 211, 102, 1),
                margin:  const EdgeInsets.symmetric(horizontal: 20.0),
                child:   Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.0,right: 22.0), // Adjust left padding as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/whatsapp.png',
                          width: 22,
                          height: 22,
                          fit: BoxFit.contain,
                        ),

                        Text('Refer on Whatsapp', // Use the data from the list
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            ),
        /*    FractionallySizedBox(
              widthFactor: 1.0,

              child:Container(
                height: 42,
                //color: const Color.fromRGBO(236, 232, 232, 1),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Constants.buttonColor,
                    padding: const EdgeInsets.only(left:16,right: 16),
                    // backgroundColor: Constants.appColor,
                    // padding: const EdgeInsets.only(left: 0,right:0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // <-- Radius
                    ),
                    // padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0, //fontStyle: FontStyle.Bold,
                    ),
                  ),
                  onPressed: () {
                    if(phoneController.text.isEmpty)
                    {
                      setState(() {
                        phonevalidation = true;
                        _formKey.currentState!.validate(); // Trigger form validation
                      });
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    if (_formKey.currentState!.validate()) {
                      //     Signupapi();
                    }
                  },
                  child: const Text('Create Account'),
                ),
              ),
            ),
*/

            const SizedBox(height: 20),
          ],
        ),
      ),

      ),
    );
  }


}

