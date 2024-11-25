import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:q_app/core/utils/string_extension.dart';

import '../console_utils.dart';
import '../constants/constants.dart';


class FAQ_Screen extends StatefulWidget
{
  FAQ_Screen({Key? key}) : super(key: key);
  @override
  _FAQ_Screen createState() => _FAQ_Screen();
}
class _FAQ_Screen extends State<FAQ_Screen>with SingleTickerProviderStateMixin {

  List<int>openedIndex=[];
  int selectedIndex=-1;
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
              child: const Text(
                'FAQ’s',
                style: TextStyle(fontSize: 18,
                  color: Color.fromRGBO(40, 44, 53, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500 ,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: const Text(
                '',
                style: TextStyle(fontSize: 18,
                  color: Color.fromRGBO(40, 44, 53, 1),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500 ,
                ),
              ),
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

  Widget getBody()
  {  List<Map<String, dynamic>> item = [
    {
      'title': 'What is test my policy',
      'sub_description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
    },
    {
      'title': 'What is test my loan?',
      'sub_description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
      'image ': 'assets/images/product2.png',
    },
    {
      'title': 'How to check your credit score in the UAE?',
      'sub_description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
    },
    {
      'title': 'How to check your credit score in the UAE?',
      'sub_description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
    },
    {
      'title': 'What should I use Q?',
      'sub_description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
    },
    {
      'title': 'What is a Q recommendation reports?',
      'sub_description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
    },
    // Add more items as needed
  ];

    return Container(

      color: Color.fromRGBO(250, 251, 252, 1),
      child: SingleChildScrollView
        (
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              'Frequently Asked\nQuestions',
              style: TextStyle(
                fontSize: 38,
                color: Color.fromRGBO(30, 30, 30, 1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400 ,

              ),
            ),
          ),
          Container(

            child: SizedBox(
              height: MediaQuery.of(context).size.height, // or any fixed height you desire
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                      margin: EdgeInsets.only(left: 22,right: 22),
                      child: Divider(
                        height: 1,
                        color: Color.fromRGBO(243, 243, 243, 1),
                        thickness: 1,
                      ),
                    ), // Adds a divider between items

                itemCount: item.length,
                itemBuilder: (BuildContext context, int index) {
                  return getContainerBody(item[index],index);
                },
              ),
            ),
          )







        ],
      )
      ),
    );
  }
  Widget getContainerBody(dynamic data,int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:  GestureDetector(
                  onTap: () {
                    print('closeclicked');
                    if(openedIndex.contains(index)){
                      openedIndex.remove(index);
                    }
                    else {
                      openedIndex.add(index);
                    }
                    setState(() {
                      print('selectedIndex:$selectedIndex');
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                    child: Text('${data['title'].toString()}',
                      style: TextStyle(
                          color: Color.fromRGBO(40, 44, 53, 1),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon:(openedIndex.contains(index))?SvgPicture.asset('assets/images/expand_more.svg',):SvgPicture.asset('assets/images/expand_up.svg',),
                //iconSize: 30,
                onPressed: () {
                  if(openedIndex.contains(index)){
                    openedIndex.remove(index);
                  }
                  else {
                    openedIndex.add(index);
                  }

                  setState(() {
                    print('selectedIndex:$selectedIndex');
                  });
                },
              ),
            ],
          ),

          if(openedIndex.contains(index))
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 10, 10),

              child:HtmlWidget('${data['sub_description'].toString().stripHtmlIfNeeded(data['sub_description'].toString())}',
                textStyle:TextStyle(
                    color: Constants.appGreyMediumColor,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0),
              ),
            ),

        ],
      ),
    );
  }



}

