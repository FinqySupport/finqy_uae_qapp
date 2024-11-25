

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';




class RewardTopAppbar extends StatefulWidget {
  const RewardTopAppbar({Key? key}) : super(key: key);

  @override
  _RewardTopAppbar createState() => _RewardTopAppbar();
}
class _RewardTopAppbar extends State<RewardTopAppbar>with SingleTickerProviderStateMixin {


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

        ],
      ),

    );
  }



}

