

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:q_app/core/presentation/home_slider_carousel.dart';
import 'package:q_app/core/presentation/upload_aecb_report.dart';

import '../widgets/profile_icon_widget.dart';
import 'my_products_widget.dart';




class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreen createState() => _MyHomeScreen();
}
class _MyHomeScreen extends State<MyHomeScreen>with SingleTickerProviderStateMixin {
  bool obscureText = true;
  bool acceptedTerms = false;
  bool loadershow=true;
  bool phonevalidation=false;
  bool showNumberValidation=false;
  var country_code='';
  var phone_code='';


  TextEditingController textEditingControllerPhone= TextEditingController();

  TextEditingController phoneController = TextEditingController();
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

  Widget getBody() {
    List<Map<String, dynamic>> sliderData = [
      {
        'title': 'Slide 1',
        'description': 'Description for slide 1',
        'image ': 'assets/images/product1.png',

      },
      {
        'title': 'Slide 2',
        'description': 'Description for slide 2',
        'image ': 'assets/images/product2.png',

      },
      {
        'title': 'Slide 3',
        'description': 'Description for slide 3',
        'image ': 'assets/images/product1.png',

      },
      {
        'title': 'Slide 3',
        'description': 'Description for slide 3',
        'image ': 'assets/images/product1.png',

      },
      // Add more items as needed
    ];

    List<Map<String, dynamic>> faqdaat = [
      {
        'title': 'Gives Personalized recommendations',
        'description': 'Description for slide 1',
      },
      {
        'title': 'Easy to use',
        'description': 'Description for slide 2',
        'image ': 'assets/images/product2.png',
      },
      {
        'title': 'Easy to navigate',
        'description': 'Description for slide 3',
      },
      // Add more items as needed
    ];
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
    return SingleChildScrollView
      (
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.34,
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
          ),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60,bottom: 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  elevation: 6.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Wrap(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                            child: new Text(
                              'Welcome to Q App',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: Color.fromRGBO(40, 44, 53, 1),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 0, left: 100),
                            child: ProfileIconWidget(),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            child: const Text(
                              "Hi! Amar Ahamed",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(40, 44, 53, 1),
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: const Divider(
                              height: 1,
                              color: Color.fromRGBO(243, 243, 243, 1),
                              thickness: 1,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromRGBO(250, 251, 252, 0),
                                  Color.fromRGBO(41, 80, 237, 0.1),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Future.delayed(const Duration(milliseconds: 100), ()
                                        {
                                          // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => UploadAecbReport()),
                                          );
                                        });
                                        // Add your click event handling code here
                                        print('Container clicked!');
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 8),
                                        child: SvgPicture.asset(
                                          'assets/images/upload_icon.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                    ,
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Upload your AECB Report ',
                                          style: TextStyle(
                                            color: Color.fromRGBO(41, 80, 237, 1),
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'to get Personalized',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Recommendations',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 30.0, left: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Get ',
                                            style: TextStyle(
                                              color: Color.fromRGBO(40, 44, 53, 1),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            '100 Q-coins',
                                            style: TextStyle(
                                              color: Color.fromRGBO(40, 44, 53, 1),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Poppins',
                                              fontSize: 24,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            'on uploading AECB',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(113, 117, 124, 1),
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            ' Report!!!!!',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(113, 117, 124, 1),
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: SvgPicture.asset(
                                        'assets/images/iustration.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 120.0), // Adjusted from Padding to SizedBox
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              HomeSliderCarousel(sliderData: const []),
              Container(
                height: 52,
                margin: const EdgeInsets.only(top: 20, right: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromRGBO(41, 80, 237, 1),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.0), // Adjust left padding as needed
                      child: Text('My products', // Use the data from the list
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            /*  Container(
                margin: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                child: const Text(
                  'My products ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    color: Color.fromRGBO(40, 44, 53, 1),
                  ),
                ),
              ),*/

              Container(
                margin: const EdgeInsets.only( right: 0, left: 20,top: 20),
                width: MediaQuery.of(context).size.width, // Set width to match screen width
                child:GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items in each row
                    crossAxisSpacing: 10.0, // Spacing between grid items horizontally
                    mainAxisSpacing: 10.0, // Spacing between grid items vertically
                  ),
                  itemCount: sliderData.length,
                  itemBuilder: (context, index) {
                    // Add spacing between images

                    return Padding(
                      padding: EdgeInsets.only(right: 15.0), // Adjust spacing as needed
                      child: Container(

                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: CachedNetworkImage(
                            imageUrl: "", // Add your image URL here
                            errorWidget: (context, url, error) => Image.asset(
                              (index==0) ? 'assets/images/product1.png':  (index==1) ? 'assets/images/loan.png' :  (index==3) ? 'assets/images/auto_loan.png':'assets/images/mortagaes.png',
                              width: 165,
                              height: 176,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )



                /*ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sliderData.length,
                  itemBuilder: (context, index) {
                    // Add spacing between images
                    return Padding(
                      padding: EdgeInsets.only(right: 15.0), // Adjust spacing as needed
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.36,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          child: CachedNetworkImage(
                            imageUrl: "", // Add your image URL here
                            errorWidget: (context, url, error) => Image.asset(
                              (index==0) ? 'assets/images/product1.png':'assets/images/product2.png',
                              width: 150,
                              height: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),*/

              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                child: const Text(
                  'Why Q Report?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    color: Color.fromRGBO(40, 44, 53, 1),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: faqdaat.length,
                  itemBuilder: (context, index) {
                    // Add spacing between images
                    return
                      Container(
                      height: 72,
                      margin: const EdgeInsets.only(top: 20, right: 5, bottom: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        elevation: 6.0,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22.0), // Adjust left padding as needed
                            child: Text(
                              faqdaat[index]['title'], // Use the data from the list
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(40, 44, 53, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                  },
                ),

              ),

              Container(
                margin: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                child: const Text(
                  'Approval Chances',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    color: Color.fromRGBO(40, 44, 53, 1),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: loanappdaat.length,
                  itemBuilder: (context, index) {
                    // Add spacing between images
                    return
                      Container(
                        height: 75,
                        margin: const EdgeInsets.only(top: 20, right: 5, bottom: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          elevation: 6.0,
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 22.0), // Adjust left padding as needed
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center, // Align text vertically with the start of the line
                                children: [
                                  Text(
                                    loanappdaat[index]['title'], // Use the data from the list
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(40, 44, 53, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top:1,right: 10),
                                          child: CircularPercentIndicator(
                                            radius: 27.0,
                                            lineWidth: 5.0,
                                            percent: 0.20,
                                            center: Text("20%"),
                                            progressColor: Color.fromRGBO(251, 33, 32, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ),
                      );

                  },
                ),

              ),

            /*  MyProductsWidget(sliderData: const [])*/

              /* Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color:  Color.fromRGBO(255, 211, 226, 1), // Change the color as needed
                              width: 1.0, // Set the width of the border
                            ),
                          ),
                          color: (index==0) ? Color.fromRGBO(255, 211, 226, 1) : (index==1)  ? Color.fromRGBO(163, 207, 248, 1):Color.fromRGBO(252, 237, 209, 11),
                          child: Container(
                            child: Center(
                              child: Text(
                                sliderData[index].toString(), // Use the data from the list
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.0,
                                ),
                              ),
                            ),
                          ),
                        )*/

            ],
          ),

        ],
      ),
    );
  }




}
