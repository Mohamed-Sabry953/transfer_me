import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/Taps/HomeTap/Home.dart';
import 'package:transfer_me/Taps/MyWalletTap/MyWallet.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileStates.dart';

import '../Taps/ProfileTap/Cubit/ProfileCubit.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Homelayout';

  HomeLayout({super.key});

  List<Icon> BottomNav = [
    Icon(
      Icons.home_sharp,
      color: Color(0xff8EDFEB),
      size: 25,
    ),
    Icon(
      Icons.account_balance_wallet_outlined,
      color: Color(0xff8EDFEB),
      size: 25,
    ),
    Icon(
      Icons.insert_chart_outlined_rounded,
      color: Color(0xff8EDFEB),
      size: 25,
    ),
    Icon(
      Icons.person_pin,
      color: Color(0xff8EDFEB),
      size: 25,
    ),
  ];
  List<Widget> Taps = [HomeTap(), MyWalletTap(), MyWalletTap()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: BlocProvider(
          create: (context) => HomeLayoutCubit()..getProfileDataFromFirebase(),
          child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r))),
                margin: REdgeInsets.only(right: 100),
                height: double.infinity,
                width: double.infinity,
                child: state is ProfileGetDataFromFirebaseSuccsesState?Padding(
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
                            backgroundImage: NetworkImage(
                                HomeLayoutCubit.get(context)
                                        .userModel
                                        .profileImage ??
                                    ''),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${HomeLayoutCubit.get(context).userModel.firstname} ${HomeLayoutCubit.get(context).userModel.lastname}",
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
                          HomeLayoutCubit.get(context).userModel.Email??"",
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
                      BlocBuilder<ProfileCubit,ProfileStates>(builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              ProfileCubit.get(context).Logout(context);
                              GoogleSignIn().signOut();
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
                            ));
                      },)
                    ],
                  ),
                ):const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            listener: (context, state) {},
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        body: BlocProvider(
            create: (context) =>
                HomeLayoutCubit()..getProfileDataFromFirebase(),
            child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
              builder: (context, state) {
                return Stack(
                  children: [
                    Taps[HomeLayoutCubit.get(context).Currentindex],
                    Positioned(
                      bottom: 20.h,
                      right: 24.w,
                      left: 24.w,
                      child: Container(
                        padding: REdgeInsets.only(left: 33),
                        width: 327.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: Color(0xff5164BF),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    HomeLayoutCubit.get(context).changeIndex(
                                      index,
                                      context,
                                      HomeLayoutCubit.get(context).userModel.Email??"",
                                        HomeLayoutCubit.get(context).userModel.profileImage??"",
                                        HomeLayoutCubit.get(context).userModel.firstname??"",
                                        HomeLayoutCubit.get(context).userModel.lastname??"",
                                    );
                                  },
                                  child: Container(
                                      margin:
                                          REdgeInsets.only(top: 17, bottom: 10),
                                      width: 44,
                                      height: 80,
                                      decoration: ShapeDecoration(
                                        color: HomeLayoutCubit.get(context)
                                                    .Currentindex ==
                                                index
                                            ? Colors.white
                                            : Color(0xff5164BF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: BottomNav[index]));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 35.w,
                              );
                            },
                            itemCount: 4),
                      ),
                    ),
                  ],
                );
              },
              listener: (context, state) {
                if (state is ChangeIndexStates) {}
              },
            )),
      ),
    );
  }
}
