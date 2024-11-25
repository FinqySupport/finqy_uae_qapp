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
import 'package:q_app/core/presentation/apply_for_personal_loan.dart';
import 'package:q_app/core/presentation/signup_screen.dart';

import '../console_utils.dart';
import '../constants/constants.dart';
import '../utils/color_constant.dart';
import '../utils/custom_image_view.dart';
import '../widgets/custom_appbar_widgets.dart';
import '../widgets/custom_headerinfo_signup.dart';
import '../widgets/gradientappBar.dart';
import 'otp_verification.dart';



class LoanTypeDeatils extends StatefulWidget {
  LoanTypeDeatils({Key? key, required this.type, required this.text}) : super(key: key);
final String type;
final String text;

  @override
  _LoanTypeDeatils createState() => _LoanTypeDeatils();
}
class _LoanTypeDeatils extends State<LoanTypeDeatils>with SingleTickerProviderStateMixin {


  List<Map<String, dynamic>> loanappdaat = [
    {
      'title': 'Emirates NBD loan',
      'description': 'Description for slide 1',
    },
    {
      'title': 'Alliance Insurance',
      'description': 'Description for slide 2',
      'image ': 'assets/images/product2.png',
    },
    {
      'title': 'Marriott Bonvoy',
      'description': 'Description for slide 3',
    },
    // Add more items as needed
  ];
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
    ConsoleLogUtils.printLog('annana: ${widget.type}');
    return Scaffold(
        backgroundColor: Colors.white,
         resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Text((widget.type == "Credit") ?
              'Credit Card':'Personal Loans',
                style: TextStyle(fontSize: 18,
                  color: Color.fromRGBO(40, 44, 53, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500 ,
                ),
              ),
            ),
            Row(

              children: [
                Container(
                  child: Text((widget.type == "Credit") ?'Buy now, pay later with a credit card.'
            :'Security for you & your loved ones',
                    style: TextStyle(fontSize: 16,
                      color: Color.fromRGBO(113, 117, 124, 1),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400 ,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: Container(
          margin: const EdgeInsets.only(top: 20,left: 5),
          child: IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.arrow_back_outlined,
              color:Color.fromRGBO(40, 44, 53, 1),
            ), onPressed: () {
            Navigator.of(context).pop();
          },
          ),
        ),

      ),



        body:getBody(),

    );
  }

  Widget getBody() {
    return Container(
      color: const Color.fromRGBO(250, 251, 252, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
            child:  Text((widget.type=='Credit') ?
            'Best Credit Card Options for you':widget.text,
              style: TextStyle(
                color: Color.fromRGBO(40, 44, 53, 1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18,

              ),
            ),
          ),

          Expanded(
            child:ListView.builder(
                itemCount: loanappdaat.length,
                itemBuilder: (BuildContext context, int index) {
                  return getListingBody(loanappdaat[index],index);

                } ),
          ),
        ],
      ),
    )
    ;
  }

  Widget getListingBody(dynamic univItem,int idx){

    return
      GestureDetector(
        onTap: ()
          {
            if (Platform.isIOS) {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) =>
                    ApplyForPersonalLoan(type:widget.type, text: widget.text,)
                ),
              );
            }
            else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    ApplyForPersonalLoan(type:widget.type, text: widget.text,)),
              );
            }
          },
      child: Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  const BorderRadius.all(Radius.circular(6),),
        border: Border.all(
          color: Constants.textBorderColor, //                   <--- border color
          width: 1.0,
        ),
      ),

      child:Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10,top: 10),
                height: 50,
                width: 50,
                //color: Colors.greenAccent,
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: '',
                  errorWidget:(context, url, error) => Image.asset(
                    (widget.type == "Credit") ?
                   'assets/images/credit_logo.png': 'assets/images/logo_loan.png',


                ),
              ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 5, 15),
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.greenAccent,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  (widget.type == "Credit") ? 'Etihad Guest Visa Elevate':
                                  'AED 1,00,000 Personal Loan ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
                                ),
                              ),),
                              SizedBox(width: 5,),

                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                         Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (widget.type == "Credit") ?
                            'Welcome bonus up to 200,000\nEtihad guest miles':
                            'Reducing rate: 7% ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color:  (widget.type == "Credit") ? Color.fromRGBO(113, 117, 124, 1): Color.fromRGBO(4, 153, 237, 1),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0),
                          ),
                        ),

                          if((widget.type != "Credit"))
                          const Padding(

                            padding: EdgeInsets.only(top: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              //
                              child: Text('Minimum Salary (AED): 5,000',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color.fromRGBO(113, 117, 124, 1),
                                    // backgroundColor: Colors.greenAccent,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  /*
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            width: 30,
                            margin: EdgeInsets.only(right: 10),
                            //color: Colors.yellow,
                            child: IconButton(
                              icon:isInProcess?SvgPicture.asset('assets/images/down_arrow.svg'):(application_status==0? SvgPicture.asset('assets/images/univ_delete.svg'):SvgPicture.asset('assets/images/down_arrow.svg')),
                              // color: Colors.orangeAccent,
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {
                                if(isInProcess){
                                  print('arrow');
                                  selectedIndex=idx;

                                  if(openedIdx.contains(idx)){
                                    openedIdx.remove(idx);
                                  }
                                  else{
                                    openedIdx.clear();
                                    openedIdx.add(idx);
                                  }
                                  setState(() {
                                    print('selectedIndex:$selectedIndex');
                                  });
                                }
                                else {

                                  if (application_status==0) {
                                    _showMyDialog(univItem);
                                  }
                                  else {
                                    print('arrow1');

                                    selectedIndex=idx;
                                    if(openedIdx.contains(idx)){
                                      openedIdx.remove(idx);
                                    }
                                    else{
                                      openedIdx.clear();
                                      openedIdx.add(idx);
                                    }
                                    setState(() {

                                    });
                                  }

                                }
                              },
                            ),
                          ),
                        ],
                      ),*/
                ),
              ),
            ],
          ),


        ],
      ),
    ));
  }


}

