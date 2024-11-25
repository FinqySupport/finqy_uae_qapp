import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:q_app/core/presentation/signup_screen.dart';

import '../../storage/shared_preference.dart';
import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'otp_verification.dart';



class ForgotPin extends StatefulWidget {
  ForgotPin({Key? key}) : super(key: key);

  @override
  _ForgotPin createState() => _ForgotPin();
}
class _ForgotPin extends State<ForgotPin>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;

  var country_code='';
  var phone_code='971';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController textEditingControllerPhone= TextEditingController();

  TextEditingController phoneController = TextEditingController();
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
                                title: "Forgot Pin",
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
                                          const SizedBox(height: 30),
                                          Container(
                                            alignment: Alignment.centerLeft,
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
                                          const SizedBox(height: 15),
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
                  onPressed: () {
                    if(phoneController.text.isEmpty)
                    {
                      setState(() {
                        // ConsoleLogUtils.printLog('printMessage');
                        phonevalidation = true;
                        _formKey.currentState!.validate(); // Trigger form validation
                      });
                    }


                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    if (_formKey.currentState!.validate()) {
                      SetPin();

                    }
                  },
                  child: const Text('Get OTP'),
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }
  void SetPin() async
  {


      Loader.show(context,
          isSafeAreaOverlay: true,
          isBottomBarOverlay: true,
          isAppbarOverlay: true,
          progressIndicator: CircularProgressIndicator());
    // Create a map with the data to send in the request body
    var data = {
      'logintype':"converge",
      'fcm_token': await getFCMToken() ?? "",
      'os_type':Platform.operatingSystem,
      'version_no':await getversionName() ?? "",
      'version_code':await getversionCode() ?? "",

    };


    ConsoleLogUtils.printLog('params:$data');

    var json  = (await Api().loginAsync(data))!;
    if(loadershow) {
      Loader.hide();
    }


    if (json!=null)
    {
      // ConsoleLogUtils.printLog('Response Data:$json');
      final  response= jsonDecode(json);
      var status=response['status'] ?? '';
      //  ConsoleLogUtils.printLog('nnnnn ${status}');
      if (status!=null&&status)
      {
        Future.delayed(const Duration(milliseconds: 100), ()
        {
          // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OtpVerification(forgot: true, phone: phoneController.text, phone_code: phone_code,)),
          );
        });
      }
      else
      {

        Fluttertoast.showToast(
            msg: response['message']!,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }





    }
    else {
      ConsoleLogUtils.printLog('Request failed with status: ${json}');
    }
  }

}





