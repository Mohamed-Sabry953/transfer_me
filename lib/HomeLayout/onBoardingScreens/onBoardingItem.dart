import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {

   String pic;
   String text;
   String textTwo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
         Image(image: AssetImage(pic)),
        SizedBox(height: 18.h,),
    Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Color(0xFF1E1E1E),
    fontSize: 30.sp,
    fontFamily: 'San Francisco Display',
    fontWeight: FontWeight.w700,
    ),
    ),
        SizedBox(height: 12.h,),
        Text(
          textTwo,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF878787),
            fontSize: 13.sp,
            fontFamily: 'San Francisco Display',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

   OnBoardingItem(this.pic, this.text, this.textTwo);
}
