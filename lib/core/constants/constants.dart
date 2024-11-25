
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';


class Constants {

    static showLoader(BuildContext context) {
    return
      Loader.show(context,
          isSafeAreaOverlay: true,
          isBottomBarOverlay: true,
          isAppbarOverlay: true,
          progressIndicator: const CircularProgressIndicator());



  }

  static getGreyBGPlaceholder() {
    return Container(color: Colors.grey.shade200);
  }
  static const qAppColor = Color.fromRGBO(220, 176, 255, 1.0);
  static const buttonColor = Color.fromRGBO(41, 80, 237, 1.0);
  static const appColor = Color.fromRGBO(41, 80, 237, 1.0);
  static const appColorLight = Color.fromRGBO(118, 162, 249, 1);
  static const appGreyColor = Color.fromRGBO(157, 178, 206, 1);
  static const appGreyColor2 = Color.fromRGBO(159, 167, 179, 1);
  static const appGreyColor3 = Color.fromRGBO(79, 86, 97, 1);
  static const appGreyColor4 = Color.fromRGBO(234, 234, 234, 1);

  static const appGreyMediumColor = Color.fromRGBO(108, 113, 125, 1);
  static const appDarkGreyColor = Color.fromRGBO(0, 0, 0, 1.0);
  static const appLightGreyColor = Color.fromRGBO(249, 244, 244, 1);
  static const appBlueLightColor = Color.fromRGBO(239, 247, 255, 1);
  static const adminMsgColor = Color.fromRGBO(220, 230, 240, 1);
  static const paidButton = Color.fromRGBO(140, 255, 204, 1);
  static const paidButtonText = Color.fromRGBO(1, 99, 55, 1);
  //static const paidText = Color.fromRGBO(151, 151, 151, 1);
  static const paidText = Color.fromRGBO(80, 80, 80, 1);
  static const flashCardBG = Color.fromRGBO(45, 74, 214, 1);
  static const flashCardBG2 = Color.fromRGBO(52, 128, 255, 1);
  static const flashCardBG3 = Color.fromRGBO(186, 211, 255, 1);
  static const flashIncorrect = Color.fromRGBO(255, 0, 0, 1);
  static const flashCorrect = Color.fromRGBO(61, 187, 105, 1);
//rgba(, 187, 105, 1)
  static const paidlink = Color.fromRGBO(18, 191, 115, 1);
  static const uni_text = Color.fromRGBO(160, 168, 180, 1);
  static const poll_voteclose = Color.fromRGBO(158, 156, 156, 1);
  static const non_usa = Color.fromRGBO(29, 69, 139, 1);
  static const like_text = Color.fromRGBO(116, 116, 116, 1);
  static const heartRed = Color.fromRGBO(249, 38, 74, 1);
  static const ResendOTPCount = 10;

  static const tosterBGColor = Color.fromRGBO(0, 0, 0, 1.0);
  static const tosterTextColor = Color.fromRGBO(255, 255, 255, 1.0);

  //staging

  //  static const sendbirdAppId = 'EE188DC6-8AF4-412E-91DF-A9A90A26736E'; //Staging
  //  static const kMoengageID = '9VM8AKBPLEMMKUCQT2FXT4BD';//Test
  // static const Razorpay_Key = 'rzp_test_Sjm5Kq7CuuK0Vz';
  // static const  payment_type = "test";//test
  // static const  isLiveMode = "0";//test
  // static String IMAGE_BASE_URL=  "https://staging.cpconverge.com/";





  static const commentBoxColor = Color.fromRGBO(238, 245, 255, 1);
  static const replyBoxColor = Color.fromRGBO(246, 246, 246, 1);
  static const errorColor = Color.fromRGBO(253, 59, 59, 1);
  static const textBorderColor = Color.fromRGBO(234, 234, 234, 1);
  static const dropColor = Color.fromRGBO(248, 248, 248, 1);
  static const searchbgColor = Color.fromRGBO(217, 217, 217, 1);



  static const htmlTags=  ['a',	'abbr',	'acronym',	'address',	'article','aside'	,'audio','b','bdi','bdo','big',
    'blockquote',	'body'	,'br',	'caption',	'cite',	'code',	'data',	'dd',	'del',	'details','dfn',
    'div',	'dl',	'dt',	'em',	'figcaption',	'figure',	'footer',	'font',	'h1',	'h2',	'h3',
    'h4',	'h5',	'h6',	'header',	'hr',	'i',	'iframe',	'img',	'ins',	'kbd',	'li',
    'main',	'mark',	'nav',	'noscript',	'ol',	'p',	'pre'	,'q',	'rp',	'rt',	'ruby',
    's',	'samp',	'section',	'small',	'span',	'strike',	'strong',	'sub'	,'sup','summary',	'svg',
    'table',	'tbody',	'td'	,'template',	'tfoot',	'th',	'thead',	'time',	'tr',	'tt'	,'u',
    'ul',	'var',	'video',	'math:'	,'mrow'	,'msup'	,'msub'	,'mover',	'munder'	,'msubsup'	,'moverunder',
    'mfrac'	,'mlongdiv',	'msqrt',	'mroot',	'mi',	'mn'	,'mo'];



}


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;


  return Color.fromARGB(
      c.alpha,
      (c.red * f).round(),
      (c.green  * f).round(),
      (c.blue * f).round()
  );
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round()
  );
}
// usage
// final lightRed = lighten(Colors.red);
// final darkBlue = darken(Colors.blue, .3);

 bool containsPhoneNumber(String text) {
  final pattern = r'\+?\d{10} '; // Matches 10-digit numbers
  final regex = RegExp(pattern);
  return regex.hasMatch(text);
}
 const textBorderColor = Color.fromRGBO(234, 234, 234, 1);


