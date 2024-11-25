import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../storage/shared_preference.dart';
import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/EmiratesIdInputFormatter.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';


class ProfileScreen extends StatefulWidget
{
  ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreen createState() => _ProfileScreen();
}
class _ProfileScreen extends State<ProfileScreen>with SingleTickerProviderStateMixin {
  TextEditingController AnnualTurnoverController = TextEditingController();
  bool labeltext1 = true;
  bool salaried = false;
  bool annualturnover = false;
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;
  bool labeltextgender = true;
  bool labeltext = true;
  var country_code='';
  var phone_code='';
  TextEditingController EmirateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController saleryController = TextEditingController();
  TextEditingController NationalityController = TextEditingController();
  TextEditingController txtGender = TextEditingController();
  TextEditingController employmentdetails = TextEditingController();
  TextEditingController emiratesIDController = TextEditingController();
  TextEditingController txtEmirates = TextEditingController();
  TextEditingController txtDob = TextEditingController();
  EmiratesIdInputFormatter _formatter = EmiratesIdInputFormatter();
  List<String> genderList = [
    "Male",
    "Female",
    'Other',
  ];
  DateTime? pickedDob;
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
        backgroundColor:  const Color.fromRGBO(250, 251, 252, 1),
        resizeToAvoidBottomInset : true,
        appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4,top: 0),
              child: const Text(
                'Profile',
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
      Container(
      margin: const EdgeInsets.all(22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: ClipOval(
              child: Material(
                color: Color.fromRGBO(66, 102, 247, 1),
                child: InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AA",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 22),
                child: const Text(
                  'Amer Ahmad',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 30, 30, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 22, top: 3),
                child: const Text(
                  '+91 971734 2338',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(113, 117, 124, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 22, top: 3),
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(243, 44, 111, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
                    const SizedBox(height: 10),
                    Container(
                     padding: const EdgeInsets.only(left: 20, right: 20),
                     child: Form(
                      key: _formKey,
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
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

                            hintText: 'Enter your First Name',
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

                            hintText: 'Enter your Last Name',
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
                            'Gender',
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
                        Stack(
                          children: [
                            TextFormField(
                              showCursor: false,
                              readOnly: true,
                              onTap: () {
                                print("I'm here!!!");
                              },
                              controller: txtGender,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                                suffixIcon:const Icon(Icons.arrow_drop_down),
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant
                                            .textbordercolor,
                                        width: 1)),
                                labelText: (labeltextgender) ? 'Gender':'',

                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstant
                                            .textbordercolor,
                                        width: 1)
                                ),
                                hintStyle: TextStyle(
                                  color: ColorConstant.hintcolor,
                                  fontSize: 16,
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
                                  return 'Select gender';
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                            ),
                            Container(

                              width: (MediaQuery.of(context).size.width),
                              //  height: 50,
                              margin:  const EdgeInsets.only(left: 16,right: 16),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(0.0),
                              ),
                              // alignment: AlignmentDirectional.topStart,
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 0,
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                style: const TextStyle(
                                    color: Constants.appGreyMediumColor,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    labeltextgender=false;
                                    txtGender.text=newValue!;
                                    //dropdownValue = newValue;
                                  });
                                },
                                items: genderList.map<DropdownMenuItem<String>>((String value) {
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
                                contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                border: const OutlineInputBorder(),
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
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(0.0),
                              ),
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 0,
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                style: const TextStyle(
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
                                contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                border: const OutlineInputBorder(),
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
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(0.0),
                              ),
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 0,
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                style: const TextStyle(
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
                            'Date of Birth',
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
                          showCursor: false,
                          readOnly: true,
                          onTap: () async
                          {
                            DateTime currentDate = DateTime.now();
                            DateTime minDate = DateTime(currentDate.year - 16, currentDate.month, currentDate.day);

                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate:  minDate,
                              firstDate:DateTime(1900),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: minDate,
                            );


                            if (pickedDate != null) {
                              final age = calculateAge(pickedDate);
                              if (age >= 16) {
                                pickedDob=pickedDate;
                                setState(() {
                                  String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                               //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    txtDob.text =
                                        formattedDate; //set output date to TextField value.
                                  });

                                });
                              }
                              else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Age Restriction"),
                                      content: const Text("You must be at least 16 years old."),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                          controller: txtDob,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                            contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),

                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstant
                                        .textbordercolor,
                                    width:1)),
                            hintText: 'Select your Date of Birth',

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
                              return 'Select your Date of Birth';
                            }

                            return null;
                          },

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),// Add your other widgets here
                        const SizedBox(height: 20),

                        FractionallySizedBox(
                          widthFactor: 1.0,

                          child:Container(
                            height: 48,
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
                                  ProfileUpdate();
                                  //     Signupapi();
                                }
                              },
                              child: const Text('Save Changes'),
                            ),
                          ),
                        ),


                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
  ]
            ),
            );


  }


  void ProfileUpdate() async
  {
    if(loadershow) {
      Loader.show(context,
          isSafeAreaOverlay: true,
          isBottomBarOverlay: true,
          isAppbarOverlay: true,
          progressIndicator: const CircularProgressIndicator());
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


  int calculateAge(DateTime selectedDate) {
    final now = DateTime.now();
    final age = now.year - selectedDate.year - (now.month > selectedDate.month || (now.month == selectedDate.month && now.day >= selectedDate.day) ? 0 : 1);
    return age;
  }

}

