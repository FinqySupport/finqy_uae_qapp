
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../console_utils.dart';
import '../constants/constants.dart';
import 'loan_type_deatils.dart';




class HomeSliderCarousel extends StatefulWidget {
  HomeSliderCarousel({Key? key,required this.sliderData}) : super(key: key);
  List<dynamic> sliderData=[];
  @override
  _HomeSliderCarousel createState() => _HomeSliderCarousel();
}

class _HomeSliderCarousel extends State<HomeSliderCarousel> {
  int currentIndex = 0;
  CarouselSliderController controller = CarouselSliderController();
  List<Map<String, dynamic>> sliderData = [
    {
      'title': 'Slide 1',
      'description': 'Description for slide 1',

    },
    {
      'title': 'Slide 2',
      'description': 'Description for slide 2',

    },
    {
      'title': 'Slide 3',
      'description': 'Description for slide 3',

    },
    // Add more items as needed
  ];

  @override
  void dispose() {
    // Dispose the TabController to release resources
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width*0.8;
    //  print('viewWidth:$viewWidth');
    double ratio1 = viewWidth / 1440;
    //  print('ratio1:$ratio1');
    double ratioH = 830 * ratio1;
    // print('ratioH:$ratioH');

    //ConsoleLogUtils.printLog('SliderData:${widget.sliderData}');
    // let size1 = CGSize(width: viewWidth, height: 638 * ratio1)


    return Container(
      // color:const Color.fromRGBO(250, 250, 250, 1),
      // color:Colors.pink,
        padding: const EdgeInsets.only(bottom: 0,top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Container(
                  // color: Colors.greenAccent,
                  padding: const EdgeInsets.only(top: 0,bottom: 0),
                  child: CarouselSlider(
                    carouselController: controller,
                    items: sliderData
                        .asMap()
                        .entries
                        .map((entry) {
                      int index1 = entry.key;
                      return imageContainer(index1);
                      //
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        height: ratioH,
                        //  aspectRatio: ratio1,
                        viewportFraction:0.8,
                        enlargeCenterPage: true,
                        onPageChanged: (index1, reason) {
                          setState(() {
                            currentIndex=index1;
                          });
                          // dotIndicator(index1);

                        }),
                  ),
                ),
                const SizedBox(height: 5,),
                dotIndicator(currentIndex),
                const SizedBox(height: 5,),
              ],
            ),

            // Divi
          ],
        )

    );
  }

  Widget dotIndicator(int currentIndex1) => DotsIndicator(
    dotsCount: sliderData.length,
    position: currentIndex.toDouble(),
    decorator: DotsDecorator(
      size: const Size.square(8.0),
      activeSize: const Size(18.0, 9.0),
      activeColor: Constants.appColor,
      color:const Color.fromRGBO(40, 44, 53, 1),
      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),
  );

  Widget imageContainer(int index1) {
    return GestureDetector(
      onTap: () async {


        Future.delayed(const Duration(milliseconds: 100), ()
        {
          // Replace 'HomeScreen()' with the name of the screen you want to navigate to after the splash screen.
          if(index1 == 0)
          {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoanTypeDeatils(type: 'Personal Loan', text: 'Your personalized loan\n recommendations',)),
            );
          }
          else if(index1 == 1)
          {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoanTypeDeatils(type: 'Personal Loans', text: 'Best Loan Options for you',)),
            );
          }
          else{
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoanTypeDeatils(type: 'Credit', text: 'Best Credit Card Options for you',)),
            );
          }

        });
      },
      child: Container(
        // margin:  EdgeInsets.only(top: 10,bottom: 10),
        /*  decoration: const BoxDecoration(
         // color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),*/
        // margin: EdgeInsets.only(top: 10),
        // color: Colors.pink,

        child: FractionallySizedBox(
          widthFactor: 1,
          //heightFactor: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: CachedNetworkImage(

              imageUrl: sliderData[index1]['title'],
              placeholder: (context, url) =>
                  Image.asset(
                    'assets/images/slider_image.png',
                    width: 350,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
              errorWidget: (context, url, error) =>
                  Image.asset(
                    'assets/images/slider_image.png',
                    width: 350,
                    height: 170,
                    fit: BoxFit.contain,
                  ),
            ),
          ),
        ),
      ),
    );
  }


}
