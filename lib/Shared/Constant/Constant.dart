import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Constant{
   static TextStyle stringStyle(double size,FontWeight fontWeight,Color color,double decorationThickness){
     TextStyle style = TextStyle(
       fontSize: size,
       fontWeight: fontWeight,
       color: color,
       fontFamily: 'San Francisco Display',
       decorationThickness: decorationThickness,
     );
     return style;
   }
   static Widget errorMassage(BuildContext context,String text){
     return Center(
       child: Container(
         width: 250.w,
         height: 170.h,
         decoration: BoxDecoration(
           color: Colors.white,
           shape: BoxShape.rectangle,
           borderRadius: BorderRadius.circular(12.r),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(
               height: 10.h,
             ),
             Text(
               "error",
               style: Constant.stringStyle(
                   22.sp, FontWeight.w600, Colors.black, 0.0),
             ),
             Divider(
               thickness: 1,
               color: Colors.red,
               indent: 50.w,
               endIndent: 50.w,
             ),
             SizedBox(
               height: 15.h,
             ),
             Center(
               child: Text(
                 text,
                 style: Constant.stringStyle(
                     16.sp, FontWeight.w300, Colors.black, 0.0),
               ),
             ),
             SizedBox(height: 20.h,),
             ElevatedButton(onPressed: () {
               Navigator.pop(context);
             },
               style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                   fixedSize: Size(90.w, 40.h)), child: Center(
                 child: Text("Close",style: Constant.stringStyle(
                   16.sp, FontWeight.w300, Colors.white, 0.0,),),
               ),
             )
           ],
         ),
       ),
     );
   }
}