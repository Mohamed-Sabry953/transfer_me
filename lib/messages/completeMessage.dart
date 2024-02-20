import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteMessage extends StatelessWidget {
   CompleteMessage(this.text,this.size,this.padding,{super.key});
  String text;
  double size;
  double padding;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: REdgeInsets.only(bottom: 240,right: 50,left: 50,top: size),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 0.7.w),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70.h,),
              Center(
                child: Text(text,
                    style: TextStyle(
                        decorationThickness: 0,
                        fontSize: 14.sp,
                        color: Colors.black
                    )),
              ),
              SizedBox(height: 37.h,),
              Container(
                decoration:  BoxDecoration(
                  border: BorderDirectional(
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(12.r),bottomStart: Radius.circular(12.r)),
                  child: ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  },style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 50.h),
                      backgroundColor: Colors.green,
                      elevation: 0.2
                  ), child: Center(
                    child: Text("Ok",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: REdgeInsets.only(top: padding,left: 143),
          child: Container(
            width: 80.w,
            height: 80.h,
            decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
            ),
            child: const Center(child: Icon(Icons.task_alt,size: 60,color: Colors.white,)),
          ),
        ),
      ],
    );
  }
}
