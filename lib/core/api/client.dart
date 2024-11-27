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


  // //LIVE
  static String BASE_URL = "https://qappapi.finqy.ai/";
  static String BASE_AUTH_URL = "https://api-auth.finqy.ai/";
  static String ClientID ="finqyqapp";
  static String ClientSecret ="finqyQAPp190523";

  static String Scope ="userinfo cloud file node";
  static String GrantType ="client_credentials";


  void getTokenLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email='';
    try {
      //  Block of code to try
      if(prefs.getString('email')!.toString()==null) {

      }
      else{
        // email=prefs.getString('email')!.toString();
      }
    }
    catch(e) {
      //  Block of code to handle errors
    }

    var url = Uri.parse(Api.BASE_AUTH_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': Api.ClientID,
      'client_secret': Api.ClientSecret,
      'scope': Api.Scope,
      'grant_type': Api.GrantType,
      'user': email
    };


    var response = await http.post(
        url,
        body: data
    );

    if (response.statusCode == 200)
    {
      // Request successful
      var responseData = json.decode(response.body);
      // prefs.setString('token', "Bearer "+responseData['access_token']);
      setTokenId("Bearer "+responseData['access_token']);
      print((response.body));


    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
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

    var url = Uri.parse(BASE_AUTH_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': ClientID,
      'client_secret': ClientSecret,
      'scope': Scope,
      'grant_type': GrantType,
      'user': email
    };

    var response = await http.post(
        url,
        body: data
    );

    if (response.statusCode == 200)
    {
      // Request successful
      var responseData = json.decode(response.body);
      prefs.setString('token', responseData['access_token']);
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

    var url = Uri.parse(BASE_AUTH_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': ClientID,
      'client_secret': ClientSecret,
      'scope': Scope,
      'grant_type': GrantType,
      'user': email
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
      prefs.setString('token',"Bearer "+responseData['access_token']);
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

    var url = Uri.parse(BASE_AUTH_URL+'oauth/getAccesstoken');
    var data = {
      'client_id': ClientID,
      'client_secret': ClientSecret,
      'scope': Scope,
      'grant_type': GrantType,
      'user': email
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
      'Authorization': await getTokenId() ?? ""
    };
    var uri = Uri.parse(BASE_URL+ "api/v1/customer/sign-in");
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
    var uri = Uri.parse(BASE_URL+'api/v1/customer/sign-up');
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

  Future  verifyOtp(var data,BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/verify-otp');
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

  Future  resend_otp( var data,BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/resend-otp');
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

  Future  forgot_pin( var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/forgot-pin');
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

  Future  update_pin( var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/update-pin');
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
    var uri = Uri.parse(BASE_URL+'api/v1/customer/verify-otp');
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

  Future  getProfileDetails(var data, BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/get-profile');
    var response = await http.post(uri, headers: headers);

    // print(data);
    ConsoleLogUtils.printLog(data);
    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
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

  Future  getFaqList( BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/get-faqs');
    var response = await http.post(uri, headers: headers);

    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');

    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  profileUpdate(var data, BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/update-profile');
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

  Future get_companies(var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/companies');
    var response = await http.post(uri, headers: headers);
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

  Future get_vehicle_rc(var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/verify-vehicle-rc');
    var response = await http.post(uri, headers: headers,body: data);
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

  Future get_locations(var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/get-locations');
    var response = await http.post(uri, headers: headers);
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


  Future  feedbackCustomer( var data, BuildContext context) async
  {
    var headers =
    {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/feedback');
    var response = await http.post(uri, headers: headers, body: data);
    ConsoleLogUtils.printLog('Response=: $response');
    var statuscode=response.statusCode;
    ConsoleLogUtils.printLog('statusCode=:$statuscode');
    if(statuscode==422)
    {
      setLogout(true, context);

    }
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


  Future  getDashboard_Data(BuildContext context) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/dashboard-data');
    var response = await http.post(uri, headers: headers);

    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  getProducts(BuildContext context,var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/admin/get-products');
    var response = await http.post(uri, headers: headers,body: data);

    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  getProductDetails(BuildContext context,var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
      //  'Content-Type': 'application/x-www-form-urlencoded',
    };
    var encodedData = data.entries
        .map((entry) =>
    '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
        .join('&');
    var uri = Uri.parse(BASE_URL+'api/v1/admin/product-details');
    var response = await http.post(uri, headers: headers,body: data);

    ConsoleLogUtils.printLog('data:${data}');
    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  addOrder(BuildContext context,var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/add-order');
    var response = await http.post(uri, headers: headers,body: data);

    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  orderList(BuildContext context,var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/order');
    var response = await http.post(uri, headers: headers,body: data);

    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  orderDetails(BuildContext context,var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/order-details');
    var response = await http.post(uri, headers: headers,body: data);

    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
        return  response.body;
      }
    }
    ConsoleLogUtils.printLog('Response Data:$response');
    if (response.statusCode == 200) {
      return  response.body;
    }
    return  response.body;
  }

  Future  remove_ProfileDocs( var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/remove-profile-docs');
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

  Future  qrecommendations(BuildContext context,var data) async
  {
    var headers = {
      'Authorization': await getTokenId() ?? "",
    };
    var uri = Uri.parse(BASE_URL+'api/v1/customer/qrecommendations');
    var response = await http.post(uri, headers: headers,body: data);

    ConsoleLogUtils.printLog('request:${response.request}');
    ConsoleLogUtils.printLog('body:${response.body}');
    var statuscode=response.statusCode;
    if(statuscode==422)
    {
      setLogout(true, context);
    }
    if(response.statusCode==401)
    {
      final  json= jsonDecode(response.body);
      if(await getToken(json['error'] ?? '',context))
      {
        var response = await http.post(uri, headers: headers);
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







