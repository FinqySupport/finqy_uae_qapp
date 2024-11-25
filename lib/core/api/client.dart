import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../storage/shared_preference.dart';
import '../console_utils.dart';

import 'package:http/http.dart' as http;


class Api
   {

  //Stating

 // static String BASE_URL=  "https://staging.cpconverge.com/";
 //  static String ClientID ="converge_cp";
 //   static String ClientSecret ="ConVerge@Cpond";


  // //LIVE
   static String BASE_URL = "https://www.cpconverge.com/";
   static String ClientID ="finqyapp";
   static String ClientSecret ="finqyQAPp190523";

  static String Scope ="userinfo cloud file node";
  static String GrantType ="client_credentials";

  //static let BaseURL = "https://staging.cpconverge.com/mobapi/"
  //static let BaseURL = "https://www.cpconverge.com/\(BaseName)mobapi/"

  static String getBaseURL()  {
    return BASE_URL;
  }


  static Future<bool> getTokenWithoutContextForBGProcess(var message) async
  {


    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email='';
    try {
      //  Block of code to try
      if(prefs.getString('email')!.toString()==null)
      {

      }
      else{
        email=prefs.getString('email')!.toString();
      }
    }
    catch(e) {
      //  Block of code to handle errors
    }

    var url = Uri.parse(BASE_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': ClientID,
      'client_secret': ClientSecret,
      'scope': Scope,
      'grant_type': GrantType,
      'os_type': Platform.operatingSystem,
      'email_id': email
    };

    var response = await http.post(
        url,
        body: data
    );

    if (response.statusCode == 200)
    {
      // Request successful
      var responseData = json.decode(response.body);
      prefs.setString('token', "Bearer "+responseData['access_token']);
      return true;
    } else {
      // Request failed
      ConsoleLogUtils.printLog('Request failed with status: ${response.body}');
      return false;
    }
  }
  static Future<bool> getToken(var message, BuildContext context) async
  {

    if(message == "invalid_token")
    {

      //====Moengage Event=========//
      ConsoleLogUtils.printLog("Logout:please logout");

      context.loaderOverlay.hide();
      setLogout(true, context);
    }
    else{

      //====Moengage Event=========//
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email='';

    try {
      //  Block of code to try
      if(prefs.getString('email')!.toString()==null)
      {

      }
      else{
        email=prefs.getString('email')!.toString();
      }
    }
    catch(e) {
      //  Block of code to handle errors
    }

    var url = Uri.parse(BASE_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': ClientID,
      'client_secret': ClientSecret,
      'scope': Scope,
      'grant_type': GrantType,
      'os_type': Platform.operatingSystem,
      'email_id': email
    };

    var response = await http.post(
        url,
        body: data
    );
    ConsoleLogUtils.printLog('Url=2: $url');
    ConsoleLogUtils.printLog('data=: $data');

    if (response.statusCode == 200)
    {
      // Request successful
      var responseData = json.decode(response.body);
      prefs.setString('token', "Bearer "+responseData['access_token']);
      return true;

    } else {
      // Request failed
      ConsoleLogUtils.printLog('Request failed with status: ${response.body}');
      return false;

    }
  }
  static Future<bool> getTokenSigupLogin() async
  {
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
      ConsoleLogUtils.printLog('error123:$e');
      //  Block of code to handle errors
    }

    ConsoleLogUtils.printLog('emailemail:$email');

    var url = Uri.parse(BASE_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': ClientID,
      'client_secret': ClientSecret,
      'scope': Scope,
      'grant_type': GrantType,
      'os_type': Platform.operatingSystem,
      'email_id': email
    };
    var response = await http.post(url, body: data);
  /*  ConsoleLogUtils.printLog('Response Data: $response');
    ConsoleLogUtils.printLog('Url=1: $url');
    ConsoleLogUtils.printLog('data=: $data');
    ConsoleLogUtils.printLog('response.statusCode=:${response.statusCode}');*/

    if (response.statusCode == 200)
    {
      // Request successful
      ConsoleLogUtils.printLog('response.body:${response.body}');
      var responseData = json.decode(response.body);
      ConsoleLogUtils.printLog('tokendata:${responseData['access_token']}');
      setTokenId("Bearer "+responseData['access_token']);
      ConsoleLogUtils.printLog('tokenafterlogout:${await getTokenId() ?? ""}');
      return true;

    } else {
      // Request failed
      ConsoleLogUtils.printLog('Request failed with status: ${response.body}');
      return false;



    }
  }

  Future  loginAsync(var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+ "api/customersign_in");
    var response = await http.post(uri, headers: headers, body:  data);

     ConsoleLogUtils.printLog(data);
     ConsoleLogUtils.printLog(response.request);
     ConsoleLogUtils.printLog(response.body);

    ConsoleLogUtils.printLog(response.statusCode);
    ConsoleLogUtils.printLog(response);

    if(response.statusCode==401)
    {
      if(await getTokenSigupLogin()) {

        var headers1 = {
          'Authorization': await getTokenId() ?? "",
        };
        var response = await http.post(uri, headers: headers1, body:  data);
        if(response!=null) {
            return response.body;
          }
      }
    }
    return response.body;
  }

  Future signUpAsync(var data) async {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/customer/sign_up');
    var response = await http.post(uri, headers: headers, body:  data);
    ConsoleLogUtils.printLog(data);
    ConsoleLogUtils.printLog(response.body);
    ConsoleLogUtils.printLog(response.request);

    if(response.statusCode==401) {
      if(await getTokenSigupLogin()) {
        var headers1 = {
          'Authorization': await getTokenId() ?? "",
        };
        var response = await http.post(uri, headers: headers1, body:  data);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  null;
  }

  Future  verifyEmailMobile(var token, var data,BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'mobapi/Login/verifyEmailMobile');
    var response = await http.post(uri, headers: headers, body:  data);
    ConsoleLogUtils.printLog(data);
    ConsoleLogUtils.printLog(response.request);
    ConsoleLogUtils.printLog(response.body);
    ConsoleLogUtils.printLog(response);

    if(response.statusCode==401)
    {

      if(await getTokenSigupLogin())
      {
        var headers1 = {
          'Authorization': await getTokenId() ?? "",
        };
        var response = await http.post(uri, headers: headers1, body:  data);
        return  response.body;
      }

    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  null;
  }

  Future  getResendVerifyCode(var token1, var data, BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'mobapi/Login/getResendVerifyCode');
    var response = await http.post(uri, headers: headers, body:  data);
   // ConsoleLogUtils.printLog('Response=: $response');
   // ConsoleLogUtils.printLog(data);
   // ConsoleLogUtils.printLog(response.request);
   // ConsoleLogUtils.printLog(response.body);
    if(response.statusCode==401)
    {
    //  final  json= jsonDecode(response.body);
      if(await getTokenSigupLogin())
      {
        var headers1 = {
          'Authorization': await getTokenId() ?? "",
        };
        var response = await http.post(uri, headers: headers1, body:  data);
        return  response.body;
      }
    }
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  verifiyLoginOtp( var data, BuildContext context) async
  {
    var headers =
    {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'mobapi/Login/verifiyLoginOtp');
    var response = await http.post(uri, headers: headers, body: data);
    ConsoleLogUtils.printLog('Response=: $response');
    if(response.statusCode==401)
    {


      if(await getTokenSigupLogin())
      {
        var headers1 = {
          'Authorization': await getTokenId() ?? "",
        };
        var response = await http.post(uri, headers: headers1, body: data);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }
  Future  ProfileUpdate(var data, BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'mobapi/Profile/personalInfoUpdate');
    var response = await http.post(uri, headers: headers, body:  data);

   // print(data);
    ConsoleLogUtils.printLog(data);
    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');

    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers, body: data);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  addPost(var data, BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    ConsoleLogUtils.printLog(data);
    var uri = Uri.parse(BASE_URL+'mobapi/Post/addPost');
    var response = await http.post(uri, headers: headers, body:  data);
    ConsoleLogUtils.printLog(response.request);
    ConsoleLogUtils.printLog(response.body);

    if(response.statusCode==401)
    {

      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers, body: data);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }
  Future  loadCountry(var data, BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'mobapi/Unidirect/loadCountry');
    var response = await http.post(uri, headers: headers, body:  data);
    ConsoleLogUtils.printLog(data);
    ConsoleLogUtils.printLog(response.request);
    ConsoleLogUtils.printLog(response.body);


    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers, body: data);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

   }







