import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';

class HomeCreditAnalysisReport extends StatefulWidget {
  HomeCreditAnalysisReport({Key? key}) : super(key: key);

  @override
  _HomeCreditAnalysisReport createState() => _HomeCreditAnalysisReport();
}

class _HomeCreditAnalysisReport extends State<HomeCreditAnalysisReport>
    with SingleTickerProviderStateMixin {
  List<int> openedIndex = [];

  List<dynamic> credit_analysis=[];
  late Future _dataFuture;
  @override
  void initState() {
    super.initState();

    _dataFuture = fetchData();

  }
  fetchData() async
  {
    var response  = (await Api().getDashboard_Data(context))!;
    if (response!=null)
    {
      var newResponse = json.decode(response);
      ConsoleLogUtils.printLog('homeResponse:$newResponse');
      dynamic jsonData = jsonDecode(response);
      credit_analysis = jsonData['data']['credit_analysis'];

      for (int i = 0; i < credit_analysis.length; i++)
      {
        openedIndex.add(i);
      }

      return json.decode(response);
    } else {
      throw Exception('Failed to load data');
    }


  }
  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(250, 251, 252, 1),
      body: FutureBuilder(
        future:_dataFuture,
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                margin: EdgeInsets.only(top: 60),
                alignment: Alignment.topCenter,
                child: CircularProgressIndicator());
          } else if (snapshot.hasError)
          {
            return Center(child: Text( 'No data available.'));
          }
          else
          {
            return getBody();
          }
        },
      ),
    );
  }

  Widget getBody() {

    return Container(

      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 224,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(41, 80, 237, 1),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: CachedNetworkImage(
                          imageUrl: "",
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/download.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Text(
                        'Download full report',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(41, 80, 237, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 10, top: 15, left: 10),
                child: Text(
                  'Credit Analysis Report',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    color: Color.fromRGBO(40, 44, 53, 1),
                  ),
                ),
              ),

              Container(


                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        color: Colors.black,
                                        child: Container(
                                          margin: const EdgeInsets.all(16),
                                          child: const Text(
                                            'LIABILITIES',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        color: Colors.blueGrey,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 8, right: 2, top: 10, bottom: 10),
                                                child: Text(
                                                  'SANCTIONED',
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 26,
                                              child: VerticalDivider(
                                                width: 1,
                                                thickness: 2,
                                                endIndent: 3,
                                                color: Color.fromRGBO(248, 248, 248, 100),
                                              ),
                                            ),

                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 8, right: 5),
                                                child: const Text(
                                                  'OUTSTANDING',
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 26,
                                              child: VerticalDivider(
                                                width: 1,
                                                thickness: 2,
                                                endIndent: 3,
                                                color: Color.fromRGBO(248, 248, 248, 100),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 8, right: 0),
                                                child: Text(
                                                  'PAID\nPRINCIPAL',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 26,
                                              child: VerticalDivider(
                                                width: 1,
                                                thickness: 2,
                                                endIndent: 3,
                                                color: Color.fromRGBO(248, 248, 248, 100),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 8, right: 0),
                                                child: Text(
                                                  'EMI',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
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
                        ),
                      ),
                      /*Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.black,
                              child: Container(
                                margin: const EdgeInsets.only(left: 6, right: 6, top: 15, bottom: 15),
                                child: const Text('LIABILITIES', style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500)),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Colors.blueGrey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 4, right: 0, top: 15, bottom: 15),
                                        child: Text(
                                          'SANCTIONED',
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5, right: 0),
                                        child: const Text(
                                          'OUTSTANDING',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5, right: 0),
                                        child: Text(
                                          'PAID PRINCIPAL',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 14, right: 0),
                                        child: Text(
                                          'EMI',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),*/
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: credit_analysis.length,
                          itemBuilder: (context, index)
                          {
                            return getSectionHeader(credit_analysis[index], index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getSectionHeader(dynamic carddat, int index)
  {
    print('hiiii $carddat');
    return Container(
      margin: EdgeInsets.only(top: 10),
      /*  decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 1.0,
        ),
      ),*/
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (openedIndex.contains(index)) {
                  openedIndex.remove(index);
                } else {
                  openedIndex.add(index);
                }
              });
            },
            child: Container(

              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color.fromRGBO(51, 184, 255, 1.0),
                    Color.fromRGBO(112, 0, 224, 1),
                  ],
                ),
              ),

              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    carddat['product']?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    openedIndex.contains(index)
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          if (openedIndex.contains(index)) getListContainer(carddat['data']),
        ],
      ),
    );
  }

  Widget getListContainer(List<dynamic> data) {
    print(data);
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return getRowItem(data[index]);
        },
      ),
    );
  }

  Widget getRowItem(Map<String, dynamic> item)
  {
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      margin: EdgeInsets.only(top: 2, bottom: 0),
      /*decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[200],x`
      ),*/
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Color.fromRGBO(112, 0, 224, 1),
              ),
              child: SizedBox(
                width: 90, // Set the desired fixed width here
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Text(
                    item['institution'].toUpperCase(),
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis , // Add ellipsis if the text is too long
                  ),
                ),
              ),
            ),
          ),
          /*     Expanded(
              child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        color:Color.fromRGBO(112, 0, 224, 1),
      ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    item['institution'],
                            style: const TextStyle(fontSize: 9,    fontWeight: FontWeight.w500,
                            color:Colors.white),
                  ),
                ),
              ),
            ),
*/
          Expanded(

            child: Container(
              height: 50,

              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(240,240,240,100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10,right: 0),
                        child: Text(
                          Constants.indianNumberFormat.format( item['sanction']),

                          style: const TextStyle(fontSize: 10,    fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 2,
                        endIndent: 3,
                        color: Colors.grey,

                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8,right: 0),
                        child: Text(Constants.indianNumberFormat.format( item['sanction']),

                          style: const TextStyle(fontSize: 10,    fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 2,
                        endIndent: 3,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8,right: 0),
                        child: Text(Constants.indianNumberFormat.format( item['paid_principle']),
                          style: const TextStyle(fontSize: 10,    fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 2,
                        endIndent: 3,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8,right: 0),
                        child: Text(Constants.indianNumberFormat.format( item['emi']),
                          style: const TextStyle(fontSize: 10,    fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )






        ],
      ),
    );
  }
}
