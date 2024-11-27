import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/client.dart';
import '../console_utils.dart';
import '../constants/constants.dart';


class FoirAnalysisReport extends StatefulWidget {
  FoirAnalysisReport({Key? key}) : super(key: key);

  @override
  _FoirAnalysisReport createState() => _FoirAnalysisReport();
}
class _FoirAnalysisReport extends State<FoirAnalysisReport>with SingleTickerProviderStateMixin {
  late Future _dataFuture;

  dynamic disposable_income;
  @override
  void initState() {
    super.initState();
    _dataFuture = fetchData();
    //_tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
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

    return  SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          DisposableIncome(disposableIncome: disposable_income,),

        ],
      ),
    );
  }

  fetchData() async
  {
    var response  = (await Api().getDashboard_Data(context))!;
    if (response!=null)
    {
      var newResponse = json.decode(response);
      ConsoleLogUtils.printLog('homeResponse:$newResponse');
      dynamic jsonData = jsonDecode(response);
      disposable_income = jsonData['data']['disposable_income'];

      return json.decode(response);
    } else {
      throw Exception('Failed to load data');
    }


  }

}
class DisposableIncome extends StatelessWidget
{


  DisposableIncome({required this.disposableIncome});
  dynamic disposableIncome;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          margin: EdgeInsets.only(left: 5,top: 10),
          child: Text(
                'Your Disposable Income',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue.shade900,


              ),
            ),
        ),
          SizedBox(height: 20),
          IncomeDetail(
            width: 100.0,
            label: 'SALARY:',
            amount:Constants.indianNumberFormat.format(disposableIncome['salary']),
            labelBackgroundColor: Colors.purple,
            amountBackgroundColor: Colors.blue.shade900,
          ),
          SizedBox(height: 10),
          IncomeDetail(
            width: 80.0,
            label: 'FOIR* AMOUNT:',
            amount:Constants.indianNumberFormat.format(disposableIncome['foir_amount']),
            labelBackgroundColor: Colors.purple,
            amountBackgroundColor: Colors.blue.shade800,
          ),
          SizedBox(height: 10),
          IncomeDetail(
            width: 70.0,
            label: 'CURRENT EMIS:',
            amount: Constants.indianNumberFormat.format(disposableIncome['existing_emi']),
            labelBackgroundColor: Colors.purple,
            amountBackgroundColor: Colors.blue.shade700,
          ),
          SizedBox(height: 10),
          IncomeDetail(
            width: 60.0,
            label: 'ELIGIBLE EMI:',
            amount:   formatEligibleAmount(disposableIncome['eligible_amount']),
            labelBackgroundColor: Colors.purple,
            amountBackgroundColor: Colors.blue.shade600,
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              '* FOIR\nFixed Obligation to Income Ratio (FOIR) is calculated by banks and lending companies to assess your loan eligibility based on your current monthly disposable income.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Function to format the eligible amount
String formatEligibleAmount(dynamic eligibleAmount) {
  // Check if the amount is a number
  if (eligibleAmount is num) {
    return Constants.indianNumberFormat.format(eligibleAmount);
  } else {
    // Handle the case when the value is not a number (e.g., "NA")
    return eligibleAmount.toString();
  }
}

class IncomeDetail extends StatelessWidget {
  final String label;
  final String amount;
  final double width;
  final Color labelBackgroundColor;
  final Color amountBackgroundColor;

  IncomeDetail({
    required this.label,
    required this.amount,
    required this.labelBackgroundColor,
    required this.amountBackgroundColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context)
  {
    return Row(
      children: [
        Container(
            width: 120,
            margin: EdgeInsets.only(right: 5),
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Color.fromRGBO(51, 184, 255, 1.0),
                  Color.fromRGBO(112, 0, 224, 1),
                ],
              ),
              // color: labelBackgroundColor,
              borderRadius: BorderRadius.circular(8.0),

            ),

            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
         // Adjust this flex value to change the width of the label part
           Expanded(child:
           Container(

             padding: EdgeInsets.all(14.0),
             decoration: BoxDecoration(
               color: amountBackgroundColor,
               borderRadius: BorderRadius.circular(8.0),

             ),

               width: width,
               child: Center(
                 child: Text(
                   amount,
                   style: GoogleFonts.roboto(
                     fontSize: 12,
                     color: Colors.white,
                     fontWeight: FontWeight.w500,
                   ),
                   textAlign: TextAlign.right,
                 ),
               ),

           ),
           ),

      ],
    );
  }
}

