import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomingTransItem extends StatelessWidget {
  const IncomingTransItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: 157.w,
      height: 197.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: REdgeInsets.only(top: 15.0),
            child: Image(image: AssetImage('assets/images/lightchart.png'),fit: BoxFit.fill,width: double.infinity.w,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/paypal.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(64.r),
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 40.w,
                            ),
                            Image(image: AssetImage('assets/images/arrowtop.png'))
                          ],
                        ),
                        Text('+ \$62.54',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF8EDFEB),
                              fontSize: 16,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: REdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Opacity(
                    opacity: 0.60,
                    child: Text('From',
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 10,
                          fontFamily: 'San Francisco Display',
                          fontWeight: FontWeight.w500,
                        ))),
              ),
              Padding(
            padding: REdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text('John\nMorrison',
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 12,
                  fontFamily: 'San Francisco Display',
                  fontWeight: FontWeight.w700,
                )),
          ),
            ],
          ),
        ],
      ),
    );
  }
}
