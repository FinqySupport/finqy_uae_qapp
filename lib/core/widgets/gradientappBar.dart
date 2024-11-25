
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final LinearGradient gradient;
  final Widget? leading;

  GradientAppBar({
    required this.title,
    required this.gradient,
    this.leading,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: <Widget>[
          leading ?? Container(), // Display leading widget if provided
          Expanded(
            child: Center(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.headlineLarge!,
                child: title,
              ),
            ),
          ),
          SizedBox(width: kToolbarHeight), // Ensure enough space for back arrow
        ],
      ),
      decoration: BoxDecoration(gradient: gradient),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}