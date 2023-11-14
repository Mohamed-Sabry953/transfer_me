import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/Shared/Constant/Constant.dart';

class ProfileInfoItem extends StatelessWidget {

  String Info;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 38.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFF4F4F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Padding(
        padding:  REdgeInsets.only(right: 20,left: 20),
        child: Row(
          children: [
            Text(
              title,
              style:
              Constant.stringStyle(12.sp, FontWeight.w400, const Color(0xFF5164BF), 0.0)
            ),
            const Spacer(),
            Opacity(
              opacity: 0.40,
              child: Text(
                Info,
                textAlign: TextAlign.right,
                style:
                Constant.stringStyle(12.sp, FontWeight.w400, const Color(0xFF001A4C), 0.0)
              ),
            )
          ],
        ),
      ),
    );
  }

  ProfileInfoItem(this.Info, this.title);
}
