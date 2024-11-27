import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';



import 'package:q_app/core/presentation/apply_for_personal_loan.dart';
import 'package:q_app/core/presentation/signup_screen.dart';

import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';
/*import '../loan_form/profile_main_tab.dart';
import '../loan_form/tmp_insurance_field.dart';*/
class ProductTypeDeatils extends StatefulWidget {
  ProductTypeDeatils({Key? key, required this.type, required this.text, required this.item}) : super(key: key);
final String type;
final String text;
dynamic item;


  @override
  _ProductTypeDeatils createState() => _ProductTypeDeatils();
}
class _ProductTypeDeatils extends State<ProductTypeDeatils>with SingleTickerProviderStateMixin {

  List<dynamic> loanappdaat =[];
/*  List<Map<String, dynamic>> loanappdaat = [
    {
      'title': ' personal loan',
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
  ];*/
  late Future _dataFuture;
  @override
  void initState() {
    super.initState();
    _dataFuture = fetchData();
  }

  @override
  void dispose() {
    // Dispose the TabController to release resources
    super.dispose();
  }
/*  'id': '2',
  'title': 'Credit Card',
  'description': 'Buy now, pay later with a credit card.',
  'list_header': 'Your personalized credit card recommendations',
  'image ': 'assets/images/product2.png',*/

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
              child: Text(widget.item['title'],
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
                  child: Text('Security for you & your loved ones',
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
        body: FutureBuilder(
          future:_dataFuture,
          builder: (context, snapshot)
          {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }/* else if (snapshot.hasError)
          {
            return Center(child: Text( 'No data available.'));
          }*/
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
      color: const Color.fromRGBO(250, 251, 252, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
           // child:  Text('widget.item['list_header']',
            child:  Text('Your recommendations here.',
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
    );
  }

  Widget getListingBody(dynamic productItem,int idx)
  {
    return
      GestureDetector(
          onTap: ()
          {

          }
          /*{
            if(productItem['product_type']==10)
            {
              if (Platform.isIOS) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) =>
                      HomeInsuranceField(type:widget.type, text: widget.text)
                  ),
                );
              }
              else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      HomeInsuranceField(type:widget.type, text: widget.text)),
                );
              }
            }
           else if(productItem['product_type']==7)
            {
              if (Platform.isIOS) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) =>
                      MotorInsuranceField(type:widget.type, text: widget.text)
                  ),
                );
              }
              else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MotorInsuranceField(type:widget.type, text: widget.text)),
                );
              }
            }
            else if(productItem['product_type']==9)
            {
              if (Platform.isIOS) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) =>
                      TmpInsuranceField(type:widget.type, text: widget.text)
                  ),
                );
              }
              else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      TmpInsuranceField(type:widget.type, text: widget.text)),
                );
              }
            }
            else
            {
              if (Platform.isIOS) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) =>
                      ProfileMainTab(type:widget.type, text: widget.text,product_id:productItem['product_id'])
                  ),
                );
              }
              else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ProfileMainTab(type:widget.type, text: widget.text,product_id:productItem['product_id'])),
                );
              }
            }

          }*/,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
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
                          'assets/images/q_reco.png',

                        ),
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // _showCreditCardDialog(context,univItem);
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(15, 10, 5, 15),
                          child: Column(
                            children: [
                              Container(
                                //color: Colors.greenAccent,
                                child:   Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(productItem['title'],
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Color.fromRGBO(74, 74, 74, 1),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0),
                                      ),
                                    ),),
                                    SizedBox(width: 5,),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              /*  Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Rs 40,36,108',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color:  const Color.fromRGBO(4, 153, 237, 1),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.0),
                                ),
                              ),*/
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
                    Container(
                      margin: const EdgeInsets.only(top:15,right: 10),
                      child: Image.asset('assets/images/round_btn.png', height: 24, width: 24), //,
                    )
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(left: 10,top: 5),
                  child: const Divider(
                    height: 1,
                    color: Color.fromRGBO(193, 199, 208, 1),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ));
  }



  fetchData() async
  {
    var data = {
      'product_type': widget.type,
    };

    var response  = (await Api().getProducts(context,data))!;
    if (response!=null)
    {

      var newResponse = json.decode(response);
      var status=newResponse['status'] ?? '';
      ConsoleLogUtils.printLog('homeResponse:$newResponse');

      if(status==true)
      {
        dynamic jsonData = jsonDecode(response);
        loanappdaat=jsonData['data'];
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

