

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavigationHandler {
  //static Future<void> vibrate() async {

    static Future<void> pushNav(BuildContext context,bool fullscreenDialog,WidgetBuilder builder_class) async {
    if(Platform.isIOS){
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => builder_class(context), fullscreenDialog: fullscreenDialog),
      );
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => builder_class(context), fullscreenDialog: fullscreenDialog),
      );
    }
  }
}
