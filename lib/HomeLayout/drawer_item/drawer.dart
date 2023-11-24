import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/models/UserModel.dart';

class DrawerItem extends StatelessWidget {

  UserModel args;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r),
              bottomRight: Radius.circular(25.r))),
      margin: REdgeInsets.only(right: 100),
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: REdgeInsets.only(top: 43, left: 38, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 85.w,
                height: 85.h,
                decoration: const ShapeDecoration(
                  color: Color(0xFF5063BF),
                  shape: OvalBorder(),
                ),
                child: CircleAvatar(
                  backgroundImage:
                  NetworkImage(args.profileImage ?? ''),
                )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "${args.firstname} ${args.lastname}",
              style: TextStyle(
                color: const Color(0xFF1E1E1E),
                fontSize: 20.sp,
                fontFamily: 'San Francisco Display',
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 6.0, left: 9),
              child: Text(
                args.Email ?? "",
                style: TextStyle(
                  color: const Color(0xFF827F7F),
                  fontSize: 16.sp,
                  fontFamily: 'San Francisco Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0xff8EDFEB),
                  size: 25,
                ),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  'My Wallet',
                  style: TextStyle(
                    color: const Color(0xFF1E1E1E),
                    fontSize: 18.sp,
                    fontFamily: 'San Francisco Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person_pin,
                  color: Color(0xff8EDFEB),
                  size: 25,
                ),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: const Color(0xFF1E1E1E),
                    fontSize: 18.sp,
                    fontFamily: 'San Francisco Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                const Icon(
                  Icons.insert_chart_outlined_rounded,
                  color: Color(0xff8EDFEB),
                  size: 25,
                ),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  'Statistics',
                  style: TextStyle(
                    color: const Color(0xFF1E1E1E),
                    fontSize: 18.sp,
                    fontFamily: 'San Francisco Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                const Icon(
                  Icons.compare_arrows,
                  color: Color(0xff8EDFEB),
                  size: 25,
                ),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  'Transfer',
                  style: TextStyle(
                    color: const Color(0xFF1E1E1E),
                    fontSize: 18.sp,
                    fontFamily: 'San Francisco Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                const Icon(
                  Icons.settings,
                  color: Color(0xff8EDFEB),
                  size: 25,
                ),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: const Color(0xFF1E1E1E),
                    fontSize: 18.sp,
                    fontFamily: 'San Francisco Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(175.w, 59.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  backgroundColor: const Color(0xFF5164BF),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontFamily: 'San Francisco Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  DrawerItem(this.args, {super.key});
}
