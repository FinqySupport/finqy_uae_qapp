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
import 'package:q_app/core/presentation/dashboard.dart';
import 'package:q_app/core/presentation/set_pin.dart';
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



class OtpVerification extends StatefulWidget
{
  OtpVerification({Key? key, required this.forgot, required this.phone, required this.phone_code}) : super(key: key);
  final bool forgot;
  final String  phone;
  final String  phone_code;

  @override
  _OtpVerification createState() => _OtpVerification();
}
class _OtpVerification extends State<OtpVerification>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;

  var country_code='';
  var phone_code='';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController textEditingControllerPhone= TextEditingController();


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
          title: const Text(''),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromRGBO(51, 184, 255, 1.0),
              Color.fromRGBO(112, 0, 224, 1),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined,
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
                        CustomHeaderInfoSignup(title: "OTP Verification", subtitle: 'please check your phone. we have to sent the code verification to to your mobile number.',
                          bgColor: Constants.qAppColor, appbar: true,),
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
                                              Container(
                                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                child: const Text(
                                                  'Enter a 6 digit code sent to',
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
                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                    child:  Text('( '+widget.phone_code+'  '+'${replaceStringExceptLastFourDigit(widget.phone)+' )'}',
                                                      textAlign: TextAlign.start,
                                                      style: const TextStyle(
                                                        color: Color.fromRGBO(41, 80, 237, 1),
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(left: 5),
                                                    alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                                    child:  CustomImageView(
                                                    imagePath: 'assets/images/edit_icon.svg',
                                                    height: 14,
                                                    width: 14,
                                                  ),
                                                  ),

                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 0,
                                                  top: 15,
                                                  right: 0,
                                                ),
                                                child: PinCodeTextField
                                                  (
                                                  controller: textEditingControllerPhone,
                                                  appContext: context,
                                                  length: 6,
                                                  obscureText: false,
                                                  showCursor: true,
                                                  cursorColor: Colors.indigo,
                                                  cursorHeight: 15,
                                                  textStyle: TextStyle(
                                                    color: ColorConstant.otp_heder,
                                                    fontSize:
                                                    14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  obscuringCharacter: '*',
                                                  keyboardType: TextInputType.number,
                                                  autoDismissKeyboard: true,
                                                  enableActiveFill: true,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter.digitsOnly,
                                                  ],
                                                  validator: (String? value) {
                                                    if (value == null || value == '') {
                                                      return 'Please enter mobile otp';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {

                                                  },
                                                  pinTheme: PinTheme(
                                                    fieldHeight: 44,
                                                    fieldWidth: 40,
                                                    fieldOuterPadding: EdgeInsets.only(right: 5),
                                                    shape: PinCodeFieldShape.box,
                                                    borderRadius: BorderRadius.circular(
                                                      10,
                                                    ),
                                                    borderWidth: 0.5,
                                                    selectedFillColor:
                                                    ColorConstant.whiteA700,
                                                    activeFillColor: ColorConstant.whiteA700,
                                                    inactiveFillColor:
                                                    ColorConstant.whiteA700,
                                                    inactiveColor: ColorConstant.otpbordercolor,
                                                    selectedColor: ColorConstant.otpbordercolor,
                                                    activeColor: ColorConstant.otpbordercolor,

                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                    top: 6,
                                                    right: 24,
                                                  ),
                                                  child: OtpTimerButton(
                                                    buttonType: ButtonType.text_button, // or ButtonType.outlined_button
                                                    height: 30,


                                                    onPressed: () async{

                                                    },
                                                    text: const Text('Resend code',
                                                        style: TextStyle(
                                                          fontSize:
                                                          13,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w400,
                                                        )),
                                                    duration: 60,
                                                  ),
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
                                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                                      if (!currentFocus.hasPrimaryFocus) {
                                                        currentFocus.unfocus();
                                                      }
                                                      if (_formKey.currentState!.validate())
                                                      {
                                                        if(widget.forgot)
                                                          {

                                                            _ForgotPin();
                                                           /* Future.delayed(const Duration(milliseconds: 100), ()
                                                            {
                                                              // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
                                                              Navigator.of(context).push(
                                                                MaterialPageRoute(builder: (context) => SetPin()),
                                                              );
                                                            });
*/
                                                          }
                                                        else
                                                        {
                                                          Verify();
                                                        /*  Future.delayed(const Duration(milliseconds: 100), ()
                                                          {
                                                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                                                              return const Dashboard();
                                                            }), (r){
                                                              return false;
                                                            });
                                                            // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.

                                                          });*/
                                                        }

                                                       // otpverfiy();
                                                      }
                                                    },
                                                    child:  Text((widget.forgot) ? 'Verify' : 'Sign in'),
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



  String replaceStringExceptLastFourDigit(String actual) {
    String secure = actual.replaceAll(RegExp(r'.(?=.{4})'),'*'); // here n=4
    return secure;
  }

  void  _ForgotPin() async
  {

    if(loadershow)
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
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
            return SetPin();
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

  void Verify() async
  {

    if(loadershow)
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
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
            return const Dashboard();
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

