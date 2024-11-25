import 'package:flutter/material.dart';
import 'package:q_app/core/presentation/signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  List<OnboardingPageModel> onboardingPages = [
    OnboardingPageModel(
      image: 'assets/images/onboarding2.png',
      title: 'Free Credit Analysis Report',
      description: 'Simple overview of your Personal Finance in one Report',
    ),
    OnboardingPageModel(
      image: 'assets/images/onboarding1.png',
      title: 'Save Thousands in EMIs'
      ,
      description: 'Consolidate your debts and save on your high interest loans',
    ),
    OnboardingPageModel(
      image: 'assets/images/onboarding3.png',
      title: 'Instant Loan Eligibility.             ',
      description: 'Get personalized loan recommendations based on your credit score',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


   /*   appBar: AppBar(
        title: Text('Onboarding'),
      ),*/
      body: Container(
       /* decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromRGBO(51, 184, 255, 1.0),
              Color.fromRGBO(51, 184, 255, 1.0),

            ],
          ),
        ),
*/

          child: Column(
            children: [
              Container(
                 decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromRGBO(245, 247, 255, 1),
              Color.fromRGBO(245, 247, 255, 1),

            ],
          ),
        ),
                  child: buildTopIndicatorLine()),
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: onboardingPages.length,
                      itemBuilder: (context, index) {
                        return OnboardingPage(
                          onboardingPages[index],
                        );
                      },
                    ),
                   // buildSliderLine(),
                  ],
                ),
              ),
              buildBottomButton(),
            ],
          ),

      ),
    );
  }

  Widget buildTopIndicatorLine() {
    double indicatorSpacing = 2.0; // Adjust the spacing between indicators as needed
    double startEndMargin = 5.0; // Adjust the margin at the start and end as needed
    double endMargin = 5.0; // Adjust the margin at the start and end as needed

    return Container(

      margin: const EdgeInsets.only(top: 60),
      height: 3, // Height of the indicator line
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: onboardingPages.length + 2, // Add 2 extra items for start and end margin
        separatorBuilder: (context, index) => SizedBox(width: indicatorSpacing),
        itemBuilder: (context, index) {
          if (index == 0) {
            // Extra items for start and end margin
            return SizedBox(width: index == 0 ? startEndMargin : endMargin);
          } else {
            // Regular indicator items
            final adjustedIndex = index - 1; // Adjusted index after accounting for extra items
            return Container(
              width: MediaQuery.of(context).size.width / onboardingPages.length, // Equal width for each indicator
              height: 4,
              color: _currentPage == adjustedIndex ? const Color.fromRGBO(40, 44, 53, 1) : const Color.fromRGBO(193, 199, 208, 1),
            );
          }
        },
      ),
    );
  }


  Widget buildBottomButton() {
    return Container(

      margin: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
          height: 42,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(41, 80, 237, 1),
              padding: const EdgeInsets.only(left: 16, right: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.0,
              ),
            ),
            onPressed: () {
              Future.delayed(const Duration(milliseconds: 100), () {
                // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              });
            },
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Let’s Get Started'),
                Image.asset(
                  'assets/images/onboarding_getting.png', // Replace 'your_image.png' with your image path
                  width: 24, // Adjust width and height as needed
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel pageModel;
  OnboardingPage(this.pageModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/onboarding_bg.png'), // Replace 'background_image.jpg' with your image asset path
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color.fromRGBO(245, 247, 255, 1),
                          Color.fromRGBO(245, 247, 255, 1),

                        ],
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        pageModel.image,
                        height: 200,
                        width: 200,
                      ),
                    ),


                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color.fromRGBO(245, 247, 255, 1),
                        Color.fromRGBO(245, 247, 255, 1),
                      ],
                    ),
                  ),
                  child:  Container(

                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: const BoxDecoration(

                      color: Colors.white,
                      borderRadius:BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                    ),

                    //signup_bottom
                    child:Stack(
                      children: [


                        Column(
                          children: [


                            const SizedBox(height: 20,),
                            Expanded(
                              // height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 20,top: 10,right: 20),
                                    child: Text(

                                      pageModel.title,
                                      style: const TextStyle(fontSize: 22,
                                        color: Color.fromRGBO(40, 44, 53, 1),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600 ,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20,top: 10,right: 10),
                                    child: Text(
                                      pageModel.description,
                                      style: const TextStyle(fontSize: 16,
                                        color: Color.fromRGBO(113, 117, 124, 1),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400 ,
                                      ),
                                    ),
                                  ),
                                   Container(
                                     margin: const EdgeInsets.only(left: 20,top: 20,right: 10),
                                     child: const Text(
                                      'Ready to go?',
                                       style: TextStyle(fontSize: 14,
                                         color: Color.fromRGBO(113, 117, 124, 1),
                                         fontFamily: 'Poppins',
                                         fontWeight: FontWeight.w400 ,
                                       ),
                                  ),
                                   ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),

                  ),
                ),
              ],
            ),

          ),
        ],
      ),
    );
 /*   return Container(


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pageModel.image,
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 16),

          Container(
          *//*  decoration: const BoxDecoration(

              color: Colors.white,
              borderRadius:BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            ),
*//*
            child: Column(
              children: [
                      Text(
                    textAlign: TextAlign.start,
                    pageModel.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 8),
                Text(
                  pageModel.description,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Ready to go?',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14,
                      color: Color.fromRGBO(113, 117, 124, 1)),
                ),
              ],
            ),
          ),

        ],
      ),
    );*/
  }
}

class OnboardingPageModel {
  final String image;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
