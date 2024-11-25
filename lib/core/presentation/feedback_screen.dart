import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import 'package:flutter/gestures.dart';
import 'package:q_app/core/console_utils.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../constants/constants.dart';


class FeedbackScreen extends StatefulWidget
{
  FeedbackScreen({Key? key}) : super(key: key);
  @override
  _FeedbackScreen createState() => _FeedbackScreen();
}
class _FeedbackScreen extends State<FeedbackScreen>with SingleTickerProviderStateMixin {

  List<int>openedIndex=[];
  int selectedIndex=-1;
  var rating = 5.0;
  double _currentSliderValue = 80;
  final blueLightColor = Color.fromRGBO(40, 44, 53, 1);
  var _commentText = TextEditingController();
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
        resizeToAvoidBottomInset : true,
        appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: const Text(
                'Feedback',
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
  {
    List<Map<String, dynamic>> item = [
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
    return SingleChildScrollView(

      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'How was your experience',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(30, 30, 30, 1),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500 ,

                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'with the Q',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(30, 30, 30, 1),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500 ,

                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                      child: Image.asset('assets/images/feedback_men.png',
                        height: 102, width: 102,)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Center(
                    child: Text(
                      'Great',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(30, 30, 30, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500 ,

                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20,left: 10),
                    child: SmoothStarRating(
                      allowHalfRating: true,
                      onRatingChanged: (v) {
                        setState(() {
                          rating = v;

                        });
                      },
                      starCount: 5,
                      rating: rating,
                      size: 40.0,
                      color: Color.fromRGBO(250, 204, 10, 1),
                      borderColor: Color.fromRGBO(250, 204, 10, 1),
                      spacing: 35.0,
                    ),
                    ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  // color: Colors.yellow,
                  padding: EdgeInsets.zero,
                  height: 15,
                  child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                   trackHeight: 2.0, // Adjust the height of the track
                 thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0), // Adjust the size of the thumb
                 overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0), // Adjust the size of the overlay (if needed)


                  ),
                  child: Slider(
                    value: _currentSliderValue,
                    max: 100,
                    activeColor:Color.fromRGBO(40, 44, 53, 1),
                    inactiveColor:  Color.fromRGBO(40, 44, 53, 1),
                    thumbColor:Color.fromRGBO(40, 44, 53, 1),
                    divisions: 4,
                    autofocus:false,
                    // label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        ConsoleLogUtils.printLog('nanana $value');
                      });
                    },
                  ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50,left: 22),
                    child: Text(
                      'Write review',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(40, 47, 60, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,

                      ),
                    ),

                ),
                Container(
                  width: (MediaQuery.of(context).size.width),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10),),
                    border: Border.all(
                      color: Color.fromRGBO(234, 235, 241, 1), //                   <--- border color
                      width: 1.0,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                  child: TextField(

                    controller: _commentText,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    minLines: 1,
                    onChanged: (text) {
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      fillColor:Colors.transparent,
                      filled: true,
                      border:InputBorder.none,
                      hintText: "Start typing here...",
                      hintStyle: TextStyle(fontSize: 16,
                        color: Color.fromRGBO(193, 199, 208, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400 ,
                      ),
                    ),
                  ),

                ),
                  ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            top:50,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              child: Container(
                height: 42,
                margin: EdgeInsets.all(20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Constants.buttonColor,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: ()
                  {

                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }


                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          )



        ],
      )


    );
  }

}

