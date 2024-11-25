

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';




class Offers_reward_screen extends StatefulWidget {
  const Offers_reward_screen({Key? key}) : super(key: key);

  @override
  _Offers_reward_screen createState() => _Offers_reward_screen();
}
class _Offers_reward_screen extends State<Offers_reward_screen>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;
  var country_code='';
  var phone_code='';


  TextEditingController textEditingControllerPhone= TextEditingController();

  TextEditingController phoneController = TextEditingController();

  List<Map<String, dynamic>> earnStep = [
    {
      'title': 'Every referral = ',
      'description': '100 Q Coins',
      'image ': 'assets/images/product1.png',

    },
    {
      'title': 'Every step completed = ',
      'description': '100 Q Coin',
      'image ': 'assets/images/product2.png',

    },
    {
      'title': 'Every referral = ',
      'description': '40 Q Coins',
      'image ': 'assets/images/product1.png',

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

    return Scaffold(
        body:getBody()

    );
  }


  Widget getBody()
  {
    return SingleChildScrollView
      (
      child:
      Stack(
        children: <Widget>
        [
          Container(
            height: MediaQuery.of(context).size.height * 0.32,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Color.fromRGBO(51, 184, 255, 1.0),
                  Color.fromRGBO(112, 0, 224, 1),
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child:  SvgPicture.asset('assets/images/reward_top.svg', height: 180, width: 120),
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Wrap(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15,left: 10),
                        child: IconButton(
                          alignment: Alignment.topLeft,
                          icon: const Icon(Icons.arrow_back_outlined,
                            color:Color.fromRGBO(255, 255, 255, 1),
                          ), onPressed: () {
                          Navigator.of(context).pop();
                        },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0,  left: 10),
                        child: new Text(
                          'Offers',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30,top: 45),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text(
                          'Q Coins',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 3),
                        Text(
                          'AED 200 Off',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'next product',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 3),


                      ],
                    ),
                  ),

                  Container(
                    height: 95,
                    margin: const EdgeInsets.only(top: 60),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,

                      margin: const EdgeInsets.symmetric(horizontal: 65.0),
                      child: Center(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 0),
                              child: const Align(
                                child: Text('450', // Use the data from the list
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(41, 80, 237, 1),
                                    fontSize: 45.0,
                                  ),

                                ),
                              ),
                            ),
                            Container(

                              child: const Align(
                                child: Text('Q-coins', // Use the data from the list
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(40, 44, 53, 1),
                                    fontSize: 20.0,
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),



                  SizedBox(
                    child: Container(


                      //color: Colors.blue.withOpacity(0.1),
                      child:ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),

                        itemCount: earnStep.length,
                        itemBuilder: (context, index) {

                          return Container(
                            margin: const EdgeInsets.only(left: 10,top: 15,right: 10),
                            decoration:  BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromRGBO(203, 203, 203, 0.1), // Your desired border color
                                // Border width
                              ),
                              borderRadius:const BorderRadius.all(Radius.circular(20)),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const SizedBox(width: 5,),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('GET',
                                          style: TextStyle(
                                              color: Color.fromRGBO(113, 117, 124, 1),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0),
                                        ),
                                        Text('200 OFF ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(243, 44, 111, 1),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24.0),
                                        ),
                                        SizedBox(height: 5,),
                                        Text('Only on credit Card Purchase etc',
                                          style: TextStyle(
                                              color: Color.fromRGBO(40, 44, 53, 1),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top:20,right: 10),
                                            child: Image.asset('assets/images/round_btn.png', height: 24, width: 24), //,
                                          )
                                        ],
                                      ),
                                    ),

                                  ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                ],
              ),


            ],
          ),


        ],
      ),

    );
  }




}

