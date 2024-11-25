import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:q_app/core/presentation/dashboard.dart';
import 'package:q_app/core/presentation/signin_screen.dart';

import '../../storage/shared_preference.dart';
import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/EmiratesIdInputFormatter.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import 'otp_verification.dart';



class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreen createState() => _SignUpScreen();
}
class _SignUpScreen extends State<SignUpScreen>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool salaried = false;
  bool annualturnover = false;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;

  var country_code='';
  var phone_code='971';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController pinConfirmController = TextEditingController();
  TextEditingController saleryController = TextEditingController();
  TextEditingController AnnualTurnoverController = TextEditingController();
  TextEditingController NationalityController = TextEditingController();
  TextEditingController EmirateController = TextEditingController();
  TextEditingController emiratesIDController = TextEditingController();
  TextEditingController employmentdetails = TextEditingController();

  EmiratesIdInputFormatter _formatter = EmiratesIdInputFormatter();
  bool labeltext = true;
  bool labeltext1 = true;
  List<String> employmentList = [
    "Salaried",
    "Self Employed",
  ];

  List<String> emirate  = [
    "Dubai",
    "Sharjah",
    "Abu Dhabi",
    "Ras AL Khaimah",
    "Al Ain",
    "Ajman",
    "Fujairah",
    "Umm Al-Quwain",
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
      resizeToAvoidBottomInset : true,
      body: getBody(),

    );
  }

  Widget getBody()
  {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
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
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        //Spacer(),
                        const SizedBox(height: 80),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16), //apply padding to all four sides
                          child: Align(
                            alignment: Alignment.topLeft,
                            child:AutoSizeText('Welcome to Q App!',
                              maxLines: 2,
                              minFontSize: 20,
                              maxFontSize: 24,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: Platform.isIOS ? 24.0 : 24),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,bottom: 8), //apply padding to all four sides
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('We happy to see you! to use your\n account, you should sign in first',
                              maxLines: 7,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

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
                  child:  Container(

                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.74,
                    decoration: const BoxDecoration(

                      color: Colors.white,
                      borderRadius:BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                    ),

                    //signup_bottom
                    child:Stack(
                      children: [


                        Column(
                          children: [


                            const SizedBox(height: 20,),
                            Expanded(
                              // height: 200,
                              child: Column(
                                children: [

                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child:  Container(
                                        padding: const EdgeInsets.only(left:20,right:20),
                                        child: Form(
                                          key: _formKey,

                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 5),
                                              Container(
                                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                child: const Text(
                                                  'First Name',
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

                                                  hintText: 'Enter your first name',
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
                                                    return 'Enter First Name';
                                                  }
                                                  return null;
                                                },

                                              ),
                                              const SizedBox(height: 15),


                                              const SizedBox(height: 5),
                                              Container(
                                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                child: const Text(
                                                  'Last Name',
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
                                                controller: lastnameController,
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

                                                  hintText: 'Enter your last name',
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
                                                    return 'Enter Last Name';
                                                  }
                                                  return null;
                                                },

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
                                                    loadershow=true;
                                                    // print('nnnnnnnnnn123233');
                                                  });
                                                },

                                                validator: (p0) {
                                                  if (phoneController.text.length==0) {
                                                    return 'Enter Mobile Number';
                                                  }
                                                  else if (phoneController.text.length > 7) {
                                                    return 'Mobile Number should not exceed 7 digits';
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
                                                   print('Country changed to: ' +
                                                        country.code);
                                                    print('Country changed to: ' +
                                                        country.dialCode);
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
                                                    loadershow=true;
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
                                              const SizedBox(height: 20),

                                              Container(
                                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                child: const Text(
                                                  'Emirates ID',
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
                                                    loadershow=true;
                                                    //print('nnnnnnnnnn');
                                                  });
                                                },
                                                inputFormatters: [_formatter],
                                                controller: emiratesIDController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                                                  border: const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorConstant
                                                              .textbordercolor,
                                                          width:1)),
                                                  hintText: 'Enter Emirates ID',

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
                                                    return 'Enter Emirates ID';
                                                  }

                                                  return null;
                                                },

                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                              ),
                                              const SizedBox(height: 20),

                                              Container(
                                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                child: const Text(
                                                  'Employment Type',
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
                                              Stack(
                                                children: [
                                                  TextFormField(
                                                    showCursor: false,
                                                    readOnly: true,

                                                    onTap: () {
                                                      print("I'm here!!!");

                                                    },
                                                    controller: employmentdetails,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                                      border: OutlineInputBorder(),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: ColorConstant.textbordercolor,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      labelText: (labeltext) ? 'Employment Type':'',
                                                      hintText: 'Salaried/Self Employed', // Move hint here
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: ColorConstant.textbordercolor,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      hintStyle: TextStyle(
                                                        color: ColorConstant.hintcolor,
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        // fontWeight: FontWeight.w400
                                                      ),
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
                                                        return 'Select Employment Type';
                                                      }
                                                      return null;
                                                    },
                                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                                  ),
                                                  Container(
                                                    width: (MediaQuery.of(context).size.width),
                                                    margin: EdgeInsets.only(left: 16, right: 16),
                                                    decoration: BoxDecoration(
                                                      color: Colors.greenAccent.withOpacity(0.0),
                                                    ),
                                                    child: DropdownButton<String>(
                                                      icon: Icon(Icons.arrow_downward),
                                                      iconSize: 0,
                                                      underline: Container(
                                                        height: 0,
                                                        color: Colors.transparent,
                                                      ),
                                                      style: TextStyle(
                                                        color: Constants.appGreyMediumColor,
                                                        fontSize: 15,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          labeltext=false;
                                                          employmentdetails.text = newValue!;
                                                          if(newValue=='Salaried')
                                                            {
                                                              salaried=true;
                                                              annualturnover = false;
                                                            }
                                                          else
                                                          {
                                                            annualturnover = true;
                                                            salaried=false;
                                                          }
                                                        });
                                                      },
                                                      items: employmentList.map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),

                                              if(salaried)
                                              Column(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                    child: const Text(
                                                      'Monthly Income',
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
                                                        loadershow=true;
                                                        //print('nnnnnnnnnn');
                                                      });
                                                    },
                                                    controller: saleryController,
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      prefixIconConstraints:const BoxConstraints(
                                                        maxHeight: 54,
                                                      ),
                                                      prefixIcon : Container(
                                                        margin: const EdgeInsets.fromLTRB(16, 0, 11, 0),
                                                        child: CustomImageView(
                                                          imagePath: 'assets/images/coin.svg',
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
                                                      hintText: 'Enter your salary',

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
                                                        return 'Enter your salary';
                                                      }

                                                      return null;
                                                    },

                                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                              if(annualturnover)
                                              Column(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                    child: const Text(
                                                      'Annual Turnover',
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
                                                        loadershow=true;
                                                        //print('nnnnnnnnnn');
                                                      });
                                                    },
                                                    controller: AnnualTurnoverController,
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      prefixIconConstraints:const BoxConstraints(
                                                        maxHeight: 54,
                                                      ),
                                                      prefixIcon : Container(
                                                        margin: const EdgeInsets.fromLTRB(16, 0, 11, 0),
                                                        child: CustomImageView(
                                                          imagePath: 'assets/images/coin.svg',
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
                                                      hintText: 'Enter your Annual Turnover',

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
                                                        return 'Enter your Annual Turnover';
                                                      }

                                                      return null;
                                                    },

                                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),

                                              Container(
                                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                child: const Text(
                                                  'Nationality',
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
                                                    loadershow=true;
                                                    //print('nnnnnnnnnn');
                                                  });
                                                },
                                                controller: NationalityController,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(

                                                  contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),

                                                  border: const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorConstant
                                                              .textbordercolor,
                                                          width:1)),
                                                  hintText: 'Enter your Nationality',

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
                                                    return 'Enter your Nationality';
                                                  }

                                                  return null;
                                                },

                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                              ),
                                              const SizedBox(height: 20),

                                              Container(
                                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                child: const Text(
                                                  'Emirate',
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
                                              Stack(
                                                children: [
                                                  TextFormField(
                                                    showCursor: false,
                                                    readOnly: true,

                                                    onTap: () {
                                                      print("I'm here!!!");

                                                    },
                                                    controller: EmirateController,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                                      border: OutlineInputBorder(),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: ColorConstant.textbordercolor,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      labelText: (labeltext1) ? 'Emirate':'',
                                                      hintText: 'Emirate', // Move hint here
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: ColorConstant.textbordercolor,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      hintStyle: TextStyle(
                                                        color: ColorConstant.hintcolor,
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        // fontWeight: FontWeight.w400
                                                      ),
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
                                                        return 'Select Emirate';
                                                      }
                                                      return null;
                                                    },
                                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                                  ),
                                                  Container(
                                                    width: (MediaQuery.of(context).size.width),
                                                    margin: EdgeInsets.only(left: 16, right: 16),
                                                    decoration: BoxDecoration(
                                                      color: Colors.greenAccent.withOpacity(0.0),
                                                    ),
                                                    child: DropdownButton<String>(
                                                      icon: Icon(Icons.arrow_downward),
                                                      iconSize: 0,
                                                      underline: Container(
                                                        height: 0,
                                                        color: Colors.transparent,
                                                      ),
                                                      style: TextStyle(
                                                        color: Constants.appGreyMediumColor,
                                                        fontSize: 15,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          labeltext1=false;
                                                          EmirateController.text = newValue!;

                                                        });
                                                      },
                                                      items: emirate.map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),


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
                                              const SizedBox(height: 10),
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


                                              const SizedBox(height: 5),
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
                                              const SizedBox(height: 10),
                                              TextFormField(
                                                onChanged: (text) {
                                                  setState(() {
                                                    // your logic here
                                                  });
                                                },
                                                maxLength: 4,
                                                obscureText: obscureText,
                                                controller: pinConfirmController,
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
                                                  else if (value !=null && value!=pinController.text) {
                                                    return 'The entered PINs do not match';
                                                  }
                                                  return null;
                                                },
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                              ),
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
                                                    'I accept the terms and conditions',
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
                                              // Add your other widgets here

                                              const SizedBox(height: 10),
                                              FractionallySizedBox(
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

                                                      if (_formKey.currentState!.validate())
                                                      {
                                                        Signupapi();
                                                      }
                                                    },
                                                    child: const Text('Create Account'),
                                                  ),
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(top: 30),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text:
                                                        "I have an account?  ",
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(143, 148, 158, 1.0),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "Sign in",
                                                        style: const TextStyle(
                                                          color: Constants.appColor,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                        ),

                                                        recognizer: TapGestureRecognizer()..onTap = () async
                                                        {
                                                          Future.delayed(const Duration(milliseconds: 100), ()
                                                          {
                                                            // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
                                                            Navigator.of(context).push(
                                                              MaterialPageRoute(builder: (context) => SignInScreen()),
                                                            );
                                                          });
                                                        },
                                                      ),

                                                    ],
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
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
          )
          ),
        ],
      ),
    );
  }



  void Signupapi() async
  {
    if(loadershow) {
      Loader.show(context,
          isSafeAreaOverlay: true,
          isBottomBarOverlay: true,
          isAppbarOverlay: true,
          progressIndicator: CircularProgressIndicator());
    }


    // Create a map with the data to send in the request body
    var data = {
      'email': emailController.text,
      'phone_code': phone_code,
      'country_code': country_code,
      'mobile_no': phoneController.text,
      'first_name': firstnameController.text.trim(),
      'last_name': lastnameController.text.trim(),
      'fcm_token': await getFCMToken() ?? "",
      'os_type': Platform.operatingSystem,
      'version_no': await getversionName() ?? "",
      'version_code': await getversionCode() ?? "",
      'employment_type': employmentdetails.text,
      'nationality': NationalityController.text,
      'emirate': EmirateController.text,
      'password': pinController.text,


    };
   var response  = (await Api().signUpAsync(data))!;
    if(loadershow)
      {
        Loader.hide();
      }

    if (response!=null)
    {

      ConsoleLogUtils.printLog('Response Data:$response');
      final  json= jsonDecode(response);
      print(json['status'] ?? '');
      var status=json['status'] ?? '';
      if (status =="1")
      {
      //  monegageEvent('SignUpSucessfull');

        final hide_mobile_verify='${json['hide_mobile_verify'] ?? ''}';
        setHideMobileVerify('$hide_mobile_verify');

        var user_id=json['data'] ?? '';
        setUserId(user_id.toString());
        setUserName(firstnameController.text+" "+lastnameController.text);
        setUserFirstName(firstnameController.text);
        setUserLastName(lastnameController.text);
        setUserEmail(emailController.text);
        setUserGroup(json['user_group'] ?? '');
        setUserMobile_no(phoneController.text);
        setUserphone_code(phone_code);
        if(hide_mobile_verify=='1'){
          setmobile_verified('1');
        }
        else{
          setmobile_verified('0');
        }

        setemail_verifiedr('0');


        String saved = await getTodaysDateForResendOTP()??'';
        String formattedDate =DateFormat('dd/MM/yyyy').format(DateTime.now());
        if(saved!=formattedDate) {
          setTodaysDateForResendOTP(formattedDate);
          setResendOTPCountForEmail(1);
          setResendOTPCountForMobile(1);
        }

        Future.delayed(const Duration(milliseconds: 100), ()
        {
          // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OtpVerification(forgot: false, phone: phoneController.text, phone_code: phone_code,)),
          );
        });
      }
      else
      {
        Fluttertoast.showToast(
            msg: json['message'] ?? '',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor:Constants.tosterBGColor,
            textColor: Constants.tosterTextColor,
            fontSize: 16.0
        );


      }

    } else {

      ConsoleLogUtils.printLog('Request failed with status: ${response.statusCode}');
    }
  }

}

