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
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(width: 10.w,),
                 Text(
                   "error",
                   style: Constant.stringStyle(
                       22.sp, FontWeight.w600, Colors.black, 0.0),
                 ),
                 SizedBox(width: 5.w,),
                 Icon(Icons.error_outline,size: 25.w,color: Colors.red,),
               ],
             ),
             Divider(
               thickness: 1,
               color: Colors.red,
               indent: 50.w,
               endIndent: 50.w,
             ),
             const Spacer(),
             Text(
               text,
               style: Constant.stringStyle(
                   18.sp, FontWeight.w400, Colors.black, 0.0),
             ),
             SizedBox(height: 10.h,),
             const Spacer(),
             ElevatedButton(onPressed: () {
               Navigator.pop(context);
             },
               style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                   fixedSize: Size(90.w, 40.h)), child: Center(
                 child: Text("Close",style: Constant.stringStyle(
                   16.sp, FontWeight.w300, Colors.white, 0.0,),),
               ),
             ),
             SizedBox(height: 10.h,)
           ],
         ),
       ),
     );
   }
}