import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';

class SuccsesSignupScreen extends StatelessWidget {
  static const String routeName = 'SuccsesSignupScreen';

  const SuccsesSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 120.h,
              ),
              Container(
                width: 15.w,
                height: 15.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff8EDFEB).withOpacity(0.8)),
              ),
            ],
          ),
          SizedBox(
            height: 18.w,
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 208.w,
                    height: 208.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff8EDFEB).withOpacity(0.9)),
                    child: Center(
                        child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 120,
                      weight: 1000,
                    )),
                  ),
                  Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff8EDFEB).withOpacity(0.5)),
                  ),
                ],
              ),
              Padding(
                padding: REdgeInsets.only(top: 120, left: 50),
                child: Container(
                  width: 9.w,
                  height: 9.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff8EDFEB).withOpacity(0.5)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70.h,
          ),
          Text(
            'Congrats!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF5166BF),
                fontSize: 55.sp,
                fontFamily: 'San Francisco Display',
                fontWeight: FontWeight.w700,
                decorationThickness: 0),
          ),
          SizedBox(
            height: 30.h,
          ),
          Opacity(
              opacity: 0.60,
              child: Text(
                'Account Registed\nSuccessfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF5166BF),
                    fontSize: 16.sp,
                    fontFamily: 'San Francisco Display',
                    fontWeight: FontWeight.w600,
                    decorationThickness: 0),
              )),
          SizedBox(
            height: 45.h,
          ),
          Container(
            width: 153.w,
            height: 59.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context,  HomeLayout.routeName, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5166BF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              child: Text(
                'Great!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'San Francisco Display',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  decorationThickness: 0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
