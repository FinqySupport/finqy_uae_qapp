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
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';


class EmploymentDetails extends StatefulWidget
{
  EmploymentDetails({Key? key}) : super(key: key);
  @override
  _EmploymentDetails createState() => _EmploymentDetails();
}
class _EmploymentDetails extends State<EmploymentDetails>with SingleTickerProviderStateMixin {

  List<String> employmentList = [
    "Salaried",
    "Self Employed",
  ];


  bool labeltext = true;
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;

  var country_code='';
  var phone_code='';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  TextEditingController employmentdetails = TextEditingController();
  TextEditingController creditcard = TextEditingController();
  TextEditingController existingloan = TextEditingController();
  TextEditingController  ENBDPersonalLoan = TextEditingController();
  TextEditingController saleryController = TextEditingController();
  TextEditingController companayName = TextEditingController();
  TextEditingController industrytype = TextEditingController();
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
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4,top: 0),
              child: const Text(
                'Employment Details',
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

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(250, 251, 252, 1),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              const SizedBox(height: 5),
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
                      labelText: (labeltext) ? 'Employment Type':' ',
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
                  Container(
                        alignment: Alignment.centerLeft, // Adjust the alignment as needed
                        child: const Text(
                          'Company Name as per your Visa',
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
                        controller: companayName,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(

                          contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant
                                      .textbordercolor,
                                  width:1)),
                          hintText: 'Company Name as per your Visa',

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
                            return 'Enter Company Name as per your Visa';
                          }

                          return null;
                        },

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),



                      Container(
                        alignment: Alignment.centerLeft, // Adjust the alignment as needed
                        child: const Text(
                          'Industry type',
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
                        controller: industrytype,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant
                                      .textbordercolor,
                                  width:1)),
                          hintText: 'Enter Industry type',

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
                            return 'Enter Industry type';
                          }

                          return null;
                        },

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),

                      Container(
                        alignment: Alignment.centerLeft, // Adjust the alignment as needed
                        child: const Text(
                          'Monthly Salary',
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

                      Container(
                        alignment: Alignment.centerLeft, // Adjust the alignment as needed
                        child: const Text(
                          'Do you have a UAE Credit Card?',
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
                        controller: creditcard,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(

                          contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),

                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant
                                      .textbordercolor,
                                  width:1)),
                          hintText: 'Yes / No',

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
                            return 'Enter Yes / No';
                          }

                          return null;
                        },

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),

                      Container(
                        alignment: Alignment.centerLeft, // Adjust the alignment as needed
                        child: const Text(
                          'Do you have an existing loan?',
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
                        controller: existingloan,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(

                          contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),

                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant
                                      .textbordercolor,
                                  width:1)),
                          hintText: 'Yes / No',

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
                            return 'Enter Yes / No';
                          }

                          return null;
                        },

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),

                      Container(
                        alignment: Alignment.centerLeft, // Adjust the alignment as needed
                        child: const Text(
                          'Did you apply for the ENBD Personal Loan in the last 3 months?',
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
                        controller: ENBDPersonalLoan,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(

                          contentPadding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),

                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant
                                      .textbordercolor,
                                  width:1)),
                          hintText: 'Yes / No',

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
                            return 'Enter Yes / No';
                          }

                          return null;
                        },

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
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

                              setState(() {
                                phonevalidation = true;
                                _formKey.currentState!.validate(); // Trigger form validation
                              });

                              FocusScopeNode currentFocus = FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                              if (_formKey.currentState!.validate()) {
                                //     Signupapi();
                              }
                            },
                            child: const Text('Next'),
                          ),
                        ),
                      ),


                      const SizedBox(height: 20),
            ],
                  ),
                ),
                ),
                );


  }

  void EmploymentDataSubmit() async
  {
    Constants. showLoader(context);
    // Create a map with the data to send in the request body
    var data = {

      'phone_code': phone_code,
      'country_code': country_code,



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

}

