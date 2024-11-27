import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:q_app/core/presentation/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:package_info_plus/package_info_plus.dart';

import '../core/api/client.dart';
import '../core/console_utils.dart';





Future<String?> getUserPhone_code() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('phone_code');
  return userId;
}

Future setUserphone_code(String phone_code1) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('phone_code', phone_code1);
}
Future<String?> getUserMobile_no() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('mobile_no');
  return userId;
}

Future setAddress(String phone_code) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('address', phone_code);
}
Future<String?> getAddress() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('address');
  return userId;
}

Future setUserMobile_no(String userId) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('mobile_no', userId);
}
Future<String?> getUserGroup() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('usergroup');
  return userId;
}

Future setUserGroup(String userId) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('usergroup', userId);
}
Future<String?> getUserEmail() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('email');
  return userId;
}

Future setUserEmail(String userId) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('email', userId);
}

Future<String?> getUserLastName() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('lname');
  return userId;
}

Future setUserLastName(String userId) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('lname', userId);
}

Future<String?> getUserFirstName() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('fname');
  return userId;
}

Future setUserFirstName(String userId) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('fname', userId);
}
Future<String?> getUserName() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('name');
  return userId;
}

Future setUserName(String userId) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('name', userId);
}
Future<String?> getUserId() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('userId');
  return userId;
}

Future setUserId(String userId) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userId', userId);
}


Future<String?> getTokenId() async{
  final prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('token');
  ConsoleLogUtils.printLog('token:$userId');
  return userId;
}

Future setTokenId(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

Future<String?> getFCMToken() async{
  final prefs = await SharedPreferences.getInstance();
  final String? fcm = prefs.getString('fcm_token');
  ConsoleLogUtils.printLog('fcm:$fcm');
  return fcm;
}

Future setFCMToken(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('fcm_token', token);
}


Future<bool?> getOtpScreen() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('otp_screen');
  return userId;
}

Future setOtpScreen(bool token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('otp_screen', token);
}



Future<bool?> getOtpScreenEmail() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('otp_screen_email');
  return userId;
}

Future setOtpScreenEmail(bool token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('otp_screen_email', token);
}

Future<bool?> getOtpScreenPhone() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('otp_screen_phone');
  return userId;
}

Future setOtpScreenPhone(bool token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('otp_screen_phone', token);
}

Future<bool?> getProfileScreen() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('profile_screen');
  return userId;
}

Future setProfileScreen(bool token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('profile_screen', token);
}

Future<String?> getprofile_initial_color() async{
  final prefs = await SharedPreferences.getInstance();
  final String? profile_initial_color= prefs.getString('profile_initial_color');
  return profile_initial_color;
}

Future setprofile_initial_color(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('profile_initial_color', token);
}
Future<String?> getprofile_initialr() async{
  final prefs = await SharedPreferences.getInstance();
  final String? profile_initial_color= prefs.getString('profile_initial');
  return profile_initial_color;
}

Future setprofile_initial(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('profile_initial', token);
}

Future<String?> getadmin_badge() async{
  final prefs = await SharedPreferences.getInstance();
  final String? profile_initial_color= prefs.getString('admin_badge');
  return profile_initial_color;
}

Future setadmin_badge(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('admin_badge', token);
}

Future<String?> getsubscription_ids() async{
  final prefs = await SharedPreferences.getInstance();
  final String? subscription_ids= prefs.getString('subscription_ids');
  return subscription_ids;
}

Future setsubscription_ids(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('subscription_ids', token);
}
Future<String?> getKeyUnidirectServic() async{
  final prefs = await SharedPreferences.getInstance();
  final String? subscription_ids= prefs.getString('unidirect_se');
  return subscription_ids;
}

Future setKeyUnidirectServic(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('unidirect_se', token);
}
Future<int?> getKeyis_service() async{
  final prefs = await SharedPreferences.getInstance();
  final int? subscription_ids= prefs.getInt('is_service');
  return subscription_ids;
}

Future setKeyis_service(int token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('is_service', token);
}

Future<String?> getKey_hide_buy_btn() async{
  final prefs = await SharedPreferences.getInstance();
  final String? subscription_ids= prefs.getString('hide_buy_btn');
  return subscription_ids;
}

Future setKey_hide_buy_btn(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('hide_buy_btn', token);
}


Future<bool?> getLoggedIn() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('isloggedin');
  return userId;
}

Future setLogin(bool token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isloggedin', token);
}



Future setLogout(bool token, BuildContext context) async
{


  setUserId('');
  setTokenId('');
  final pref = await SharedPreferences.getInstance();
  await pref.clear();
  Api().getTokenLogout();

  setFirebaseDelegateInstance(true);
  Future.delayed(const Duration(seconds: 1), () {
    if (Platform.isIOS) {
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context){
        return SignInScreen();
      }), (r){
        return false;
      });
    }
    else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
        return SignInScreen();
      }), (r){
        return false;
      });
    }

    // Navigator.of(context).pushNamedAndRemoveUntil('/landingpage', (Route<dynamic> route) => false);


  });
}

Future<String?> getversionCode() async
{
  final info = await PackageInfo.fromPlatform();
  String versionCode="";
  if(Platform.isAndroid)
  {
    versionCode =  info.buildNumber;
  }
  else
  {
    versionCode =  info.buildNumber;
  }

  return versionCode;
}

Future<String?> getversionName() async{
  final info = await PackageInfo.fromPlatform();
  String versionName="";
  if(Platform.isAndroid)
  {
    versionName = info.version;
  }
  else
  {
    versionName = info.version;
  }
  return versionName;
}

Future<bool?> getFirstTime() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('first_time');
  return userId;
}

Future setFirstTime(bool token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('first_time', token);
}

Future<int?> getResendOTPCountForEmail() async{
  final prefs = await SharedPreferences.getInstance();
  final int? OTP_count= prefs.getInt('OTP_count_email');
  return OTP_count;

}

Future setResendOTPCountForEmail(int count) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('OTP_count_email', count);
}

Future<int?> getResendOTPCountForMobile() async{
  final prefs = await SharedPreferences.getInstance();
  final int? OTP_count= prefs.getInt('OTP_count_mobile');
  return OTP_count;
}

Future setResendOTPCountForMobile(int count) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('OTP_count_mobile', count);
}



Future<String?> getTodaysDateForResendOTP() async{
  final prefs = await SharedPreferences.getInstance();
  final String? today_date= prefs.getString('today_date');
  return today_date;
}

Future setTodaysDateForResendOTP(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('today_date', token);
}

/*Future<bool?> getNotiDot() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('notidot');
  return userId;
}

Future setNotiDot(bool token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('notidot', token);
}*/

Future setemail_verifiedr(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('email_verified', token);
}
Future<String?> getemail_verified() async{
  final prefs = await SharedPreferences.getInstance();
  final String? email_verified= prefs.getString('email_verified');
  return email_verified;
}


Future setmobile_verified(String token) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('mobile_verified', token);
}
Future<String?> getmobile_verified() async{
  final prefs = await SharedPreferences.getInstance();
  final String? mobile_verified= prefs.getString('mobile_verified');
  return mobile_verified;
}


Future setHideMobileVerify(String hide_mobile_verify) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('hide_mobile_verify', hide_mobile_verify);
}
Future<String?> getHideMobileVerify() async{
  final prefs = await SharedPreferences.getInstance();
  final String? hide_mobile_verify= prefs.getString('hide_mobile_verify');
  return hide_mobile_verify;
}


Future<bool?> getFirebaseDelegateInstance() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('FirebaseInstance');
  return userId;
}

Future setFirebaseDelegateInstance(bool instanceVal) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('FirebaseInstance', instanceVal);
}


Future<bool?> getDashboardScreenInstance() async{
  final prefs = await SharedPreferences.getInstance();
  final bool? userId = prefs.getBool('DashboardScreen');
  return userId;
}

Future setDashboardScreenInstance(bool instanceVal) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('DashboardScreen', instanceVal);
}
Future<int?> getViewedNotificationCount() async{
  final prefs = await SharedPreferences.getInstance();
  final int? apnCount= prefs.getInt('ViewedAPNCount');
  return apnCount;
}

