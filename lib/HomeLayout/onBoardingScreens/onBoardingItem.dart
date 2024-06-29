import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatefulWidget {

   String pic;
   String text;
   String textTwo;
  @override
  State<OnBoardingItem> createState() => _OnBoardingItemState();

   OnBoardingItem(this.pic, this.text, this.textTwo);
}

class _OnBoardingItemState extends State<OnBoardingItem> {
  @override
  void initState(){
    super.initState();
    animation();
  }
  void animation(){
    Timer.periodic(Duration(milliseconds: 300), (Timer timer) {
      setState(() {
  myHeight=370;
  myWidth=370;
  x=0;
  timer.cancel();
      });
    });
  }
   double myHeight=60;
   double myWidth=60;
   double x=-1000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(height: 12.h,),
        AnimatedContainer(
          height: myHeight,
      width: myWidth,
      duration: Duration(milliseconds: 400),child: Image(image: AssetImage(widget.pic)),),
        SizedBox(height: 30.h,),
        AnimatedContainer(duration: Duration(milliseconds: 700),
    child: Text(
      widget.text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF1E1E1E),
        fontSize: 30.sp,
        fontFamily: 'San Francisco Display',
        fontWeight: FontWeight.w700,
      ),
    ),
    transform: Matrix4.translationValues(x, 0, 0)),
        SizedBox(height: 15.h,),
        AnimatedContainer(
          transform: Matrix4.translationValues(x, 0, 0),
          duration: Duration(milliseconds: 900),child: Text(
          widget.textTwo,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF878787),
            fontSize: 13.sp,
            fontFamily: 'San Francisco Display',
            fontWeight: FontWeight.w500,
          ),
        ),),
      ],
    );
  }
}
