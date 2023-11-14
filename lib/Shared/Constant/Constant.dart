import 'package:flutter/material.dart';
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
}