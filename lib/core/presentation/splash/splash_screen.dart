import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_app/core/presentation/dashboard.dart';
import 'package:q_app/core/presentation/onboarding_screen.dart';
import 'package:q_app/core/presentation/otp_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../storage/shared_preference.dart';
import '../../api/client.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic newdata;


  @override
  void initState() {
    super.initState();

   // getToken();
    navigateToNextScreen();
    // Initialize the Branch SDK with your Branch key
  }
  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email='';
    try {
      //  Block of code to try
      if(prefs.getString('email')!.toString()==null) {

      }
      else{
        email=prefs.getString('email')!.toString();
      }
    }
    catch(e) {
      //  Block of code to handle errors
    }

    var url = Uri.parse(Api.BASE_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': Api.ClientID,
      'client_secret': Api.ClientSecret,
      'scope': Api.Scope,
      'grant_type': Api.GrantType,
      'os_type': Platform.operatingSystem,
      'email_id': email
    };

    var response = await http.post(
        url,
        body: data
    );

    print('Url=4: $url');
    print('data=: $data');
    /*  if(response.statusCode==401)
    {
      await Api.getToken();
    }*/
    if (response.statusCode == 200)
    {
      // Request successful
      var responseData = json.decode(response.body);
      // prefs.setString('token', "Bearer "+responseData['access_token']);
      setTokenId("Bearer "+responseData['access_token']);
      print((await getTokenId()) ?? "");
      navigateToNextScreen();
      // if(await getTokenWithoutContextForBGProcess(json['error'] ?? ''))
      // {
      //   var response = await http.post(uri, headers: headers, body: data);
      //   return response.body;
      // }

    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }


  void navigateToNextScreen()async  {
    // Simulate a delay to show the splash screen for a few seconds.
    final prefs = await SharedPreferences.getInstance();

    if (await getLoggedIn() ?? false)
    {
   //   MoengageAppManager.setUsersBasicDetails();
      Future.delayed(Duration(milliseconds: 2), () {
        // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      });
    //  branch_UrlNextScreen(newdata);
      //return MaterialApp(home: OtpScreen("",""));
    }
    else if (await getOtpScreen() ?? false)
    {
      Future.delayed(Duration(milliseconds: 2), () {
        // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>
              OtpVerification(forgot: false, phone:
              prefs.getString("mobile_no")!.toString(), phone_code: '',)),
        );
      });
    }

    else
    {
      Future.delayed(Duration(milliseconds: 2), () {
        // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      });

      // return MaterialApp(home: SignUpScreen());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }




}
