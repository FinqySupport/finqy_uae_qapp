import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueA40001 = fromHex('#0c7bfd');

  static Color black9000a = fromHex('#0a000000');
  static Color gray90099 = fromHex('#99101828');
  static Color gray50 = fromHex('#f8f8f8');
  static Color gray500 = fromHex('#a3a4a7');
  static Color appColor = fromHex('#EFEFEF');

  static Color black900 = fromHex('#000000');

  static Color blueA400 = fromHex('#2772f5');

  static Color blue800 = fromHex('#004aca');

  static Color gray900 = fromHex('#18191a');
  static Color gray700 = fromHex('#101828');

  static Color blueGray700 = fromHex('#4f5661');

  static Color whiteA700 = fromHex('#ffffff');
  static Color white_otp = fromHex('#F9F4F4');
  static Color textcolor = fromHex('#A3A4A7');
  static Color textbordercolor = fromHex('#EAEBF1');
  static Color back = fromHex('#323232');
  static Color labelcolor = fromHex('#7C828C');
  static Color hintcolor = fromHex('#4F5661');
  static Color otpbordercolor = fromHex('#EAEBF1');
  static Color gray6000f = fromHex('#0f767680');

  static Color blueGray100 = fromHex('#d1d1d1');


  static Color blueGray400 = fromHex('#888888');


  static Color blueGray900 = fromHex('#2d3748');
  static Color otp_heder = fromHex('#2D3748');


  static Color gray100 = fromHex('#f9f4f4');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  static  Color hexToColor(String code) {
    if (code.startsWith('#')) {
      code = code.substring(1); // Remove the '#' character if it exists.
    }

    if (code.length == 6) {
      code = 'FF' + code;
    }
    else{
      code = 'FF' + '0C7BFD';
    }

    return Color(int.parse(code, radix: 16));

  }
}
