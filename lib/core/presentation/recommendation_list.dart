import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:q_app/core/presentation/product_type_deatils.dart';

import '../api/client.dart';
import '../console_utils.dart';

class RecommendationList extends StatefulWidget {
  RecommendationList({Key? key, required this.download}) : super(key: key);
  final bool download;

  @override
  _RecommendationList createState() => _RecommendationList();
}

class _RecommendationList extends State<RecommendationList> {
  late Future _dataFuture;
  var resultList;
  @override
  void initState() {
    super.initState();
    _dataFuture = qrecommendations();
    //_tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 251, 252, 1),
      body: getBody(),
    );
  }
  Widget getBody() {
    return FutureBuilder(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Recommmendation available'));
        } else {

          return body();
        }
      },
    );
  }
  Widget body() {
 /*   List<Map<String, dynamic>> recommendation_list = [
      {
        'title': 'Boost Your Rewards with a Smarter Credit Card Choice',
        'description_rec': 'Why settle for a basic credit card? If you already have one, let’s explore better options that offer incredible rewards and benefits just for you! And if you’re a first-time cardholder, we’ll guide you to the perfect card that turns your everyday spending into exciting rewards. Get ready to enjoy the perks you deserve!',
        'product_id': '1',
        'product_title': 'Credit Card',
        'list_header': 'Credit Card',
        'description': 'Buy now, pay later with a credit card.',
      },
      {
        'title': 'Take Personal Loan to Pay Off Your Credit Card Debt at a Lower Rate',
        'description_rec': 'Struggling with credit card debt? A personal loan offers a lower interest rate, allowing you to pay off your credit card balance and reduce your monthly payments. This switch makes managing your debt simpler and helps you save more in the long run.',
        'image ': 'assets/images/product2.png',
        'product_id': '2',
        'product_title': 'Personal Loans',
        'list_header': 'Personal Loans',
        'description': 'Security for you & your loved ones',
      },
      {
        'title': 'Save Money by Merging Your Personal Loans',
        'description_rec': 'If you have more than one personal loan, you can combine them into one. This way, you well pay a lower EMI each month, making it easier to manage your payments and save money. By closing your other loans and switching to a single loan, you can reduce your financial stress.',
        'product_id': '2',
        'product_title': 'Personal Loans',
        'list_header': 'Personal Loans',
        'description': 'Security for you & your loved ones',
      },
      {
        'title': 'Transition Your Personal Loan to a Home Loan and Save on EMIs',
        'description_rec': 'Transitioning from a Personal Loan (PL) to a Home Loan (HL) can significantly enhance your financial strategy. By making this switch, you can take advantage of lower interest rates and reduce your monthly payments, helping you manage your finances more effectively. This upgrade simplifies your debt management and unlocks the potential for savings, making it a smart choice for your financial future. Let us assist you in this beneficial transition!',
        'product_id': '5',
        'product_title': 'Home Loans',
        'list_header': 'Home Loans',
        'description': 'Security for you & your loved ones',
      },
      // Add more items as needed
    ];*/

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.download)
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 224,
              padding: const EdgeInsets.all(8), // Add padding here
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromRGBO(41, 80, 237, 1), // Change color as needed
                  width: 1,
                ),
              ),
              child: Center( // Center the text
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: CachedNetworkImage(
                        imageUrl: "", // Add your image URL here
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/download.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      'Download full report',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(41, 80, 237, 1),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                  ],
                ),
              ),
            ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 20.0, right: 25, left: 25),
            child: const Text(
              'Q Recommendation',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: 18.0,
                color: Color.fromRGBO(40, 44, 53, 1),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, right: 20),
            child: const Text(
              'According to your CREDIT analysis, we recommend',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 12.0,
                color: Color.fromRGBO(113, 117, 124, 1),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: resultList.length,
            itemBuilder: (context, index) {
              // Add spacing between images
              return getListingBody(resultList[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget getListingBody(dynamic univItem, int idx) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  height: 50,
                  width: 50,
                  //color: Colors.greenAccent,
                  child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    imageUrl: '',
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/q_reco.png',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showCreditCardDialog(context,univItem);
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 5, 15),
                      child: Column(
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(univItem['name'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                          const SizedBox(height: 5),
                       /*   Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Rs 40,36,108',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color.fromRGBO(4, 153, 237, 1),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0,
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, right: 10),
                  child: Image.asset('assets/images/round_btn.png', height: 24, width: 24), //,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: const Divider(
                height: 1,
                color: Color.fromRGBO(193, 199, 208, 1),
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _showCreditCardDialog(BuildContext context,dynamic univItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            univItem['title'],
            style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(30, 30, 30, 1),

              fontFamily: 'Poppins',),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(univItem['description_rec'],
                style: TextStyle(fontSize: 15,color: Color.fromRGBO(113, 117, 124, 1),
                    fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Set the button color to red
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog first
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductTypeDeatils(type: univItem['product_id'], text:univItem['product_title'],item:univItem)),
                  );
                },
                child: Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

            ],
          ),
          /*  actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],*/
        );
      },
    );
  }


  qrecommendations() async
  {
    var data =
    {
      //'order_id': widget.order_id,
    };

    var response  = (await Api().qrecommendations(context,data))!;
    if (response!=null)
    {
      var newResponse = json.decode(response);
      var status=newResponse['status'] ?? '';
      if(status==true)
      {
        ConsoleLogUtils.printLog('recommendationResponse:$newResponse');
        dynamic userMap = jsonDecode(response);
        resultList=userMap['data'];
        return json.decode(response);
      }
      else {

      }
    } else {
      print('nananan 111111111111');
      throw Exception('Failed to load data');
    }


  }
}
