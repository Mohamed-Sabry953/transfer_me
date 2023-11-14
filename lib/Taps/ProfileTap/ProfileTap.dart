import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/Shared/Constant/Constant.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileCubit.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileStates.dart';
import 'package:transfer_me/Taps/ProfileTap/ProfileInfoItem.dart';

import '../../models/UserModel.dart';

class ProfileTap extends StatelessWidget {
  static const String routeName = 'ProfileTap';

  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as UserModel;
    return BlocProvider<ProfileCubit>(
      lazy: false,
      create: (context) => ProfileCubit()..getProfileDataFromFirebase(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              drawer: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r))),
                margin: REdgeInsets.only(right: 100),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: REdgeInsets.only(top: 43, left: 38,bottom: 50),
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
                            backgroundImage: NetworkImage(
                                args.profileImage??''),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${args.firstname} ${args.lastname}",
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 20.sp,
                          fontFamily: 'San Francisco Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.only(top: 6.0, left: 9),
                        child: Text(
                          args.Email??"",
                          style: TextStyle(
                            color: Color(0xFF827F7F),
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
                          Icon(
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
                          onPressed: () {
                            ProfileCubit.get(context).Logout(context);
                          },
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
                                SizedBox(width: 7.w,),
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
              ),
              backgroundColor: Colors.white,
              body: state is SetProfileGetDataFromFirebaseSuccsesState
                  ? Container(
                    padding: REdgeInsets.only(
                        top: 15, left: 22, right: 22),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 63.w,
                                height: 42.h,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF5164BF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Center(
                              child: Text('Profile Settings',
                                  style: Constant.stringStyle(
                                      20.sp,
                                      FontWeight.w600,
                                      const Color(0xFF1E1E1E),
                                      0.0)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text('Your Profile Information',
                              style: Constant.stringStyle(
                                  18.sp,
                                  FontWeight.w500,
                                  const Color(0xFF878787),
                                  0.0)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Container(
                              width: 135.w,
                              height: 135.h,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF5063BF),
                                shape: OvalBorder(),
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    ProfileCubit.get(context)
                                            .userModel
                                            .profileImage ??
                                        ''),
                              )),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Opacity(
                          opacity: 0.80,
                          child: Text(
                            'Personal Information',
                            style: TextStyle(
                              color: const Color(0xFF5164BF),
                              fontSize: 17.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ProfileInfoItem(
                            ProfileCubit.get(context)
                                .userModel
                                .accountNo
                                .toString(),
                            "Account Number"),
                        SizedBox(
                          height: 5.h,
                        ),
                        ProfileInfoItem(
                            "${ProfileCubit.get(context).userModel.firstname} ${ProfileCubit.get(context).userModel.lastname}",
                            "Username"),
                        SizedBox(
                          height: 5.h,
                        ),
                        ProfileInfoItem(
                            ProfileCubit.get(context).userModel.Email??"",
                            "Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        ProfileInfoItem(
                            ProfileCubit.get(context)
                                .userModel
                                .phoneNo
                                .toString(),
                            "Mobile Phone"),
                        SizedBox(
                          height: 5.h,
                        ),
                        ProfileInfoItem("Gotham Road 21...", 'Address'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Opacity(
                            opacity: 0.80,
                            child: Text('Security',
                                style: TextStyle(
                                  color: Color(0xFF5164BF),
                                  fontSize: 17,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w700,
                                ))),
                        SizedBox(height: 10.h,),
                        Container(
                          width: 331.w,
                          height: 38.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Padding(
                            padding:  REdgeInsets.only(right: 10,left: 20),
                            child: Row(
                              children: [
                                Text(
                                    'Change Pin',
                                    style:
                                    Constant.stringStyle(12.sp, FontWeight.w400, const Color(0xFF5164BF), 0.0)
                                ),
                                const Spacer(),
                                const Opacity(
                                  opacity: 0.40,
                                  child: Icon(Icons.arrow_forward_ios),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Container(
                          width: 331.w,
                          height: 38.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Padding(
                            padding:  REdgeInsets.only(right: 10,left: 20),
                            child: Row(
                              children: [
                                Text(
                                    'Change Password',
                                    style:
                                    Constant.stringStyle(12.sp, FontWeight.w400, const Color(0xFF5164BF), 0.0)
                                ),
                                const Spacer(),
                                const Opacity(
                                  opacity: 0.40,
                                  child: Icon(Icons.arrow_forward_ios),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Container(
                          width: 331.w,
                          height: 38.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Padding(
                            padding:  REdgeInsets.only(right: 10,left: 20),
                            child: Row(
                              children: [
                                Text(
                                    'Finger Print',
                                    style:
                                    Constant.stringStyle(12.sp, FontWeight.w400, const Color(0xFF5164BF), 0.0)
                                ),
                                const Spacer(),
                                 Container(
                                   width: 40.w,
                                   height: 21.h,
                                   decoration: ShapeDecoration(
                                     color:ProfileCubit.get(context).count.isOdd?Color(0xFF5164BF):Colors.black,
                                     shape: RoundedRectangleBorder(
                                       borderRadius:
                                       BorderRadius.circular(20.r),
                                     ),
                                   ),
                                   child: InkWell(
                                     onTap: () {
                                       ProfileCubit.get(context).fingerPrint(1);
                                     },
                                     child: Row(
                                       children: [
                                         SizedBox(
                                           width: ProfileCubit.get(context).count.isOdd?19.5.w:0,
                                         ),
                                         Container(
                                           width: 20.w,
                                           height: 20.h,
                                           decoration: BoxDecoration(shape: BoxShape.circle,
                                             color: ProfileCubit.get(context).count.isOdd?Colors.white:Color(0xFF5164BF)
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : Center(child: CircularProgressIndicator()),
            ),
          );
        },
        listener: (context, state) {
          if (state is SetProfileGetDataFromFirebaseLoadingState) {}
        },
      ),
    );
  }
}
