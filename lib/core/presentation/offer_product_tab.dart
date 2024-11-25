import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:q_app/core/presentation/signup_screen.dart';
import 'package:q_app/core/presentation/upload_aecb_report.dart';

import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'home_credit_analysis_report.dart';
import 'otp_verification.dart';


class OfferProductTab extends StatefulWidget {
  OfferProductTab({Key? key}) : super(key: key);

  @override
  _OfferProductTab createState() => _OfferProductTab();
}
class _OfferProductTab extends State<OfferProductTab>with SingleTickerProviderStateMixin {

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(250, 251, 252, 1),

      body:getBody(),


    );
  }

  Widget getBody()
  {
    return  SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width, // Match parent width
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: "", // Add your image URL here
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/offer_product.png',
                      width: 165,
                      height: 176,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }


}

