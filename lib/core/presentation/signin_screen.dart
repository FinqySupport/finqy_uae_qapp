import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:q_app/core/presentation/forgot_pin.dart';
import 'package:q_app/core/presentation/sign_with_otp.dart';
import 'package:q_app/core/presentation/signup_screen.dart';

import '../../storage/shared_preference.dart';
import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_headerinfo_signup.dart';
import 'dashboard.dart';
import 'my_home_screen.dart';
import 'otp_verification.dart';



class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreen createState() => _SignInScreen();
}
class _SignInScreen extends State<SignInScreen>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;

  var country_code='';
  var phone_code='91';
  bool siginotp = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();


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
  Widget build(BuildContext context)
  {

    return Scaffold(
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
                  height: MediaQuery.of(context).size.height * 0.27,
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
                        CustomHeaderInfoSignup(title: "Hi, Welcome Back!", subtitle: 'Sign in to your account.',
                          bgColor: Constants.qAppColor,appbar: false,),
                        //Spacer(),
                        /*    const SizedBox(height: 80),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16), //apply padding to all four sides
                          child: Align(
                            alignment: Alignment.topLeft,
                            child:AutoSizeText('Hi, Welcome Back!',
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
                        const SizedBox(height: 10),*/

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
                                              const SizedBox(height: 25),

                                              if(!siginotp)
                                                Column(
                                                  children: [
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
                                                    const SizedBox(height: 20),
                                                  ],
                                                ),


                                              Container(
                                                alignment: Alignment.topRight, // Adjust the alignment as needed
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Future.delayed(const Duration(milliseconds: 100), ()
                                                    {
                                                      // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
                                                      Navigator.of(context).push(
                                                        MaterialPageRoute(builder: (context) => ForgotPin()),
                                                      );
                                                    });
                                                  },
                                                  child: const Text(
                                                    'Forgot Pin ?',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(41, 80, 237, 1),
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(height: 20),
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 60),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text:
                                                        "Cannot access? ",
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(143, 148, 158, 1.0),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "Sign in using OTP",
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
                                                              MaterialPageRoute(builder: (context) => Sign_With_Otp()),
                                                            );
                                                          });



                                                          /*
                                                          if(phoneController.text.isEmpty)
                                                          {
                                                            setState(()
                                                            {
                                                              _formKey.currentState!.validate();
                                                              phonevalidation = true; // Set validation flag to true
                                                              siginotp = true; // Set validation flag to true
                                                            });
                                                          }
                                                          else
                                                          {

                                                            Sigin_with_otp();

                                                          }*/

                                                        },



                                                      ),

                                                    ],
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text:
                                                        "New user?  ",
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(143, 148, 158, 1.0),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "Sign Up",
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
                                                            Navigator.of(context).pushReplacement(
                                                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                                                            );
                                                          });
                                                        },



                                                      ),

                                                    ],
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
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
                                                      /*     if(phoneController.text.isEmpty)
                                                      {
                                                        setState(() {
                                                          // ConsoleLogUtils.printLog('printMessage');
                                                          phonevalidation = true;
                                                          _formKey.currentState!.validate(); // Trigger form validation
                                                        });
                                                      }
*/

                                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                                      if (!currentFocus.hasPrimaryFocus) {
                                                        currentFocus.unfocus();
                                                      }

                                                      if (_formKey.currentState!.validate())
                                                      {
                                                        _login();
                                                        /*  Future.delayed(const Duration(milliseconds: 100), ()
                                                        {
                                                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                                                            return Dashboard();
                                                          }), (r){
                                                            return false;
                                                          });
                                                          // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.

                                                        });
*/

                                                      }
                                                    },
                                                    child: const Text('Sign in'),
                                                  ),
                                                ),
                                              ),
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

  void  _login() async
  {

    if(loadershow)
    {
      Loader.show(context,
          isSafeAreaOverlay: true,
          isBottomBarOverlay: true,
          isAppbarOverlay: true,
          progressIndicator: CircularProgressIndicator());
    }

    String phone_code1="";

    phone_code1=phone_code;


    String token=await getFCMToken() ?? "";


    // Create a map with the data to send in the request body
    var data =
    {
      'is_pin':"1",
      'phone_code':phone_code1,
      'mobile_no':'9820079956',
      'pin':'1234'
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

      ConsoleLogUtils.printLog('nnnnn ${status}');
      if (status!=null&&status)
      {
        /* var user_id=json['data']['id'] ?? '';
        setUserId(user_id.toString());*/
        {
          setUserName(response['data']['first_name'] +" "+response['data']['last_name']);
          setUserFirstName(response['data']['first_name']);
          setUserLastName(response['data']['last_name']);
          //  setUserEmail(json['data']['last_name']);
          setUserMobile_no(phoneController.text);
          setUserphone_code(phone_code);
        }
        setLogin(true);
        Future.delayed(const Duration(milliseconds: 100), ()
        {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
            return Dashboard();
          }), (r){
            return false;
          });
          // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.

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

